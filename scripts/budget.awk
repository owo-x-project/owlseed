# Estimates a Markdown file's context cost and warns when it exceeds its budget.
#
# Usage: awk -v rel=<path to show in messages> -v limit=<budget in English words> \
#            -f scripts/budget.awk FILE
#
# The budget applies to the committed English text (AGENTS.md). English is
# estimated at 1.4 tokens per word and CJK at 0.95 tokens per character. A file
# whose CJK characters outnumber its English words is an untranslated draft: it
# is reported and not judged.
#
# Runs under LC_ALL=C, so length() counts bytes. UTF-8 continuation bytes
# (128-191) are counted separately, which makes every remaining non-ASCII byte
# the lead byte of exactly one multi-byte character.

BEGIN {
    for (i = 1; i < 128; i++) ascii[sprintf("%c", i)] = 1
    for (i = 128; i < 192; i++) continuation[sprintf("%c", i)] = 1
    DESC_LIMIT = 70
}

FNR == 1 && $0 == "---" { infm = 1; next }
infm && $0 == "---" { infm = 0; next }
infm {
    if ($0 ~ /^description:/) {
        s = $0
        sub(/^description:[ \t]*/, "", s)
        dwords = words(s)
        dchars = wide(s)
    }
    next
}
{ bwords += words($0); bchars += wide($0) }

END {
    report("description", dwords, dchars, DESC_LIMIT)
    report("body", bwords, bchars, limit)
    exit 0
}

function report(what, w, c, lim,   est, budget) {
    if (w == 0 && c == 0) return
    est = w * 1.4 + c * 0.95
    budget = lim * 1.4
    if (c > w) {
        printf("  %s: est %d tokens, untranslated draft; budget %d applies after translation\n",
               what, est, budget)
        return
    }
    printf("  %s: %d words, est %d/%d tokens\n", what, w, est, budget)
    if (est > budget)
        printf("warn    %s: %s is est %d tokens against a budget of %d\n", rel, what, est, budget)
}

function words(s,   n, i, parts, c) {
    n = split(s, parts, /[ \t]+/)
    c = 0
    for (i = 1; i <= n; i++)
        if (parts[i] ~ /[A-Za-z0-9]/) c++
    return c
}

function wide(s,   i, n, ch, c) {
    n = length(s)
    c = 0
    for (i = 1; i <= n; i++) {
        ch = substr(s, i, 1)
        if (!(ch in ascii) && !(ch in continuation)) c++
    }
    return c
}
