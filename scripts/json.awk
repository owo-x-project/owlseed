# json.awk -- validate a JSON document and flatten it.
#
# Usage: awk -f json.awk FILE
#
# Prints one "path<TAB>value" line per scalar, where path is dotted and array
# elements are numbered from zero (plugins.0.source). Exits non-zero on a
# malformed document, having printed a line starting with '!' saying why.
#
# POSIX awk only: this replaces the jq dependency the manifest checks used to
# have. Small manifests only -- it holds the whole document in memory and
# indexes it a byte at a time.

{ doc = doc $0 "\n" }

END {
    len = length(doc)
    pos = 1
    skip_ws()
    if (pos > len) err("document is empty")
    parse_value("")
    skip_ws()
    if (pos <= len) err("trailing content at byte " pos)
    printf("%s", out)
    exit 0
}

function err(msg) {
    printf("!%s\n", msg)
    exit 1
}

function skip_ws(   c) {
    while (pos <= len) {
        c = substr(doc, pos, 1)
        if (c == " " || c == "\t" || c == "\n" || c == "\r") pos++
        else return
    }
}

# Buffered, so that a document which turns out to be malformed halfway through
# prints its error and nothing else.
function emit(path, value) {
    gsub(/[\n\t]/, " ", value)
    out = out path "\t" value "\n"
}

function parse_value(path,   c) {
    skip_ws()
    if (pos > len) err("unexpected end of document")
    c = substr(doc, pos, 1)
    if (c == "{") { parse_object(path); return }
    if (c == "[") { parse_array(path); return }
    if (c == "\"") { emit(path, parse_string()); return }
    if (c == "-" || (c >= "0" && c <= "9")) { emit(path, parse_number()); return }
    if (substr(doc, pos, 4) == "true")  { pos += 4; emit(path, "true");  return }
    if (substr(doc, pos, 5) == "false") { pos += 5; emit(path, "false"); return }
    if (substr(doc, pos, 4) == "null")  { pos += 4; emit(path, "null");  return }
    err("unexpected character '" c "' at byte " pos)
}

function parse_object(path,   key, child, c) {
    pos++
    skip_ws()
    if (substr(doc, pos, 1) == "}") { pos++; return }
    while (1) {
        skip_ws()
        key = parse_string()
        skip_ws()
        if (substr(doc, pos, 1) != ":") err("expected ':' at byte " pos)
        pos++
        child = (path == "") ? key : path "." key
        parse_value(child)
        skip_ws()
        c = substr(doc, pos, 1)
        if (c == ",") { pos++; continue }
        if (c == "}") { pos++; return }
        err("expected ',' or '}' at byte " pos)
    }
}

function parse_array(path,   n, child, c) {
    pos++
    skip_ws()
    if (substr(doc, pos, 1) == "]") { pos++; return }
    n = 0
    while (1) {
        child = (path == "") ? n : path "." n
        parse_value(child)
        n++
        skip_ws()
        c = substr(doc, pos, 1)
        if (c == ",") { pos++; continue }
        if (c == "]") { pos++; return }
        err("expected ',' or ']' at byte " pos)
    }
}

function parse_string(   out, c, e, h) {
    if (substr(doc, pos, 1) != "\"") err("expected a string at byte " pos)
    pos++
    out = ""
    while (1) {
        if (pos > len) err("unterminated string")
        c = substr(doc, pos, 1)
        if (c == "\"") { pos++; return out }
        if (c == "\\") {
            pos++
            e = substr(doc, pos, 1)
            pos++
            if (e == "\"" || e == "\\" || e == "/") out = out e
            else if (e == "n") out = out "\n"
            else if (e == "t") out = out "\t"
            else if (e == "r") out = out "\r"
            else if (e == "b") out = out sprintf("%c", 8)
            else if (e == "f") out = out sprintf("%c", 12)
            else if (e == "u") {
                h = substr(doc, pos, 4)
                if (h !~ /^[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]$/)
                    err("bad \\u escape at byte " pos)
                pos += 4
                out = out "?"
            }
            else err("unknown escape '\\" e "' at byte " (pos - 2))
            continue
        }
        out = out c
        pos++
    }
}

function parse_number(   rest, tok) {
    rest = substr(doc, pos)
    if (match(rest, /^-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][-+]?[0-9]+)?/) == 0)
        err("expected a number at byte " pos)
    tok = substr(rest, 1, RLENGTH)
    pos += RLENGTH
    return tok
}
