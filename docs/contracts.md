# Contracts

The normative text is `skills/owlseed/assets/` and
`skills/owlseed/references/grow.md`. This document records what was decided and why.

## The seed asks; the contracts answer

owlseed holds questions. The core skills hold this project's answers. A contract
specifies **only what must be guaranteed** -- never a procedure. Procedures are the
project's: filled in after germination and improved by experience.

Names take the prefix form `owlseed-<role>`, intended to avoid collisions in an open
ecosystem. The specification allows lowercase letters, digits and hyphens, up to 64
characters.

## A core skill exists only where the answer differs per project

This is the test that decides the set. The purpose of a project, where its state lives,
and what counts as verified there are all different in every project, so each of those
is a core skill. How a capability is formed, which layer an experience belongs to, and
whether a change may be adopted are the same in every project, so none of those is.

The proposal and the design handoff had a fourth core skill, `owlseed-grow`, holding
formation, improvement and pruning. It fails the test: every one of its guarantees
restated a norm the seed already holds -- the layer boundaries, the acceptance gate,
pruning, the preamble, external intake. What a project could have filled in was a
recurrence threshold that gate condition 2 already fixes, and placement conventions
that owlseed fixes for nobody.

So growth is the seed's own role, written in `references/grow.md`, and the variable part
of it lands where it already belonged: the record of a gate judgement, the queue of
improvements waiting to sediment and the pruning candidates are **state**'s existing
guarantees; what must go back to a human is **compass**'s boundary of decision
authority; where a formed skill is placed is fixed by nobody.

Folding it in removed two structural defects at once. Germination had said grow
generates the core skills, which left grow generating itself. And the acceptance gate's
condition 6 -- does not encroach on the seed -- was recorded as most easily broken by
grow revising itself, a recursion that no longer exists. It also returns one
description's worth of always-loaded context to every project.

The cost is that `owlseed-grow`'s description carried the trigger words for "turn this
procedure into a skill", "fix this skill" and "use this external skill". With it gone,
owlseed's own description has to carry them, which it now does.

## The three

### compass -- keeper of purpose and scope

Must be able to answer:

- whether this work unit serves the purpose and stays in scope
- what counts as done, in a form checkable from outside the agent's own judgement
- which decisions go back to a human (scope changes, destructive operations,
  interpreting the purpose)

Prohibited: changing the purpose or the scope without recording it as a decision.

Referenced at: germinate, orient, select, act.

### state -- current position and the guarantee of return

Must be able to answer:

- where we are, briefly enough to be read at the entry to every stage
- the list of work units and their status, held as a fixed set of fields advanced by
  updating values rather than by adding or removing entries
- what has been decided and what is waiting
- what a recoverable state is, and how to get back to one when things break
- where L2 lives and in what form -- state owns this and answers it for the others
- which improvements are waiting to sediment
- which version of owlseed is recorded

Prohibited: closing with unrecorded work in progress; losing history by deleting or
rewriting entries in the work-unit list.

Referenced at: every stage.

### verify -- the definition of verified

Must be able to answer:

- whether a work unit is verified, and on what evidence

Must also:

- **settle the means of verification before any work**, if this project has none
  defined
- hold the basic check that orient uses, or state explicitly that there is none
- retain the record of verifications that passed, and offer it to the acceptance gate
- offer a way to separate producing a result from judging it

Prohibited: calling something verified without evidence; relaxing the means of
verification without recording it as a decision.

Referenced at: germinate, orient, verify.

### Common to all three

- If the seed has not been read, read the seed first. This back-reference is
  deliberate redundancy for [activation](activation.md).
- The body opens with the preamble, which the skeleton already carries.

## Skeletons, and where a contract's source of record lives

A contract is not a separate document. It is the guarantees section of the skeleton in
the seed's `assets/`, which a project copies to form the skill. The specification names
`assets/` as the home for templates, and a skeleton is a template: the project copies
it, fills its placeholders, and the result is its own skill.

Merging the two removed a duplicate. The design handoff's contracts already carried a
description template and a list of what the project fills in, which is a skeleton in
all but name; holding a contract document and a template separately would have meant
maintaining the guarantees twice.

**The source of record stays in the seed.** A project's copy is L1: mutable, changed
through the gate. If condition 3 checked a core skill against the guarantee list inside
that same skill, a change that weakened the list would pass against its own weakened
list -- and a standard a change can rewrite is not a standard, which is why L0 was
separated in the first place. So condition 3 and orient's version comparison read the
seed's skeleton. The copy's guarantees section is a convenience, kept verbatim so that
weakening it shows up as a difference from the seed.

Two constraints on skeletons follow from the specification rather than from the design.
Frontmatter may contain no angle brackets, so placeholders live in the body, where
filling one removes the instruction written inside it. And skeletons are flat files,
never `assets/<name>/SKILL.md`, because a runtime that scans for `SKILL.md` would
register the skeleton itself as a skill and charge every project its description tax.

## Derived skills

- The project generates them as needed, from `assets/derived.md`. Names are free.
- The seed does not know them directly; they are selected at the act stage by their
  description.
- The description leads with the task's trigger words and ends with one short clause
  marking it as being under the seed.
- Forming, revising, merging and retiring all pass the acceptance gate.

## External skills

An external skill is one without the seed's preamble.

**At the act stage, only skills carrying the preamble may be used.** An external
skill is used only in the form it has been taken in as a derived skill.

- Taking one in may start as a **thin adapter**: preamble, plus when to use it in
  this project, plus the constraints. The substance stays external, referenced.
- Gate condition 2 is "recurrence *or* retention value", and taking something in
  counts as retention value on its own -- it is the record of an external dependency.
- When the external side updates and the adapter goes stale, pruning is what catches
  it.
- Promoting a derived skill into a general-purpose skill is human work and outside
  owlseed's scope.

This mechanism is the proposal's principle -- take in the method rather than adding
the product -- put into implementation. The preamble is what makes "is this part of
the harness?" answerable, which is what keeps an external skill's interface changes
and operating model from propagating into the harness.

**The design records the cost as unresolved.** Using any external capability must pass
through intake first, which is friction on first use. The thin adapter reduces it; it
does not remove it.

## Precedence and how subordination is expressed

owlseed's rules are an **absolute standard**: neither the mechanisms beneath it nor
the project side can override them, and they bind the agent operating under the
harness as well as the skills.

Within the harness, precedence is **seed > core > derived**. On conflict the higher
wins, and the conflict itself is recorded in state, where it becomes material for
improving the lower skill.

A description is a place to be *found*, not a place to express subordination. Putting
subordination in a description makes it match tasks less well and therefore stop
being selected. Subordination goes in the preamble at the top of the body.

| Layer | description | body preamble |
|---|---|---|
| seed | when to use it (trigger words only) | none |
| core | trigger words + one clause marking it as under the seed | works only inside the seed's lifecycle; if the seed is unread, read it first; on conflict the seed wins; the contract's source of record is the seed's skeleton |
| derived | task trigger words + the same short clause | follows the core skills' judgements (compass's scope, verify's contract); on conflict the core wins |

The subordination clause is kept to a single short phrase, because descriptions are
loaded on every turn and the tax scales with the number of skills. The preambles are
carried by the skeletons in `assets/`, so a skill that was copied from one has its
preamble already.
