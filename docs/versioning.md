# Versioning

The normative text is the `metadata.version` field in `skills/owlseed/SKILL.md`, the
version comparison in its germinate stage, and
`skills/owlseed/references/germinate.md`. This document records what was decided and
why.

## Rules

- owlseed carries a version, in `metadata.version`, and states the same number as a
  literal in the germinate stage, where the agent compares it with what state recorded.
  `scripts/validate.sh` fails when the two differ or the plugin manifests disagree.
- **Renaming, merging or splitting a contract happens only in a major version.**
- On a version difference, the seed has the agent **reconstruct** the core skills from
  the existing ones. The reconstruction passes the acceptance gate.
- Old skills are not deleted until the new ones are confirmed to satisfy the
  contracts' headings and fixed lines; until then they are set aside.
- Because reconstruction is an LLM operation and therefore non-deterministic, renaming
  is kept rare. **Contract stability is preferred over a better name.**

## What the version numbers mean

This is the repository's concern rather than the agent's, so it is recorded here and
not in the skill.

- **major** -- renaming, merging or splitting a contract; adding or removing a
  lifecycle stage; changing the acceptance gate's conditions or their count.
- **minor** -- adding a heading or a fixed line to a template; adding a file under `references/` or
  `assets/`.
- **patch** -- wording, and changes to the advice inside placeholders.

## Why there is no migration document

The seed once carried a `references/migration.md` holding a per-version mapping from
old contract name to new, plus a migration procedure. It was removed, because the
lifecycle already produces the behaviour it described.

A rename, a merge or a split means a core skill by the new name does not exist. That is
exactly the condition germination tests for, so the agent germinates, and germination
reconstructs from whatever the project already has. The old core skills are
identifiable as material because they carry the core preamble, which is what a mapping
table would otherwise have been needed for. The contracts state what the new skills
must answer, which is what drives a split correctly without an instruction naming
the split.

One case would not surface that way on its own. A minor version that only adds a
heading or a fixed line leaves every core skill present, so nothing is missing in the
literal sense. The seed closes the gap by definition: a core skill made under another
owlseed version counts as missing, and the germinate guard names the current version as a
literal. So every version difference, major or minor, goes through the same door.

An earlier design handled the minor case more lightly, at orient: compare each core
skill's headings and fixed lines with its template and make a work unit for each that
differs. Seven trial sessions on a project germinated under the previous version never
produced that unit, through five wordings. The agent skipped the conditional; then noticed
the version and wrote the new number without comparing; then compared with `diff` and
dismissed the changed fixed line as descriptive wording; then was given a yes-or-no
criterion and skipped it again. The failing step was always the same: judging that two
lines of text differ in a way that matters. Germination asks for no such judgement. It
copies the template, whose fixed lines are by construction current, and fills the
placeholders from the old skill as material, and in every trial session that reached it
the agent followed it step by step. A minor bump therefore costs a short germination with
a human present, which is also what the compass default now requires for any change to a
core skill.
That one clause replaces the whole migration procedure.

## Why reconstruction rather than a rewrite

The seed cannot rewrite a project's core skills, because it has never seen their
contents -- they are the project's answers, not the seed's. A migration therefore
cannot be a text transformation. It has to be: here is the new contract, here is the
old skill, produce a skill that satisfies the new contract, then confirm the
headings and fixed lines are all there.

## The residual risk

The record lists reconstruction's non-determinism among its unresolved risks, and is
explicit that **the contract check and the set-aside protect against it but are not
complete.** They are why the gate and the set-aside are mandatory rather than
advisory, and why the design would rather live with an imperfect contract name than
move one -- but they do not make a reconstruction correct.
