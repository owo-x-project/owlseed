# Lifecycle

The normative text is `skills/owlseed/SKILL.md`. This document records what was
decided and why.

## The unit is work, not a session

The design makes the base unit a **work unit** rather than a session, and treats a
session as something that breaks partway through a unit. A unit is sized to reach
verification within one session.

The position is recorded whenever a stage is left, so a session that ends mid-unit
leaves the next one able to resume at the stage it was in.

## The seven stages

Germination happens once. After that, orient through close runs once per work unit.

| Stage | The question | Answered by | The guard |
|---|---|---|---|
| **Germinate** | Where are the purpose, the records, and the ways of checking? | the seed, from the templates in `assets/`, with a human | Go on when all three core skills exist, no placeholder remains, and a human's agreement to each is recorded. |
| **Orient** | Where are we now? Is the base intact? | state, verify | Go on when the basic check passes, or a repair unit for it is first. A unit in progress goes back to waiting, right after the repair unit. |
| **Select** | What is the next single unit? What kind is it? Does it fit? | state, compass | Go on when exactly one unit is in progress and it fits one session. With a human, take their request; alone, the first waiting unit with no unanswered question. |
| **Act** | Which skills does this kind of unit go through? | the skills compass names, `grow.md` and `gate.md` when a skill changes | Do not modify the seed. A change of purpose, scope or way of checking is recorded as a decision. |
| **Verify** | Is this done by compass's definition, checked by verify's means? | compass, verify | Go on when the unit is checked. Every check is recorded on the unit with its result and proof; on failure return to act, on the same failure twice split the unit. |
| **Sediment** | Where does what was learned belong? | `SKILL.md` names the destination; `gate.md` for every skill change | Go on when the unit records what it taught and every change to a skill has a gate record. |
| **Close** | Can the next session pick this up? | state | Go on when the unit is closed and the position is recorded. |

Among the findings the design cites as its grounds are four failure modes observed in
Anthropic's long-running harness work: trying to do everything at once, declaring
completion from looking at the progress file, leaving things in a broken state, and
calling something done without verifying it. The guards above address the same
four, though the design record does not map them one to one. See
[foundations.md](foundations.md).

## Dialogue and autonomy are the same path

A request from a human becomes a work unit by going through *record in state →
judge against compass → select*. It does not go straight to action.

That leaves only three differences between a conversational session and an autonomous
loop:

| | Dialogue | Autonomous |
|---|---|---|
| Where a unit enters | a human's request | the first waiting unit with no unanswered question |
| On encountering a question | ask immediately | record it as an open question on the unit, set the unit back to waiting, and take another |
| After close | wait for the next request | go back to orient; stop when nothing is waiting |

Everything else is identical. The practical payoff is that a request made in
conversation survives the session ending, because it was recorded before work began.

Two details of the autonomous column came from a review of the text rather than from
the design record. Without "no unanswered question", an agent that recorded a question
and moved on would take the same first unit again on the next pass, forever; the open
question record that already existed was enough to break the loop, so no new status was
added. Without "stop when nothing is waiting", the loop had no end, and an improvement
list it could turn into units on its own; now an improvement item becomes a unit only if
compass lets the agent decide that.

## When an improvement gets applied

The handoff proposed an immediate-versus-at-the-end split, and listed four situations in
which an improvement **may** be applied immediately: the agent judges it important, it
directly affects the current problem, deferring it would cause rework, or continuing in
a wrong state would spread harm. The normative text collapsed the four to one test:
an improvement found on the way is done now only if the current unit needs it; the rest
goes on the improvement list and is handled at sediment.

The collapse is deliberate. Three of the four situations are the same situation seen
from different sides, and the fourth -- the agent judges it important -- is the one an
agent most easily talks itself into. "The current unit needs it" is the test that can be
checked against the record of the unit.

At sediment, an item that has repeated and belongs in a skill is applied at once, through
the gate. This was questioned in review, as a second piece of work done after the unit
was verified, outside select. It stays, because the gate is the check: proof, repetition,
contract intact, undoable, and a record. Sending every one-line change to compass through
select, act and verify would cost a full cycle per line, and the expected result is that
agents stop recording improvements at all. An item that needs any other change to the
project does become a unit.

## Why sediment leaves a record even when nothing was learned

A trial on a small project, driven through a headless CLI, ran four units through the
lifecycle and never entered sediment: verify went straight to close, twice with the same
hand-built procedure that sediment exists to turn into a skill. Three things in the text
allowed it. The guard, "every change to a skill has a gate record", is true when no skill
changed, so the stage could be left without being entered. Every other stage leaves a
mandatory trace in state and sediment left none, so an agent read it as optional. And
"a procedure that repeated" assumed a count, but nothing recorded the first occurrence,
so there was never a second.

