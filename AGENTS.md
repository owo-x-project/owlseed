# owlseed repository

This repository develops and distributes **owlseed**: a single, immutable Agent Skill
that gives an AI agent a work lifecycle, four named contracts, and an acceptance gate,
so that the agent can work on a project continuously and consistently across sessions.
owlseed itself holds no project-specific knowledge; projects grow that around it.

Development happens with **Claude Code or Codex CLI only**; nothing else needs to be
installed. owlseed is deliberately *not* applied to this repository's own sessions.

| Path | What it is |
|---|---|
| `skills/owlseed/` | **Canonical, distributed artefact.** Only this directory ships to users. |
| `docs/` | The settled design. Never shipped; never moved under `skills/`. |
| `scripts/` | Validation. `scripts/validate.sh` runs everything. |
| `.claude-plugin/` | Claude Code marketplace and plugin manifests. |

## Where the design is written down

`docs/` explains; **`skills/` is normative.** Detailed design is written directly into
the skill, and where the two overlap the skill wins.

| Document | What it settles |
|---|---|
| [docs/concept.md](docs/concept.md) | Why owlseed exists, what it is, and what it refuses to be |
| [docs/architecture.md](docs/architecture.md) | The vocabulary, the four layers, and the boundaries between them |
| [docs/lifecycle.md](docs/lifecycle.md) | The seven stages, their invariants, and how dialogue and autonomy unify |
| [docs/contracts.md](docs/contracts.md) | The four core contracts, derived and external skills, precedence |
| [docs/acceptance-gate.md](docs/acceptance-gate.md) | The seven conditions every change to a capability passes |
| [docs/activation.md](docs/activation.md) | How owlseed gets started, and the risk that it is not |
| [docs/versioning.md](docs/versioning.md) | Versions, migration, and why renaming is rare |
| [docs/foundations.md](docs/foundations.md) | The external findings the design rests on, with sources |

Read the relevant document before changing anything under `skills/`.

## Working rules

**Write the skill in the language of the conversation, translate before committing.**
`SKILL.md` and everything under `references/` is drafted in whatever language the user
is speaking, so that the wording can be argued about precisely. Once the content is
agreed, translate it to English and commit the English text. Drafts in another
language are not committed. Everything outside the skill -- `docs/`, `scripts/`,
`AGENTS.md`, `README.md` -- is written in English from the start.

**Validation is POSIX sh and POSIX awk only.** Anything under `scripts/` uses nothing
but `sh`, `awk` and the POSIX shell utilities: no bash-isms, no Python, no `jq`, no
network, no model calls. The checks have to run anywhere the skill might be developed,
and they have to cost nothing.

**`scripts/validate.sh` passes before a commit lands.**

```sh
scripts/validate.sh
```
