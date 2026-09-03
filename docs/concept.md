# Concept

owlseed is a single, immutable Agent Skill. It provides the immutable behavioural
principles, norms and common standard an AI agent needs in order to work **inside a
project continuously and consistently**. It is not a collection of capabilities, and
it does not try to become one.

## The problem

The usual way to equip an agent is to add tools, one per purpose. But adding
individual tools leaves the agent to judge, for each of them:

- when to use it
- what to use it for
- what information to hand it
- how it combines with the other mechanisms already in place
- when information gets updated

So the project ends up having to define, separately, the rules and the lifecycle that
combine those tools. **In that state, the operational burden of combining the tools
correctly exceeds the value of the methods the tools themselves provide.**

owlseed's emphasis is therefore not on continuing to add tools, but on absorbing
effective methods and ways of thinking, and **applying them in a form that suits the
project**.

## The concept

> Share only the immutable behavioural principles and lifecycle, and let the project
> itself adapt and grow the concrete capabilities.

owlseed exists as one skill. It holds the lifecycle an agent follows, the rules and
norms it obeys, and the routing from each stage to the capability that answers it. It
holds no working procedure and no project knowledge; those are separate skills.

## Premises

Three premises shape everything else:

- **Dialogue sessions and long autonomous loops are handled by the same principles.**
  owlseed does not have one mode for a human conversation and another for a loop.
- **The means of verification differs per project**, so owlseed cannot hold one. See
  [architecture.md](architecture.md).
- **owlseed is published as open source and must work independently of the runtime**
  -- Claude Code, Codex CLI, Gemini CLI and others. This premise is what produces the
  name-prefix convention in [contracts.md](contracts.md), the refusal to depend on
  experimental frontmatter fields, and the rejection of runtime hooks in
  [activation.md](activation.md).

## Immutability

owlseed **cannot be changed** in the course of ordinary project work. Rewriting its
norms and principles from the mechanisms beneath it, or from the project side, is not
permitted; its rules are an absolute standard that neither can override.

Capabilities beneath it change continuously; owlseed stays put as the common
standard. This prevents a capability that keeps improving itself from rewriting the
fundamental rules and norms of the harness in the process -- and rewriting the seed
would move the baseline for every project at once. So an agent that finds something
worth improving is looking at a capability, never at the seed.

## Only universal norms

A rule whose right answer varies by project does not go into owlseed. What owlseed
holds is limited to what holds regardless of project type or technology stack. The
structure in which owlseed's norms and a project's own policy could conflict is
therefore **not built in the first place**.

The same separation applies to means. owlseed defines what principles must be kept
and what must be satisfied; it does not fix how the record of truth is stored, how
state is recorded, where improvement history is kept, or where a capability lives.
Those must remain replaceable by something better, so they are separated out of the
immutable part.

The proposal put **how capabilities are formed and managed** on that list too, and
gave it to a core skill the project held. That did not survive: every rule it held
turned out to be the same in every project, and the seed already held most of them
as the acceptance gate and the layer boundaries. Formation is now the seed's own
role. What stayed on the project's side is what actually varies -- where a formed
capability is placed, what means it uses, and what the record of its formation looks
like. See [contracts.md](contracts.md).

## Capabilities are not finished products

The concrete capabilities owlseed calls on are separate skills. Following owlseed's
rules, they provide what is needed **based on the state of the project at hand**.

**A capability does not have to be a fixed, general-purpose product.** If a project
needs a capability that does not exist, it may be formed to fit that project's state
and requirements. And a capability that has been formed is not treated as finished
either: it may keep being improved from the experience and results the project
produces.

What this does not license is carving out every piece of knowledge or procedure that
gets used only once. Persist a capability when it recurs, or when it is worth holding
as a capability in its own right -- which is condition 2 of the
[acceptance gate](acceptance-gate.md).

## Continuous improvement

owlseed does not aim to hold complete knowledge or complete capability. Capabilities
are delegated, and they improve continuously from actual results:

> experience → apply it → check the result → improve if warranted

Experience is not consumed as conversation history that disappears at the end of a
session. It is returned to whichever layer owns it, under a gate, so that the next
session starts from it.

**Self-improvement is not adopted unconditionally.** It is adopted on the grounds of
actual results and verification. This is owlseed's own norm, stated before any of the
external findings in [foundations.md](foundations.md) were consulted; those findings
corroborate it rather than originate it.

## External tools and methods

New problems do not automatically justify new tools. Where effective existing
technology, research, OSS, frameworks or products exist, owlseed prefers

> understanding *why* the mechanism is effective, and taking in **only the effective
> method**, into a capability beneath owlseed

over

> adding the product itself to the harness as a dependency.

This avoids the whole harness depending on one product's interface or **operating
model**. Where an existing method already solves a problem well, building something
new is not a goal in itself.

## Relationship to AGENTS.md

**AGENTS.md is not a place to hold the harness's rules or behavioural norms**, and
not a channel for distributing them. It holds what an agent needs in order to
understand *this project*: stack, structure, constraints.

Behavioural norms, common rules, the lifecycle, and the principles the harness must
keep are concentrated in owlseed, which removes any need to duplicate them into each
project's AGENTS.md.

## The state this aims at

Not a universal AI development framework. The aim is:

> an environment where, under a few unchanging principles, the capabilities each
> project needs get formed and keep improving from experience.

owlseed holds no capability of its own. Capabilities do not rewrite owlseed's
fundamental norms. **Only the project-specific capabilities grow, in step with the
project's changes and its experience.**

## Non-goals

owlseed does not try to:

- describe every working method inside itself
- be a universal skill common to every project
- solve every problem on its own
- treat a capability as a fixed, finished product
- add an external tool every time a new problem appears
- keep accumulating project-specific rules or capabilities inside itself
- use AGENTS.md to distribute its rules or norms

And, specifically excluded from its scope:

- how to operate subagents. owlseed holds exactly one principle here: **delegating
  does not remove the need to verify.**
- how to compact or summarise context
- how to implement a permission model
- any path whatsoever
- promoting a derived skill into a general-purpose one

Those belong to the runtime, to the project, or to a human.

owlseed's role is not to be a capability. It is to be the standard under which
capabilities are used, formed, and kept improving.
