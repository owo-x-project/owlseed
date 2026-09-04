# owlseed repository

This repository develops and distributes **owlseed**: a single, immutable Agent Skill
that gives an AI agent a work lifecycle, three named contracts, and an acceptance gate,
so that the agent can work on a project continuously and consistently across sessions.
owlseed itself holds no project-specific knowledge; projects grow that around it.

Development happens with **Claude Code or Codex CLI only**; nothing else needs to be
installed. owlseed is deliberately *not* applied to this repository's own sessions.

| Path | What it is |
|---|---|
| `skills/owlseed/` | **Canonical, distributed artefact.** Only this directory ships to users. |
| `skills/owlseed/references/` | Normative text read on demand, one level deep. |
| `skills/owlseed/assets/` | Skeletons a project copies to form its own skills. |
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
| [docs/lifecycle.md](docs/lifecycle.md) | The seven stages, their guards, and how dialogue and autonomy unify |
| [docs/contracts.md](docs/contracts.md) | The three core contracts, derived and external skills, precedence |
| [docs/acceptance-gate.md](docs/acceptance-gate.md) | The seven conditions every change to a capability passes |
| [docs/activation.md](docs/activation.md) | How owlseed gets started, and the risk that it is not |
| [docs/versioning.md](docs/versioning.md) | Versions, migration by reconstruction, and why renaming is rare |
| [docs/foundations.md](docs/foundations.md) | The external findings the design rests on, with sources |

Read the relevant document before changing anything under `skills/`.

## Working rules

**Write the skill in the language of the conversation, translate before committing.**
`SKILL.md` and everything under `references/` and `assets/` is drafted in whatever
language the user is speaking, so that the wording can be argued about precisely. Once
the content is agreed, translate it to English and commit the English text. Everything
outside the skill -- `docs/`, `scripts/`, `AGENTS.md`, `README.md` -- is written in
English from the start.

**The context budget is a design constraint, measured in English.** owlseed is read at
the start of every session, so what it costs to read is part of the specification. The
budget applies to the committed English text. Estimate English at words x 1.4 tokens;
a draft in Japanese runs roughly 1.6x its English equivalent and is exempt until it is
translated. `scripts/validate.sh` warns on each file and skips files it detects as
untranslated drafts.

| What | Budget | Why that number |
|---|---|---|
| `description` | 70 words (~100 tokens) | Loaded every turn. Anthropic's own skills sit at 55-235 tokens, median ~80. |
| `SKILL.md` body | 1,100 words (~1,540 tokens) | Loaded every session. The floor is the protocol itself: seven guarded stages plus resume, repair and open-question rules, written in simple English so that no line can be read two ways. Drafts at 600 dropped rules and could not resume; drafts in dense English were misread. |
| each `references/*.md` | 500 words (~700 tokens) | Read on demand, only when a skill is made, changed or removed; one per stage at most. |
| each `assets/*.md` | 450 words (~630 tokens) | Copied once per project and becomes the project's own file; the fixed "owlseed asks here" lines are the contract and stay after filling. |

A work unit that changes no skill must cost no more than the description plus
`SKILL.md` -- about 1,650 tokens. Germination is the only scenario allowed past that,
because its cost is the templates, and cutting their fixed lines would cut the checklist
that version comparison and acceptance-gate condition 3 depend on.

Budgets for the project's own skills (a core skill around 1,000 tokens, a derived skill
under it) are recommendations, not norms: they depend on current model behaviour, so
they live in the placeholders of the templates and in `references/grow.md`, marked as advice.

**The skill text carries norms, not explanations.** A sentence stays only if deleting it
would change what the agent does. Reasons, background and rationale belong in `docs/`.
No H1 headings. No tables and no ASCII diagrams -- they spend tokens on visual
arrangement an agent does not read visually. No bold.
Each stage is a few imperatives, one per line, and ends with one "Go on when" guard.

**A skeleton in `assets/` must be a valid skill the moment it is copied.** Markdown
only, no scripts. No angle brackets in frontmatter -- the specification forbids them and
`scripts/skill.awk` rejects them, so placeholders go in the body, where filling one
removes the instruction inside it. No project paths, no means, no code fences. Keep
skeletons as flat files and never as `assets/<name>/SKILL.md`: a runtime that scans for
`SKILL.md` would register the skeleton as a real skill and charge every project its
description tax. The headings and the fixed "owlseed asks here" lines in the seed's skeleton are the source of record
for a contract; a project's copy of it is not, because a copy is mutable and a standard
that a change can rewrite is no standard.

**Validation is POSIX sh and POSIX awk only.** Anything under `scripts/` uses nothing
but `sh`, `awk` and the POSIX shell utilities: no bash-isms, no Python, no `jq`, no
network, no model calls. The checks have to run anywhere the skill might be developed,
and they have to cost nothing.

**`scripts/validate.sh` passes before a commit lands.**

```sh
scripts/validate.sh
```
