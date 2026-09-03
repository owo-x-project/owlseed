# skill.awk -- spec and policy checks for one SKILL.md.
#
# Usage: awk -v rel=<path to show in messages> -v expect=<directory name> \
#            -f skill.awk SKILL.md
#
# Checked against the Agent Skills specification (agentskills.io):
#   name           1-64 chars, [a-z0-9-], no leading, trailing or consecutive
#                  hyphen, and must equal the parent directory name
#   description    1-1024 chars, non-empty
#   compatibility  <=500 chars if present
#   metadata       map of string -> string
#   frontmatter    must not contain < or > (prompt-injection hazard)
#   body           <=500 lines
#
# Checked against owlseed policy (see AGENTS.md):
#   no allowed-tools -- the field is experimental and runtime-dependent, so
#   depending on it would cost the portability owlseed exists for.
#
# The frontmatter owlseed ships is deliberately flat enough to parse without a
# YAML library: 'key: value' pairs, plus one level of indented nesting.
#
# Runs under LC_ALL=C, so length() counts bytes; utf8len() converts that to
# characters by discounting UTF-8 continuation bytes. Exits 1 if anything
# printed an ERROR.

BEGIN {
    MAX_NAME = 64
    MAX_DESCRIPTION = 1024
    MAX_COMPATIBILITY = 500
    MAX_BODY_LINES = 500

    split("name description license compatibility metadata allowed-tools", k, " ")
    for (i in k) known[k[i]] = 1

    for (i = 128; i < 192; i++) continuation[sprintf("%c", i)] = 1

    state = 0   # 0 before the opening fence, 1 inside frontmatter, 2 body
}

NR == 1 {
    if ($0 == "---") { state = 1; next }
    fail("SKILL.md must begin with a '---' frontmatter fence")
    state = 2
    body = 1
    next
}

state == 1 {
    if ($0 == "---") { state = 2; next }
    raw[++nraw] = $0
    next
}

state == 2 { body++ }

END {
    if (state == 1) { fail("frontmatter fence is never closed"); exit 1 }

    parse_frontmatter()

    for (key in seen) {
        if (!(key in known))
            warn("unknown frontmatter key '" key "' (spec-compliant runtimes ignore it)")
        if (key == "allowed-tools")
            fail("frontmatter key 'allowed-tools' is forbidden by owlseed policy (experimental, runtime-dependent)")
    }

    check_name()
    check_description()
    check_compatibility()
    check_metadata()

    if (body > MAX_BODY_LINES)
        fail("body is " body " lines, keep it under " MAX_BODY_LINES)
    else
        printf("  body:        %d/%d lines\n", body, MAX_BODY_LINES)

    exit errors > 0 ? 1 : 0
}

function fail(msg) { printf("ERROR   %s: %s\n", rel, msg); errors++ }
function warn(msg) { printf("warn    %s: %s\n", rel, msg) }

function trim(s) {
    sub(/^[ \t]+/, "", s)
    sub(/[ \t]+$/, "", s)
    return s
}

function unquote(s,   q) {
    q = substr(s, 1, 1)
    if ((q == "\"" || q == "'") && length(s) >= 2 && substr(s, length(s), 1) == q)
        return substr(s, 2, length(s) - 2)
    return s
}

function utf8len(s,   i, n, extra) {
    n = length(s)
    extra = 0
    for (i = 1; i <= n; i++)
        if (substr(s, i, 1) in continuation) extra++
    return n - extra
}

function parse_frontmatter(   i, line, s, colon, key, val, owner) {
    owner = ""
    for (i = 1; i <= nraw; i++) {
        line = raw[i]
        if (index(line, "<") || index(line, ">"))
            fail("frontmatter contains an angle bracket; the spec forbids < and >")
        if (line ~ /^[ \t]*$/ || line ~ /^[ \t]*#/) continue

        s = trim(line)
        colon = index(s, ":")
        if (colon == 0) {
            fail("line " (i + 1) ": not a 'key: value' pair -> " s)
            continue
        }
        key = trim(substr(s, 1, colon - 1))
        val = unquote(trim(substr(s, colon + 1)))

        if (line ~ /^[ \t]/) {
            if (owner == "") { fail("line " (i + 1) ": indented key outside a mapping"); continue }
            nested[owner "." key] = val
            nestedkeys[owner] = nestedkeys[owner] " " key
            continue
        }
        seen[key] = 1
        if (val == "") { ismap[key] = 1; owner = key; continue }
        owner = ""
        value[key] = val
    }
}

function check_name(   name) {
    if (!("name" in seen) || value["name"] == "") { fail("missing required field 'name'"); return }
    name = value["name"]
    if (length(name) > MAX_NAME)
        fail("name is " length(name) " chars, limit is " MAX_NAME)
    if (name !~ /^[a-z0-9]+(-[a-z0-9]+)*$/)
        fail("name '" name "' must be lowercase alphanumerics joined by single hyphens")
    if (expect != "" && name != expect)
        fail("name '" name "' must equal the directory name '" expect "'")
}

function check_description(   n) {
    if (!("description" in seen) || trim(value["description"]) == "") {
        fail("missing required field 'description'")
        return
    }
    n = utf8len(value["description"])
    if (n > MAX_DESCRIPTION)
        fail("description is " n " chars, limit is " MAX_DESCRIPTION)
    else
        printf("  description: %d/%d chars\n", n, MAX_DESCRIPTION)
}

function check_compatibility(   n) {
    if (!("compatibility" in seen)) return
    n = utf8len(value["compatibility"])
    if (n > MAX_COMPATIBILITY)
        fail("compatibility is " n " chars, limit is " MAX_COMPATIBILITY)
}

function check_metadata(   parts, i, key) {
    if (!("metadata" in seen)) return
    if (!("metadata" in ismap)) {
        fail("'metadata' must be a mapping of string keys to string values")
        return
    }
    split(nestedkeys["metadata"], parts, " ")
    for (i in parts) {
        key = parts[i]
        if (key == "") continue
        if (nested["metadata." key] == "")
            fail("metadata." key " must be a non-empty string")
    }
}
