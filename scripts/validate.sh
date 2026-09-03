#!/bin/sh
# Everything that must be true before a commit lands.
#
# POSIX sh and POSIX awk only -- no bash, no Python, no jq, no network, no
# model calls. The checks have to run anywhere owlseed might be developed, and
# they have to cost nothing.
set -u
LC_ALL=C
export LC_ALL

cd "$(dirname "$0")/.." || exit 1
status=0

echo "== skill spec and policy"
found=0
for root in skills i18n/*; do
    [ -d "$root" ] || continue
    for skill in "$root"/*; do
        [ -d "$skill" ] || continue
        if [ ! -f "$skill/SKILL.md" ]; then
            echo "warn    $skill: no SKILL.md; every runtime ignores this directory"
            continue
        fi
        found=$((found + 1))
        echo "$skill"

        name=${skill##*/}
        awk -v rel="$skill/SKILL.md" -v expect="$name" -f scripts/skill.awk \
            "$skill/SKILL.md" || status=1

        # policy: the seed ships Markdown only, no bundled scripts or assets
        offenders=$(find "$skill" -type f ! -name '*.md')
        if [ -n "$offenders" ]; then
            echo "$offenders" | while IFS= read -r file; do
                echo "ERROR   $file: owlseed ships Markdown only (no scripts or assets)"
            done
            status=1
        fi

        # references must resolve, and stay shallow
        refs=$(awk '{
            line = $0
            while (match(line, /`references\/[A-Za-z0-9_.\/-]+\.md`/)) {
                print substr(line, RSTART + 1, RLENGTH - 2)
                line = substr(line, RSTART + RLENGTH)
            }
        }' "$skill/SKILL.md" | sort -u)
        for ref in $refs; do
            [ -e "$skill/$ref" ] && continue
            echo "ERROR   $skill/SKILL.md: referenced file does not exist: $ref"
            status=1
        done
        find "$skill" -name '*.md' | awk -v base="$skill" '{
            rel = substr($0, length(base) + 2)
            depth = gsub(/\//, "/", rel)
            if (depth > 2)
                printf("warn    %s: nested %d levels below the skill root; keep references shallow\n", $0, depth)
        }'
    done
done
if [ "$found" -eq 0 ]; then
    echo "ERROR   no skill with a SKILL.md was found under skills/"
    status=1
fi

echo
echo "== plugin manifests"
for manifest in .claude-plugin/marketplace.json .claude-plugin/plugin.json; do
    [ -f "$manifest" ] || continue
    if flat=$(awk -f scripts/json.awk "$manifest"); then
        echo "ok      $manifest is valid JSON"
    else
        echo "ERROR   $manifest is not valid JSON: ${flat#!}"
        status=1
        continue
    fi
    [ "$manifest" = .claude-plugin/marketplace.json ] || continue
    sources=$(echo "$flat" | awk -F '\t' '$1 ~ /^plugins\.[0-9]+\.source$/ { print $2 }')
    for src in $sources; do
        case "$src" in
            ./*|/*)
                [ -e "$src" ] && continue
                echo "ERROR   $manifest: plugin source not found: $src"
                status=1
                ;;
        esac
    done
    echo "ok      $manifest plugin sources resolve"
done

echo
if [ "$status" -eq 0 ]; then
    echo "validate: all checks passed"
else
    echo "validate: FAILED"
fi
exit "$status"
