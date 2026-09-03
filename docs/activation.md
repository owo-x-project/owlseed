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
  receiving a task, resuming, checking progress, reviewing.
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
there is no way to test it offline, and no cheap way to test it in bulk. `NOTES.md`
describes how to watch for it during ordinary work.

## What the measurement has shown so far

One baseline run of 18 prompts against Claude Code, driven through the headless CLI.
Two results are design-level rather than incidental:

- **A runtime's bundled skill can win outright.** A review prompt went to Claude
  Code's own bundled review skill instead of owlseed, in 3 of 3 repeats. The record
  lists "review" among the situation words the description deliberately enumerates,
  so the two are in direct conflict. Whether to yield that trigger word, to
  differentiate the description, or to accept the collision is open.
- **Activation tracks the description's language.** With a Japanese description,
  Japanese cases expecting activation passed 4 of 7 and English cases 1 of 5. All 6
  cases expecting *no* activation passed. This is a first measured argument for
  translating before release, on a 12-case positive sample, one run, one runtime, one
  model -- a direction, not a magnitude.

The harness that produced these numbers is not kept in the repository -- driving the
CLIs over a prompt set costs about a dollar per pass, which this project does not spend
routinely -- so they are a single observation, not a baseline being tracked. They are
carried, with whatever has been seen since, under Open findings in `NOTES.md`.
