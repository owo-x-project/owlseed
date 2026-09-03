# Foundations

The external findings the design rests on. Listed because several decisions in the
other documents look arbitrary without them.

## What a harness is

By 2026 an agent harness is defined as a runtime layer with four elements: the agent
loop, the tool interface, context management, and control mechanisms.

**owlseed is not a runtime.** The record's reading is that owlseed corresponds to the
*norms of the control mechanism* -- something a runtime reads, not something that
runs. The record does not derive owlseed's exclusions (paths, permission model,
context compaction) from this definition; it lists them separately, without a reason.
See the non-goals in [concept.md](concept.md).

Source: *What makes a harness a harness* (2026).

## Evidence from long-running harnesses

Anthropic reported stabilising long-running agents by:

- separating a first-session initialiser from every subsequent session
- holding the feature list as JSON rather than Markdown, which the model was less
  inclined to rewrite of its own accord
- one feature per session
- reading the progress file and the git log at the start
- committing and updating progress at the end

Four failure modes were observed:

1. trying to do everything at once
2. declaring completion from looking at the progress file
3. leaving things in a broken state
4. calling something done without verifying it

Source: Anthropic Engineering, *Effective harnesses for long-running agents*.

The JSON finding is why `references/guidance.md` recommends holding the work-unit list
in a format the model is less inclined to rewrite on its own -- as a recommendation,
not a norm, because the format is the project's to choose.

## Three principles of harness design

1. Build on what the model already knows.
2. Remove the harness's assumptions as models improve.
3. Draw boundaries carefully.

Source: Anthropic, *Agent Harness Design* (2026).

The second principle is a standing instruction rather than a one-time one: an
assumption the harness encodes because of a current model limitation is meant to be
removed as that limitation goes away.

## The Agent Skills specification

Facts that directly shape the design:

- **Descriptions are always loaded**, roughly 30-100 tokens each. Bodies are read
  only when the description matches. This is the "description tax" that makes an
  unused skill costly and makes condition 2 of the acceptance gate necessary.
- **Only `name` and `description` are required.** `name` is at most 64 characters,
  lowercase letters, digits and hyphens, and must match the parent directory name.
  `description` is at most 1024 characters.
- **Keep the body under 500 lines**; move detail to `references/`.
- **As similar descriptions accumulate, selection accuracy drops.** This is why the
  design merges similar capabilities rather than adding names, and why subordination
  is kept out of descriptions. Note that every source states this as a degradation of
  accuracy, not as an outright failure to select.
- **`allowed-tools` and similar fields are experimental and runtime-dependent.**
  owlseed depends on none of them; it ships Markdown only.

Sources: the Agent Skills specification (agentskills.io) and the individual runtime
implementations.

## Skill layer versus memory layer

A named, reusable procedure belongs to the skill layer. Circumstantial evidence --
what happened, what failed -- belongs to the memory layer. Mixing them inflates the
skill layer.

Source: *Self-Improving Agents in the Era of Experience* (2026).

This is the finding that produced L2 as a separate layer, which
[architecture.md](architecture.md) calls the largest structural decision in the
design.

## Acceptance gates for self-improvement

Adopting only candidate skills whose improvement verification confirms is becoming
standard. **An append-only memory with no acceptance gate grows without bound and
regresses.** And an LLM's evaluation of its own output degrades with iteration, so
grounding a judgement in executable verification is preferable to self-assessment.

Sources: GRASP (2026); *Agentic Evolution* survey (2026).

Both halves are load-bearing: the first is why
[acceptance-gate.md](acceptance-gate.md) exists at all, the second is why it prefers
executable evidence and leaves an audit trail when it has none.

## Skill harnessing

A skill is a static artefact, but there is a separate set of responsibilities *while
it is in use*: selection, contextual binding, interpretation, and recording evidence.

Source: *Harnessing Agent Skills* (2026).

The record cites this as a premise and does not claim owlseed addresses those four
responsibilities. What it does state, in the first finding above, is that owlseed is
the *norms* read by a runtime rather than a skill that does work.
