# Activation

The normative text is the `description` in `skills/owlseed/SKILL.md`. This document
records what was decided, why, and what remains unresolved.

## Description only

owlseed is started by its **description alone**. No entry point written into
AGENTS.md, no runtime hook.

The record states that decision without giving a reason. Each rejection is
reconstructible from elsewhere in the design, and they are not the same reason: an
AGENTS.md entry point would have to be duplicated into every project, which
[concept.md](concept.md) rules out on the proposal's and the handoff's grounds; a
runtime hook would tie owlseed to one runtime's extension model, against the premise
that owlseed must work independently of the runtime.

That leaves the description carrying the whole load, so it is designed for it:

- **trigger words first.** The end of a description can be truncated; the limit is
  1024 characters.
- **enumerate the situations that occur at the start of a session** -- starting work,
  receiving a task, resuming, checking progress, and making or fixing a skill.
  "Reviewing" was in this list and has been dropped; see below.
- **bound the scope** -- an already-germinated project, or the start of continuous
  development.
- **make it redundant through back-references from the core skills.** Every core
  skill's preamble says: if the seed is unread, read the seed first. So reaching any
  part of the harness leads to the seed.

The record is explicit that the back-reference **reduces** the risk without
guaranteeing anything.

## The remaining weakness: the first run

Before germination there is nothing in the project pointing at owlseed. The record
accepts this: it assumes the user invokes owlseed explicitly the first time, and
requires the README to say so.

It is a cost accepted as a consequence of choosing description-only activation, not
an impossibility. The rejected alternatives -- an AGENTS.md entry point, a runtime
hook -- would in fact have removed it, at the price the section above describes.

## Why this one is hard to close

The record lists four unresolved risks and ranks none of them. This is the first, and
what it names is concrete: because activation depends on the description alone,
**another skill can compete for the same prompt, or the description can be skipped
over.**

It is also the risk that is least settled by argument. Everything else in owlseed is
a matter of what the text says; activation is a matter of whether a model, holding a
list of description lines, picks this one. And measurement has shown it is **not
deterministic** -- the same prompt against the same skill has come out differently
between runs, so a single observation is not a verdict.

That is why activation is a thing to observe rather than to argue about, and to keep
observing rather than to establish once. Observing it means running a real agent:
there is no way to test it offline, and no cheap way to test it in bulk. Watch for it
during ordinary work: a session that starts work without reading owlseed is the signal.

## What the measurement has shown so far

One baseline run of 18 prompts against Claude Code, driven through the headless CLI.
Two results are design-level rather than incidental:

- **A runtime's bundled skill can win outright.** A review prompt went to Claude
  Code's own bundled review skill instead of owlseed, in 3 of 3 repeats. The record
  listed "review" among the situation words the description deliberately enumerated, so
  the two were in direct conflict. **The word has been yielded.** owlseed keeps
  starting work, receiving a task, resuming and checking progress, and no longer
  claims review; the skill-routing literature says overlapping descriptions degrade
  discrimination, so conceding a word a bundled skill owns costs less than competing
  for it. A review request reaches the bundled skill, and the work that follows it
  still enters through owlseed.
- **Activation tracks the description's language.** With a Japanese description,
  Japanese cases expecting activation passed 4 of 7 and English cases 1 of 5. All 6
  cases expecting *no* activation passed. This is a first measured argument for
  translating before release, on a 12-case positive sample, one run, one runtime, one
  model -- a direction, not a magnitude.

The harness that produced these numbers is not kept in the repository -- driving the
CLIs over a prompt set costs about a dollar per pass, which this project does not spend
routinely -- so they are a single observation, not a baseline being tracked.

## What the description had to absorb later

Folding growth into the seed removed `owlseed-grow`, whose description carried the
trigger words for turning a procedure into a skill, fixing a skill, and using an
external one. Nothing else in the harness matches those prompts -- compass, state and
verify do not -- so owlseed's own description now enumerates them.

That makes the description carry two jobs at once: reaching owlseed at the start of a
session, and reaching it mid-session when someone asks for a skill to be made or fixed.
It is a thing to observe rather than to argue about, on the same grounds as the rest of
this document.

## What a trial on Codex CLI showed

One trial, on a throwaway project driven through `codex exec`, six sessions, one model.
Three observations bear on activation:

- **Description-only activation worked without being named.** After germination, a
  fresh session given a plain feature request, and another asked only how far the last
  session got, both read owlseed first and resumed from state. One of them found and
  repaired a status field the previous session had left stale.
- **The runtime's bundled skill-maker co-activates on "make it a skill".** Unlike
  "review", the word is not yielded: with growth folded into the seed, nothing else
  reaches `grow.md`. The two ran together and owlseed governed the result, so
  co-activation is acceptable; what was not acceptable was the bundled tool's validator
  leaking into a core skill, which gate condition 5 now names.
- **Germination needs a human who has seen the text.** Given all answers up front and
  told to proceed, the agent filled every heading, recorded "the human agreed" for each,
  and the human had never seen the safe-state definition it wrote. `germinate.md` now
  records agreement only after the human answers to the filled text.

Two runtime facts, not owlseed's to fix but worth knowing when trialling there: Codex
mounts the project's `.codex/` read-only inside its sandbox, so records cannot live
there, and creating directories under `.agents/skills/` needs an approval, so the first
session should be interactive or run with approvals routed. The README says so.
