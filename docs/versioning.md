# Versioning

The normative text is the `metadata.version` field in `skills/owlseed/SKILL.md`, the
version comparison in its orient stage, and
`skills/owlseed/references/germinate.md`. This document records what was decided and
why.

## Rules

- owlseed carries a version, in `metadata.version`.
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

One case does not surface that way, and the skill handles it explicitly. A minor
version that only adds a heading or a fixed line leaves every core skill present, so germination
never fires and the addition would never reach the project. So orientation
compares the version state records against the seed's, and on a difference checks each
core skill's headings and fixed lines against its template and queues every missing one as an improvement item.
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
