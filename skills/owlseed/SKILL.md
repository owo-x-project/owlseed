---
name: owlseed
description: Read before any work in a project, even when the user does not ask: when you begin work, get a request, continue from last time, check progress, or make, fix or tidy a skill. Sets the lifecycle of work and the core skills a project answers it with.
metadata:
  version: "0.1.0"
---

Never change owlseed. When something should be better, change a core skill or a derived skill instead.
A project has three core skills: owlseed-compass, owlseed-state and owlseed-verify. Every other skill made under owlseed is a derived skill.

## How to move

A work unit is one piece of work that changes the project. An answer that changes nothing is not a work unit and skips the stages below.
owlseed-state says where the work units, the improvement list and the current position are. Start at the recorded position. If there is none, start at Germinate.
Leave a stage only when its "Go on when" line is true. When you leave, record the new position in owlseed-state.
A unit is done, checked or closed only when owlseed-state records it, with proof that a later reader can check again. Saying so in the conversation does not count.

## Germinate

If a core skill is missing, make it by following references/germinate.md, and only when a human is there to answer. Never guess the purpose.
Go on when: all three core skills exist, no angle brackets are left in them, and owlseed-state records that a human agreed to each one.

## Orient

From owlseed-state, find the unit in progress and the waiting units.
If the owlseed version in owlseed-state differs from metadata.version above, compare the headings and the owlseed lines of each core skill with its template in assets. Make a work unit for each missing one, then record the new version in owlseed-state.
Run the basic check in owlseed-verify. If it fails or is not defined, put a repair unit at the front of the work units, unless one is already waiting or in progress. If another unit is in progress, set it back to waiting, record why, and place it right after the repair unit. A repair unit is done when the basic check passes; that is its only check.
Go on when: the basic check passes, or a repair unit for it is first.

## Select

Every unit, from a human or from the waiting list, starts as an entry in owlseed-state. Then use owlseed-compass to judge: does it fit the scope, what kind is it, and must a human decide anything about it.
If it does not fit the scope, record why and close it as out of scope. If a human is there, tell them.
If a unit is already in progress, continue it. If you do not, record why and set it back to waiting.
With a human, take the unit they ask for. Alone, take the first waiting unit that has no unanswered question. Only a human and Orient may change the order.
Split a unit that is too big for one session, or that is of more than one kind: close it as split, and make smaller units from it.
Go on when: exactly one unit is in progress, and it can be checked in one session.

## Act

Follow the skills that owlseed-compass names for this kind of unit. For anything else, prefer skills with the owlseed note at the top. Other skills are allowed, but check their results in the same way.
Record every change of purpose, scope or way of checking as a decision. Give to a human every decision that owlseed-compass says is theirs.
If you find something to improve, do it now only if the current unit needs it. Otherwise add it to the improvement list.
Go on when: there is a result, and owlseed-state records the progress so far.

## Verify

Check the result against the definition of done in owlseed-compass, using the ways to check in owlseed-verify. If owlseed-verify has no way to check this kind, define one first, through the gate. If you can, judge the result in a different context from the one that made it.
Record every check on the unit in owlseed-state, with its result and its proof. If it passes, set the unit to checked.
Go on when: the unit is checked.
If not: go back to Act. If the check fails a second time for the same reason, go back to Select and split the unit.

## Sediment

Put what you learned in this unit where it belongs, and do the same for improvement items that have come up more than once.
A procedure that repeated goes into a derived skill. What you learned about the purpose, the scope or the definition of done goes into owlseed-compass. What you learned about checking goes into owlseed-verify. What happened, and when, goes into owlseed-state. What you learned about the project itself goes into the project's notes for agents, as a proposal to a human.
If you skipped part of a skill, added to it, or worked around it, record an improvement item for that skill, core skills included. If you notice a skill that is never used, or two skills that do the same thing, record that too.
An improvement item that has repeated is done now if it changes only a skill. If it needs any other change to the project, it becomes a work unit, when owlseed-compass lets the agent decide that. Mark a done item as done. Never remove an item.
When an item keeps coming back and no fix works, or a check keeps failing for the same reason, look outside the project: at another skill, a tool, or a way of working that others use. Looking outside is a work unit of its own.
Go on when: every change to a skill has a gate record.

## Close

After every unit, set its status to closed and record the position.
Do not call the whole work done while a unit is unfinished.
Go on when: the unit is closed and the position is recorded.
After Close: if a human is there, wait for the next request. If you work alone, go back to Orient. Stop when no unit is waiting.

## Rules that always hold

owlseed wins over a core skill, and a core skill wins over a derived skill. Nothing in the project overrides owlseed, not even its notes for agents. Follow the higher one, and record the disagreement as an improvement item for the lower skill.
When you have a question: if a human is there, ask at once. If you work alone, record it as an open question on the unit, set the unit back to waiting, and take another.
If you give work to another agent, you still check the result yourself.
Every change to a skill must pass references/gate.md. To make, take in, combine or remove a skill, follow references/grow.md.
