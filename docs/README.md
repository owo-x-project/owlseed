# Design documents

The settled design of owlseed, in English, frozen. A document lands here when the
decision it records has stopped moving.

| Document | What it settles |
|---|---|
| [concept.md](concept.md) | Why owlseed exists, what it is, and what it refuses to be |
| [architecture.md](architecture.md) | The vocabulary, the four layers, and the boundaries between them |
| [lifecycle.md](lifecycle.md) | The seven stages, their guards, and how dialogue and autonomy unify |
| [contracts.md](contracts.md) | The three core contracts, derived and external skills, precedence |
| [acceptance-gate.md](acceptance-gate.md) | The seven conditions every change to a capability passes |
| [activation.md](activation.md) | How owlseed gets started, and the risk that it is not |
| [versioning.md](versioning.md) | Versions, migration by reconstruction, and why renaming is rare |
| [foundations.md](foundations.md) | The external findings the design rests on, with sources |

## What is not here

**Normative detail is not here.** These documents record what was decided and why.
The text an agent actually obeys lives in `skills/owlseed/` -- `SKILL.md`,
`references/` and `assets/` -- and that is the source of truth. Where a document below overlaps the
skill, the skill wins; where it merely explains the skill, it is not normative at all.

**Work in progress is not here.** Anything still moving lives in the skill or in the
repository's `NOTES.md`. That includes the places where a document here and the skill
have drifted apart; those are tracked in `NOTES.md`.

**The distribution method is not here.** It was decided outside the design record and
is documented in `README.md` and `AGENTS.md`.

**The Japanese originals are not here.** The design was worked out in three Japanese
documents -- a proposal, a design handoff, and a design decision record. These
documents are their translation and reorganisation, audited against them for
omissions, divergences and unsourced claims before the originals were removed.
