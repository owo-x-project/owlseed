---
name: owlseed-state
description: Says where this project's records are and what each record holds: the current position, the work units, the decisions, and how to get back to a safe state. Use it when you continue work, check progress, want to know what to do next or how far the last session got, or need to recover from a broken state. Under owlseed.
---

> This is a core skill under owlseed. If you have not read owlseed, read it first. If this skill and owlseed disagree, follow owlseed and record the conflict.
> The headings and the first line under each are the contract with owlseed; do not change them. owlseed reads the current position at every stage, and reads this skill to find where the records are.

## Where the records are and in what form

owlseed asks here at every stage: where do I read the current position, and where do I write records? The records themselves are kept outside this skill, at the place named here. Changing a record is not a change to this skill.
<Where the records are, and in what form. Advice: JSON with fixed fields, so that an AI does not rewrite it by accident; a place the runtime does not protect; the position and the open units apart from the closed units, so that Orient reads only the first>

## Fields of each record

These are the records owlseed writes, and the fields each record needs at least.
The current position: the unit in progress and the stage.
A work unit: what it is, where it came from, its status, each change of status with when and why, the progress so far, each check with its result and its proof, and what it taught, or that it taught nothing. The status is one of waiting, in progress, checked, or closed.
An improvement item: what you saw, in which unit, where it belongs, how many times it has come up, and whether it is done.
A decision: what changed in the purpose, the scope or a way of checking, why, and in which unit.
A gate record: the change, its proof, and a reason for each of the seven conditions.
An open question or a conflict: what you could not decide, or which texts disagreed, in which unit, and the answer when it comes.
Status is the only field that changes; nothing else is erased, and no entry is removed.
<The fields as you keep them, with the names you use>

## Safe state and how to get back

owlseed asks here at Orient, and when something breaks: is this a safe point, and how do I get back to one? Gate condition 7 uses this.
<What a safe point is, for example: everything is recorded, a commit exists, and the basic check passes. Advice: make a commit part of it; what is not committed is lost with the working tree. How to get back, for example: return to the last commit>

## owlseed version

owlseed compares this with its own version at Germinate.
<The owlseed version at the time of germination>
