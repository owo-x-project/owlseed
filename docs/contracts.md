# Contracts

The normative text is `skills/owlseed/assets/`, the sediment stage of
`skills/owlseed/SKILL.md`, and `skills/owlseed/references/grow.md`. This document
records what was decided and why.

## The seed asks; the contracts answer

owlseed holds questions. The core skills hold this project's answers. A contract
specifies **only what owlseed needs to read or write** -- never a procedure and never a
form. Procedures and forms are the project's: filled in at germination and improved by
experience.

Names take the prefix form `owlseed-<role>`, intended to avoid collisions in an open
ecosystem. The specification allows lowercase letters, digits and hyphens, up to 64
characters.

## A core skill exists only where the answer differs per project

This is the test that decides the set. The purpose of a project, where its records live,
and what counts as checked there are all different in every project, so each of those
is a core skill. How a skill is formed, where an experience belongs, and whether a change
may be adopted are the same in every project, so none of those is.

The proposal and the design handoff had a fourth core skill, `owlseed-grow`, holding
formation, improvement and pruning. It fails the test: every one of its promises
restated a norm the seed already holds -- the layer boundaries, the acceptance gate,
pruning, the note at the top of a skill, outside intake. What a project could have filled
in was a recurrence threshold that gate condition 2 already fixes, and placement
conventions that owlseed fixes for nobody.

So growth is the seed's own role. What learned goes where is written once, in the
sediment stage of `SKILL.md`; the procedures for forming, taking in, combining and
removing a skill are in `references/grow.md`; the conditions are in `references/gate.md`.
The variable part lands where it already belonged: the gate records, the improvement
list and the open questions are records that **state** locates; what must go back to a
human is **compass**'s list of who decides; where a formed skill is placed is fixed by
nobody.

Folding it in removed two structural defects at once. Germination had said grow
generates the core skills, which left grow generating itself. And the acceptance gate's
condition 6 -- does not touch the seed -- was recorded as most easily broken by grow
revising itself, a recursion that no longer exists. It also returns one description's
worth of always-loaded context to every project.

The cost is that `owlseed-grow`'s description carried the trigger words for "turn this
procedure into a skill", "fix this skill" and "use this outside skill". With it gone,
owlseed's own description has to carry them, which it now does.

## What a contract is made of

A contract is not a separate document and not a list of guarantees. It is two things in
the template a project copies from `assets/`: the **headings**, and under each heading
the **fixed lines that say what owlseed asks there and at which stage**. Placeholder text
in angle brackets is what the project replaces; the fixed lines stay after filling, so a
filled core skill still says what it is for. A reader, human or agent, can tell from the
skill alone what owlseed will read from it and when.

This shape came from a defect. An earlier draft had the template carry a guarantees
section that the project was told not to edit. It told the project what to promise but
not what to write, so germination produced skills that were formally complete and
useless. Making the fixed line under each heading the question owlseed asks turned the
template into its own instruction: filling it answers the question, and what is left
over is the contract.

Advice that owlseed has evidence for but does not fix -- a fixed-field JSON list for the
work units, a basic check that takes minutes -- lives inside the placeholders, marked as
advice. Filling the placeholder removes it. This replaced a separate guidance reference:
advice read once, at the moment it is used, costs nothing afterwards.

## Where a contract's source of record lives

**The source of record stays in the seed.** A project's copy is L1: mutable, changed
through the gate. If condition 3 checked a core skill against the fixed lines inside that
same skill, a change that weakened them would pass against its own weakened lines --
and a standard a change can rewrite is not a standard, which is why L0 was separated in
the first place. So condition 3 and germination read the seed's template,
never the project's copy. The copy's fixed lines are kept verbatim so that weakening them
shows up as a difference from the seed.

Two constraints on templates follow from the specification rather than from the design.
Frontmatter may contain no angle brackets, so placeholders live in the body, where
filling one removes the instruction written inside it. And templates are flat files,
never `assets/<name>/SKILL.md`, because a runtime that scans for `SKILL.md` would
register the template itself as a skill and charge every project its description tax.

## The three

### compass -- purpose, scope, kinds, done, who decides

Answers, when owlseed asks at select, act and verify:

- whether this work unit fits the purpose and the scope, without asking a human
- **what kind of unit it is**, and which derived skills a unit of that kind goes
  through at act and at verify, and whether it needs a human
- what counts as done for a unit of that kind, as what must be true rather than how it
  is checked, so that someone other than the author can check it
- which decisions go to a human

Any change of purpose or scope is recorded as a decision.

The human's list starts long by design, and the template's minimum now includes any
change to a core skill. A trial showed why: an agent added a kind of work to compass and a
way to check to verify, correctly by the letter of the lifecycle, without asking the human
who was present, because neither was on the list. Compass and verify define what done and
checked mean, so leaving their edits to the agent alone is the one place the harness can
grade itself. In autonomous operation the rule costs nothing: the change waits as an
improvement item until a human is there, and the unit still closes.

"Kinds of work unit" is the heading that routes work to skills. The seed does not know
derived skills; it reads the kind of the current unit here and follows the skills named
for it. Definition of done here and the ways to check in verify use the same kind names,
so a kind is one word that three places agree on. It is also how a project shapes how a
kind of work goes -- a design kind that goes through a questioning skill, an
implementation kind that goes through a stepwise one -- without owlseed holding either.