The fix is one required record and one comparison. A unit now records what it taught,
or that it taught nothing, and the guard requires that record; one line per unit, not
the ritual entry per skill that an earlier wording was narrowed away from. A first re-run
after the change showed the second half of the problem: the agent read the new text, and
its project's copy of state, germinated under the old version, had no field for it, so
nothing was written. A version comparison at orient existed for exactly that, and the
agent skipped it too. Four more wordings were tried, each answering the previous
failure: the version as a literal in orient's guard made the agent notice the difference
but write the new number without comparing; requiring the comparison as the reason of a
decision made it run `diff` and dismiss what it saw as "descriptive wording"; a yes-or-no
criterion, every template line without angle brackets present word for word, was skipped
outright. Across those runs the agent never once produced the migration unit. Judging two
texts equal is not something this text can make an agent do reliably, so the seed no
longer asks for it: a version difference is handled by germination, which copies the
template and carries the old answers over, and the agents followed germination closely
every time it ran. See [versioning.md](versioning.md).

The second half of the sediment fix is that the text
names where repetition is found: a step done by hand in this unit and in a closed unit of
the same kind. That reads the checks state already holds, so it needs no improvement item
to have been filed the first time. The same trial showed an agent, once asked, doing
exactly that comparison from the recorded proofs; the text now asks for it unprompted.

## What grows, and from what

The grown harness grows from the records in state, never from the agent's memory of
a session. That is why the state contract fixes the records owlseed writes and their
minimum fields: the current position, a work unit with its checks, an improvement item
with a count, a decision, a gate record, and a conflict or open question. Without them
sediment has nothing to grow from, and the fields are the whole of what the seed asks a
project to accumulate.

Each kind of learning has a destination, and the seed names it in the sediment stage
rather than in a separate reference, so that the mapping is read exactly once per unit.
A procedure that repeated becomes a derived skill. What was learned about purpose,
scope or done refines compass: scope gains an In or an Out, the definition of done gets
sharper by kind. What was learned about checking strengthens verify: "not defined"
becomes a means, a means gets stronger. What happened and when goes to state.
Understanding of the project goes to the project's notes for agents, such as AGENTS.md, as a proposal. Where a skill was skipped,
added to or worked around, the skill gets an improvement item; an earlier wording asked
for a note on every skill used, which would have produced a ritual entry per skill per
unit, and was narrowed to the cases where something actually happened.

A skill taken in from outside is copied without a change of wording, because
rewording at intake is a change without proof. It then grows by being taken apart,
one piece of evidence at a time: what it says about done migrates to compass, what it
says about checking migrates to verify, and the body shrinks to the procedure. Ideas
from outside -- another skill, a tool, a practice -- enter the same way, as
improvement items tried inside a work unit; the seed looks outside on symptoms, not
on a schedule, so that autonomous operation neither goes stale nor wanders.

The direction is a harness with a short human's list, strong checks, and few skills
that are each used often. The seed does not write that sentence into the skill,
because deleting it would not change what the agent does; it is the shape the
sediment rules produce when followed.

## The stages are written as guards, and the position is recorded

The seven stages and their order are fixed, and the normative text expresses each one
as an imperative plus a "Go on when" line: the condition that must hold before the
stage may be left. An earlier expression also used the guards to find the position after
a break -- start at the first stage whose guard is false -- and that was a defect. The
guards are not monotonic. After verify marks a unit checked, select's guard is false
again, so a session resuming that way would skip sediment and close. The guard form is
kept because it makes each stage checkable on its own, but a guard controls exit only;
the position is read from what state recorded when the last stage was left, and with no
record the position is germinate.

Two norms follow from the same reasoning. The current position is read from state
rather than from the agent's memory of it, and done, checked and closed are only what
state records with proof -- a claim made in conversation is not a judgement. Both are
aimed at failure modes measured externally: agents that stop before work is verifiably
complete, that duplicate work already done, and that claim completion falsely. See
[foundations.md](foundations.md).

The remaining risk is the one no text removes: an agent can quote every guard correctly
while treating its conversational memory as the position and never writing state. That
is the first thing to watch in a real project.

## Two responsibilities that did not become skills, and one that stopped being one

Rather than add a fifth core skill, two responsibilities were folded into existing
contracts:

- **who decides** -- what must go back to a human, what the agent may decide alone --
  belongs to **compass**.
- **the recovery procedure** -- how to get back when things break -- belongs to
  **state**.

Thickening two contracts was judged better than standing up a fifth skill, on two
grounds the record names: **name collision** -- which follows from publishing as open
source -- and selection accuracy between similar descriptions.

The same two grounds later removed a skill. `owlseed-grow` was a core skill in the
proposal and the handoff; growth is now the seed's own role, mapped in the sediment
stage of `SKILL.md` and carried out by `references/grow.md` and `references/gate.md`.
See [contracts.md](contracts.md) for the test that decided it.
