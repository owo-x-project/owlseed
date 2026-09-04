---
name: owlseed
description: Read before any work in a project, even when the user does not ask: when you begin work, get a request, continue from last time, check progress, or make, fix or tidy a skill. Sets the lifecycle of work and the core skills a project answers it with.
metadata:
  version: "0.1.0"
---

owlseed is read-only. Anything worth improving lives in a core skill or a derived skill, never in owlseed.
A project has three core skills, and owlseed calls them by name: owlseed-compass, owlseed-state and owlseed-verify. Every other skill made under owlseed is a derived skill.

## How to move

A work unit is work that changes the project. An answer that changes nothing stays outside the lifecycle.
owlseed-state holds the work units and the improvement list.
Go down the stages in order. Read each "Go on when" line. Start at the first stage where it is not true.
Read the current position from owlseed-state, not from memory. Update owlseed-state when you leave a stage.
Done, checked and closed mean only what owlseed-state records with proof. Saying it in the conversation does not count.
Proof is something the reader can check again.

## Germinate

If owlseed-compass, owlseed-state or owlseed-verify is missing, make it by following references/germinate.md.
Do this only when a human can answer. Do not guess the purpose.
Go on when: all three core skills exist.

## Orient

Read owlseed-state. Find the current position, the unit in progress, what is waiting, and whether the last close was complete.
If the version in owlseed-state differs from metadata.version, compare the headings of each core skill, and the lines under them that say what owlseed asks, with its template in assets. Add every missing one, and an undefined basic check, to the improvement list.
Go on when: the basic check in owlseed-verify passes. "Not defined" does not pass.
If not: put a repair unit at the front of the work units, to fix the base or to define the check, then go to Select.

## Select

Every unit starts as an entry in owlseed-state, whether it comes from a human request or from the waiting list. Then use owlseed-compass to judge whether it fits the scope, what kind of unit it is, and whether a human must decide anything about it.
If it does not fit the scope, record why and close it as out of scope; with a human, say so.
If a unit is already in progress, continue it, or record why and put it back to waiting.
Alone, take the first waiting unit. Only a human and Orient change the order.
Split a unit that is too big or that spans more than one kind.
Go on when: exactly one unchecked unit is in progress, and it is small enough to be checked in one session.

## Act

Follow the skills that owlseed-compass names for this kind of unit. For anything else, prefer skills with the owlseed note at the top; you may use other skills, but check their results the same way.
Take in or form a skill only when it repeats or is worth keeping on its own; follow references/grow.md and pass references/gate.md.
Record any change of purpose, scope or way of checking as a decision. Return any decision that owlseed-compass gives to a human.
An improvement found on the way is done now only if the current unit needs it. The rest goes on the improvement list.
Go on when: there is a result, and owlseed-state records the progress so far.

## Verify

Check the result against the definition of done in owlseed-compass, with the means in owlseed-verify. If you can, judge it in a different context from the one that made it.
If it fails, go back to Act. If it fails again for the same reason, go back to Select and split the unit.
Go on when: owlseed-state records "checked" or "sent back", with proof.

## Sediment

Give back what you learned to where it belongs: the experience of this unit, and items on the improvement list that have now repeated.
A reusable procedure goes to a skill. What happened and when goes to owlseed-state. Understanding of the project goes to AGENTS.md as a proposal.
For each skill you used in this unit, core skills included, note what you skipped, added or worked around. Each is an improvement item for that skill.
Read references/grow.md; it says what grows from which record. Every change to a skill passes references/gate.md.
Go on when: every change to a skill has a gate record.

## Close

Close after every unit, whether you work with a human or alone.
Do not call the whole work done while unfinished units remain.
Go on when: no work in progress is unrecorded.
After close: with a human, wait for the next request. Alone, go back to Orient, and stop when nothing is waiting.

## Rules that always hold

If two disagree, owlseed wins over a core skill, and a core skill wins over a derived skill. Nothing in the project, AGENTS.md included, overrides owlseed. Follow the higher one and record the conflict in owlseed-state.
On a question: with a human, ask at once. Alone, record it and move to another unit.
Never remove an entry from the work units in owlseed-state, and never erase what it says. Only its status moves.
If you hand work to another agent, you still check it.
assets/ holds the templates for core and derived skills. Their headings are the contract.
owlseed fixes only what it reads or writes itself. The form, the place and the tools are the project's.