### state -- where the records are and what each holds

Answers, when owlseed asks at every stage: where do I read the current position, and
where do I write? The records themselves live **outside the skill body**, at the place
the skill names; changing a record is not a change to the skill and does not pass the
gate. Changing what the skill says about records is, and does.

The records owlseed writes, and the fields each needs at least:

- the current position: the unit in progress and the stage
- a work unit: what, origin, status (waiting, in progress, checked or closed), each
  change of status with when and why, progress so far, each check with its result
  and proof, and what the unit taught, or that it taught nothing
- an improvement item: what was seen, in which unit, where it belongs, how many times, whether done
- a decision: what changed in purpose, scope or way of checking, why, in which unit
- a gate record: the change, its proof, a reason for each of the seven conditions
- an open question or conflict: what could not be decided or disagreed, in which unit, and the answer when it comes

Status is the one field that moves. Everything else in an entry is added to, never
erased, and no entry is removed. The list was derived by enumerating every "record"
instruction in the seed's text; it has no external basis beyond that, and the seed does
not state the count.

state also holds what a safe point is and how to get back to one, which gate condition 7
uses, and the owlseed version, which germinate compares with the seed's.

### verify -- how a result is checked

Answers, when owlseed asks at orient, at verify, and whenever a skill changes:

- how a result of each kind is checked, and what proof it leaves; compass says what
  done means, this says how to check it
- the basic check that orient runs, or "not defined"
- where check results are kept, so that state can point at them as proof and gate
  condition 3 can re-run them
- how to judge a result in a different context from the one that made it

Every check leaves its result and proof. Any loosening of a way to check is a decision.

A project may germinate with the basic check "not defined". Orient treats that as a
failing check and puts a repair unit at the front of the work units, before any unit in
progress; the repair unit's definition of done is only that the basic check passes. That
is how "settle the means of checking before any work" is enforced without a separate
rule: the lifecycle refuses to select ordinary work until the repair is first.

### Common to all three

- If owlseed has not been read, read it first. This back-reference is deliberate
  redundancy for [activation](activation.md).
- On disagreement, owlseed wins and the disagreement is recorded as an improvement item
  for the core skill.
- The body opens with the note, which the template already carries.

## Derived skills

- The project forms them as needed, from `assets/derived.md`. Names are free.
- The seed does not know them. They are reached because compass names them under
  "Kinds of work unit"; a derived skill not named there is not called.
- The description leads with the task's trigger words and ends with "Under owlseed."
  The relation to owlseed goes in the note at the top, not in the description.
- Forming, revising, combining and removing all pass the acceptance gate.

## Outside skills

An outside skill is one without the seed's note at the top.

At act, the agent follows the skills compass names for the kind of unit. For anything
else it prefers skills with the note, **but may use an outside skill as it is**, checking
the result the same way. Taking one in is not a precondition of using it. An earlier
draft allowed only skills with the note at act; that made first use of any outside
capability wait for an intake, which was friction without a benefit, since the result
is checked by verify either way.

Taking in happens when a human chooses the skill, or when it has been used more than
once. A human's choice is a decision and is the proof for the gate. The intake is a
**verbatim copy** of the skill's body under the derived note, with a description in the
owlseed form and a line under compass's kinds. Nothing is reworded at intake, because
rewording without proof is what condition 1 forbids. Where the copy disagrees with a
core skill, the core skill wins and the disagreement is recorded, not edited away in
advance. Parts of the copy that belong in compass, verify, state or AGENTS.md stay in
the copy and are recorded as improvement items with their destination; that satisfies
condition 5 for the copy. From then on the copy grows like any derived skill: what it
says about done migrates to compass, what it says about checking migrates to verify, and
the body shrinks to the procedure, one piece of proof at a time.

A tool that cannot be copied -- a server, a command -- is taken in by pointing: its
name, its place, how it is used here, and its limits.

**owlseed is not a skill manager.** It records no source, licence or date of copying.
What matters is that the outside skill's ability enters the lifecycle without loss and
in a form the lifecycle can check and grow. Whether the outside side has since changed is
not the seed's question; if a check starts failing or an item repeats without a fix, the
sediment stage says to look outside, and that look is its own work unit.

Promoting a derived skill into a general-purpose skill is human work and outside
owlseed's scope.

## Precedence and how subordination is expressed

owlseed's rules are an **absolute standard**: neither the mechanisms beneath it nor
the project side can override them, and they bind the agent operating under the
harness as well as the skills.

Within the harness, precedence is **seed > core > derived**. On conflict the higher
wins, and the conflict is recorded as an improvement item for the lower skill, where it
becomes material for improving it.

A description is a place to be *found*, not a place to express subordination. Putting
subordination in a description makes it match tasks less well and therefore stop
being selected. Subordination goes in the note at the top of the body.

| Layer | description | body note |
|---|---|---|
| seed | when to use it (trigger words only) | none |
| core | trigger words + "Under owlseed." | works only inside the seed's lifecycle; if the seed is unread, read it first; on conflict the seed wins; the headings and fixed lines are the contract and the template is their source of record |
| derived | task trigger words + "Under owlseed." | follows the core skills' judgements; on conflict the core wins |

The subordination clause is kept to two words, because descriptions are loaded on every
turn and the tax scales with the number of skills. The notes are carried by the
templates in `assets/`, so a skill that was copied from one has its note already.
