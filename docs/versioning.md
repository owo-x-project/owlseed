# Versioning

The normative text is `skills/owlseed/references/migration.md`. This document records
what was decided and why.

## Rules

- owlseed carries a version.
- **Renaming, merging or splitting a contract happens only in a major version.**
- The seed's `references/migration.md` holds the per-version mapping: old name to new
  name, merges, splits.
- On a version migration, the seed has the agent **reconstruct** the new core skills
  from the existing ones. The reconstruction passes the acceptance gate.
- Old skills are not deleted until the new ones are confirmed to satisfy the
  contracts' guarantees; until then they are set aside.
- Because reconstruction is an LLM operation and therefore non-deterministic,
  renaming is kept rare. **Contract stability is preferred over a better name.**

## Why reconstruction rather than a rewrite

The seed cannot rewrite a project's core skills, because it has never seen their
contents -- they are the project's answers, not the seed's. A migration therefore
cannot be a text transformation. It has to be: here is the new contract, here is the
old skill, produce a skill that satisfies the new contract, then confirm the
guarantees still hold.

## The residual risk

The record lists reconstruction's non-determinism among its unresolved risks, and is
explicit that **the contract check and the set-aside protect against it but are not
complete.** They are why the gate and the set-aside are mandatory rather than
advisory, and why the design would rather live with an imperfect contract name than
move one -- but they do not make a reconstruction correct.

## Where the version is recorded

The record settles that the seed carries a version; it does not settle where. Today
the version is stated in the seed's body prose, and the frontmatter carries only
`name` and `description`.

Moving it to a machine-readable `metadata.version` is a repository decision that has
not been applied yet; it is step 2 of the pending rename in `NOTES.md`. The
specification permits it -- `metadata` is an arbitrary map of string keys to string
values, and spec-compliant runtimes ignore keys they do not recognise -- so it would
cost no portability.

The version an agent recorded for owlseed is compared against the current one, and if
they differ, `references/migration.md` governs. (The normative text places that
comparison at orientation; the design record does not.)
