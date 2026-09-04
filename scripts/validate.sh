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

        # policy: the seed ships Markdown only, no bundled scripts
        offenders=$(find "$skill" -type f ! -name '*.md')
        if [ -n "$offenders" ]; then
            echo "$offenders" | while IFS= read -r file; do
                echo "ERROR   $file: owlseed ships Markdown only (no scripts or binaries)"
            done
            status=1
        fi

        # references and skeletons named in SKILL.md must resolve, and stay shallow
        refs=$(awk '{
            line = $0
            while (match(line, /(references|assets)\/[A-Za-z0-9_.\/-]+\.md/)) {
                print substr(line, RSTART, RLENGTH)
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
echo "== skeletons"
# A skeleton is copied into a project and becomes a skill there, so it has to be
# a valid skill already. Its name is a placeholder the project replaces, so the
# name-matches-directory rule is checked against its own frontmatter.
for skill in skills/*; do
    [ -d "$skill/assets" ] || continue
    for asset in "$skill"/assets/*.md; do
        [ -f "$asset" ] || continue
        echo "$asset"
        sname=$(awk '
            /^---$/ { f++; next }
            f == 1 && /^name:/ { sub(/^name:[ \t]*/, ""); gsub(/["]/, ""); print; exit }
        ' "$asset")
        if [ -z "$sname" ]; then
            echo "ERROR   $asset: skeleton has no frontmatter name"
            status=1
        else
            awk -v rel="$asset" -v expect="$sname" -f scripts/skill.awk "$asset" \
                >/dev/null || {
                awk -v rel="$asset" -v expect="$sname" -f scripts/skill.awk "$asset"
                status=1
            }
        fi
        if grep -q '```' "$asset"; then
            echo "ERROR   $asset: skeletons carry no code fences"
            status=1
        fi
        if ! grep -q '<[^>]*>' "$asset"; then
            echo "ERROR   $asset: skeleton has no <placeholder> for the project to fill"
            status=1
        fi
    done
done

echo
echo "== context budget"
# The budget applies to the committed English text; drafts are reported only.
for skill in skills/*; do
    [ -f "$skill/SKILL.md" ] || continue
    echo "$skill/SKILL.md"
    awk -v rel="$skill/SKILL.md" -v limit=1100 -f scripts/budget.awk "$skill/SKILL.md"
    for ref in "$skill"/references/*.md; do
        [ -f "$ref" ] || continue
        echo "$ref"
        awk -v rel="$ref" -v limit=500 -f scripts/budget.awk "$ref"
    done
    for asset in "$skill"/assets/*.md; do
        [ -f "$asset" ] || continue
        echo "$asset"
        awk -v rel="$asset" -v limit=450 -f scripts/budget.awk "$asset"
    done
done

echo
echo "== version"
# The seed states its version twice: in metadata.version, and as a literal in the
# orient stage, where the agent compares it with what state recorded. A literal
# that drifts from the frontmatter would make every project migrate to the wrong
# version, so the two must agree, and the plugin manifests must carry the same one.
for skill in skills/*; do
    [ -f "$skill/SKILL.md" ] || continue
    fm=$(awk '
        /^---$/ { f++; next }
        f == 1 && /^[ \t]+version:/ { sub(/^[ \t]+version:[ \t]*/, ""); gsub(/["]/, ""); print; exit }
    ' "$skill/SKILL.md")
    if [ -z "$fm" ]; then
        echo "ERROR   $skill/SKILL.md: no metadata.version in frontmatter"
        status=1
        continue
    fi
    body_versions=$(awk '
        /^---$/ { f++; next }
        f >= 2 {
            line = $0
            while (match(line, /[0-9]+\.[0-9]+\.[0-9]+/)) {
                print substr(line, RSTART, RLENGTH)
                line = substr(line, RSTART + RLENGTH)
            }
        }
    ' "$skill/SKILL.md" | sort -u)
    if [ -z "$body_versions" ]; then
        echo "ERROR   $skill/SKILL.md: the body names no version; orient compares a literal"
        status=1
    fi
    for v in $body_versions; do
        if [ "$v" = "$fm" ]; then
            echo "ok      $skill/SKILL.md: body says $v, frontmatter says $fm"
        else
            echo "ERROR   $skill/SKILL.md: body says $v, frontmatter says $fm"
            status=1
        fi
    done
    for manifest in .claude-plugin/marketplace.json .claude-plugin/plugin.json; do
        [ -f "$manifest" ] || continue
        mv=$(awk -f scripts/json.awk "$manifest" | awk -F '\t' '$1 == "version" || $1 ~ /^plugins\.[0-9]+\.version$/ { print $2 }' | sort -u)
        for v in $mv; do
            if [ "$v" = "$fm" ]; then
                echo "ok      $manifest: version $v matches the seed"
            else
                echo "ERROR   $manifest: version $v, seed is $fm"
                status=1
            fi
        done
    done
done

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
