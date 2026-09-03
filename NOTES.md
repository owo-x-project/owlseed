# Working notes

Everything about owlseed that is still moving. `docs/` holds the settled design and
`AGENTS.md` holds the rules; anything undecided, unapplied or merely observed lives
here. Nothing in this file is normative.

## Open findings

Observed while doing ordinary work in a germinated project -- there is no activation
harness in this repository, and driving `claude -p` or `codex exec` over a prompt set
costs roughly a dollar per pass, which is not worth it at this size. When the seed is
not read before anything else happens, add it here with what the runtime reached for
instead.

- **A bundled skill can beat the seed.** In Claude Code, a review prompt went to the
  built-in review skill rather than owlseed, in 3 of 3 repeats. The seed's description
  deliberately lists "review" as a trigger word, so the two collide directly. Yield the
  word, differentiate the description, or accept the collision -- undecided.
- **Activation tracks the description's language.** With the description in Japanese,
  prompts expecting activation passed 1 of 5 in English against 4 of 7 in Japanese;
  all 6 prompts expecting no activation passed, for 11 of 18 overall. One run, Claude
  Code, sonnet. A direction, not a magnitude -- and the first measured argument for
  translating before release.

## Drift between docs and the skill

Found by auditing the English documents in `docs/` against the Japanese originals.
Each needs a decision the next time the skill is edited; none is fixed by editing
`docs/`.

- The handoff gave **four** situations permitting an improvement to be applied
  immediately, as permission rather than a test. `references/lifecycle.md` compresses
  them into two questions, dropping "the agent judges it to be of high importance" and
  "continuing in a wrong state would spread harm to downstream deliverables".
- Acceptance-gate condition 2 in `references/gate.md` covers a one-off *procedure*;
  the handoff's wording covers one-off *knowledge* too.
- `references/gate.md` includes taking in an external skill in the gate's scope; the
  design record's list does not. `docs/contracts.md` relies on the skill's wider scope.
- That owlseed's rules are an absolute standard **the project side** cannot override is
  stated in the proposal and the handoff, and in neither the skill nor `docs/` until
  now. `docs/contracts.md` states it; the skill still does not.
- The seed's version lives in body prose (`## 版`). Moving it to a machine-readable
  `metadata.version`, as `docs/versioning.md` describes, is still unapplied.
- The seed's `description` and body are still Japanese; translating them is the release
  blocker.

## Constraints that are easy to violate

- **A skill's directory name must equal its frontmatter `name`.** The spec requires
  it. Claude Code is lenient -- for a project or personal skill it treats `name` as a
  display label and takes the command from the directory -- but a spec-compliant
  runtime may refuse to load a mismatch, and portability is the whole point. Renaming
  the seed means renaming the directory in the same change.
- **Design documents must never live inside `skills/`.** Installers copy the whole
  skill directory, so anything placed there is distributed to every user.
- **The seed ships Markdown only.** No `scripts/`, no `assets/`, no `allowed-tools`.
  That field is experimental and runtime-dependent; depending on it would cost
  portability, which is the point of owlseed. `scripts/validate.sh` enforces this.
- **owlseed fixes names and contracts, never paths.** Runtime-specific paths belong
  in `references/guidance.md`, which the design marks explicitly non-normative.

## Before the first release

- **`metadata.version`.** The version is still stated in body prose (`## 版`,
  "現在の版: 0.1.0（仮）"). `docs/versioning.md` settles that it belongs in
  `metadata.version`, which the specification permits at no cost to portability.
  Deciding the number is part of this -- 0.1.0 is still marked provisional.
- **Translate the seed.** `SKILL.md` and `references/` are Japanese. English is the
  release language, and activation appears to track the description's language (see
  Open findings), so this is a correctness question as well as a distribution one.
- **`references/migration.md` has no mapping table yet**, and needs none: owlseed was
  never published under the name `seed`, so the rename to `owlseed` is invisible to
  every project. The table stays "（初版のため対応なし）" until a contract name actually
  changes after a release.

## Runtime discovery paths, for reference

Distribution has to reach these; nothing in this repository is set up for any of them,
because the seed is deliberately not applied to its own development sessions yet.

| Runtime | Project | User |
|---|---|---|
| Claude Code | `.claude/skills/` (walks up to the repository root; nested dirs load lazily) | `~/.claude/skills/`, plugins, managed settings |
| Codex CLI | `.agents/skills/` (cwd, parent, repository root) | `~/.agents/skills/`, `/etc/codex/skills` |
| Gemini CLI | `.gemini/skills/` or `.agents/skills/` | `~/.gemini/skills/` or `~/.agents/skills/` |
| Cursor, Cline, OpenCode, Copilot, ... | `.agents/skills/` | runtime-specific |

Claude Code does not read `.agents/skills/`, so any change to discovery paths has to
keep both working. The two runtimes also differ in how they reach a skill: Claude Code
has a dedicated `Skill` tool and emits a `tool_use` event for it, while Codex simply
reads `SKILL.md` with a shell command.
