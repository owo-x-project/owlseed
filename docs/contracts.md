# Contracts

The normative text is `skills/owlseed/references/contracts/`. This document records
what was decided and why.

## The seed asks; the contracts answer

owlseed holds questions. The core skills hold this project's answers. A contract
specifies **only what must be guaranteed** -- never a procedure. Procedures are the
project's: filled in after germination and improved by experience.

Names take the prefix form `owlseed-<role>`, intended to avoid collisions in an open
ecosystem. The specification allows lowercase letters, digits and hyphens, up to 64
characters.

## The four

### compass -- keeper of purpose and scope

Must be able to answer:

- whether this work unit serves the purpose and stays in scope
- what counts as done
- which decisions go back to a human (scope changes, destructive operations,
  interpreting the purpose)

Prohibited: changing the purpose or the scope without recording it as a decision.

Referenced at: germinate, orient, select.

### state -- current position and the guarantee of return

Must be able to answer:

- where we are, what has been decided, what is waiting
- the list of work units and their status
- what a recoverable state is, and how to get back to one when things break
- where L2 lives and in what form -- state owns this and answers it for the others
- which improvements are waiting to sediment

Prohibited: closing with unrecorded work in progress.

Referenced at: orient, select, act, sediment, close.

### verify -- the definition of verified

Must be able to answer:

- whether a work unit is verified, and on what evidence

Must also:

- **settle the means of verification before any work**, if this project has none
  defined
- retain the record of verifications that passed, and offer it to the acceptance gate
  for regression checks

Prohibited: calling something verified without evidence.

Referenced at: germinate, orient, verify.

### grow -- forming, improving, pruning

Must be able to:

- decide which layer an experience belongs to
- decide whether a capability is worth forming or improving
- confirm that a change has not broken an earlier guarantee
- nominate unused or duplicated skills for merging or retirement (pruning)
- take an external skill in as a derived skill

Prohibited: changing L1 without passing the acceptance gate. Modifying the seed.

Referenced at: germinate, act, sediment.

### Common to all four

- If the seed has not been read, read the seed first. This back-reference is
  deliberate redundancy for [activation](activation.md).
- The body opens with the preamble the seed templates.

## Derived skills

- The project generates them as needed. Names are free.
- The seed does not know them directly; they are selected at the act stage by their
  description.
- The description leads with the task's trigger words and ends with one short clause
  marking it as being under the seed.
- The body opens with the seed's preamble.
- Forming, revising, merging and retiring all pass grow's acceptance gate.

## External skills

An external skill is one without the seed's preamble.

**At the act stage, only skills carrying the preamble may be used.** An external
skill is used only in the form grow has taken in as a derived skill.

- Taking one in may start as a **thin adapter**: preamble, plus when to use it in
  this project, plus the constraints. The substance stays external, referenced.
- Gate condition 2 is "recurrence *or* retention value", and taking something in
  counts as retention value on its own -- it is the record of an external dependency.
- When the external side updates and the adapter goes stale, grow's pruning is what
  catches it.
- Promoting a derived skill into a general-purpose skill is human work and outside
  owlseed's scope.

This mechanism is the proposal's principle -- take in the method rather than adding
the product -- put into implementation. The preamble is what makes "is this part of
the harness?" answerable, which is what keeps an external skill's interface changes
and operating model from propagating into the harness.

**The design records the cost as unresolved.** Using any external capability must pass
through grow's intake first, which is friction on first use. The thin adapter reduces
it; it does not remove it.

## Precedence and how subordination is expressed

owlseed's rules are an **absolute standard**: neither the mechanisms beneath it nor
the project side can override them, and they bind the agent operating under the
harness as well as the skills.

Within the harness, precedence is **seed > core > derived**. On conflict the higher
wins, and the conflict itself is recorded in state, where it becomes material for
improving the lower skill. (The recording and the feedback loop come from the
normative skill text, not from the design record.)

A description is a place to be *found*, not a place to express subordination. Putting
subordination in a description makes it match tasks less well and therefore stop
being selected. Subordination goes in the preamble at the top of the body.

| Layer | description | body preamble |
|---|---|---|
| seed | when to use it (trigger words only) | none |
| core | trigger words + one clause marking it as under the seed | works only inside the seed's lifecycle; if the seed is unread, read it first; on conflict the seed wins |
| derived | task trigger words + the same short clause | follows the core skills' judgements (compass's scope, verify's contract); on conflict the core wins |

The subordination clause is kept to a single short phrase, because descriptions are
loaded on every turn and the tax scales with the number of skills. The templates live
in the seed's `references/preamble.md`, and grow attaches them whenever it generates
or revises a skill.
