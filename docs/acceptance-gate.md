# Acceptance gate

The normative text is `skills/owlseed/references/gate.md`. This document records what
was decided and why.

## Why there is a gate at all

**Self-improvement is not adopted unconditionally.** That is owlseed's own norm,
carried from the handoff: a change is adopted on the grounds of actual results and
verification. Two external findings corroborate it. An append-only memory with no
acceptance condition grows without bound and regresses, and adopting a candidate
capability only when verification confirms an improvement **is becoming** the
standard.

A second finding shapes how the gate judges rather than whether it exists: there is
evidence that **an LLM's evaluation of its own output tends to get more lenient with
iteration.** So the gate prefers executable evidence, and where there is none, it
leaves an audit trail for a human.

The design record lists that leniency among its **unresolved** risks, and it stays
unresolved: in the common case where no executable verification exists, the judgement
still rests on the model, and the audit trail is a way for a human to catch it later
rather than a way to prevent it.

## What passes through it

Forming, revising, combining and removing derived skills; revising core skills;
reconstruction during a version migration; taking in an outside skill. Germination is
the one partial case: a core skill made from a template passes conditions 3 and 7 only,
because there is no prior unit to be the proof and nothing yet to repeat.

**The conditions are identical for core and derived.** Condition 3 simply bears much
more weight on a core skill, because a core skill has a contract to keep satisfying.
Whether human approval is required is decided per project, by compass's list of who
decides. A newly defined basic check is a change to verify and goes through the same
gate and the same list; the seed adds no special rule for it.

## The seven conditions

1. **There is proof.** Which work unit's result led to this change can be recorded.
   For an idea or a skill from outside, the proof is the decision that chose it or the
   unit that tried it. Nothing changes on a guess.
2. **It repeats, or it is worth keeping on its own.** It appeared at least twice, or
   it is an ability worth holding by itself. A one-off procedure is not carved out --
   and the handoff's wording covers one-off *knowledge* as well as procedure.
3. **Nothing promised is broken.** For a core skill: every heading of the template in
   the seed is present and filled, and the fixed lines that say what owlseed asks are
   still there, compared with the seed's template and never with the project's copy.
   For a derived skill: the checks verify has already recorded still pass.
4. **It is not too specific.** With the values, paths and names of the triggering
   case hidden, the text still holds. If not, it is a case and belongs in the record of
   decisions.
5. **It is in the right place.** State and history go to state; structure, stack and
   constraints go to AGENTS.md; a skill keeps only procedures. If AGENTS.md repeats a
   rule from owlseed, propose removing it.
6. **It does not touch owlseed.** It does not go against owlseed and does not change
   owlseed itself.
7. **It can be undone.** The point before the change can be reached by the recovery
   steps in state.

## How a condition is judged

Prefer executable verification wherever it exists. Where it does not, write why you
judged so. Either way the judgement is a gate record in state, with the change, its
proof, and a reason for each condition, in a form a human can audit later.

Condition 3 bears substantially harder on a core skill, which has a contract to keep
satisfying. Condition 2 is the one tied to the finding that selection accuracy drops as
similar descriptions accumulate; condition 4 is what keeps a skill from encoding one
incident.

### Condition 3 is not satisfied by the verification that built the capability

This is the one judging rule added after the design record was written, and it comes
from a measurement rather than from an argument. Of 222 tools that self-evolving agents
synthesised and kept, **96.8% scored zero correctness on held-out conformance suites**
while executing cleanly and passing every in-session verifier call. Structural validity
was masking functional incorrectness. See [foundations.md](foundations.md).

Condition 3 as the design record words it -- the verifications verify has already
recorded still pass -- is precisely the check that measurement found near-worthless for
a newly formed capability, because those verifications were written against the inputs
the capability was built on. So the normative text requires the check to use inputs not
seen while building: derived from the contract, or from what the ability is meant to do.

The same rule is what makes a bundled script's tests load-bearing rather than hygienic.
Conditions 2, 3 and 4 apply to a script the same way they apply to prose, and its tests
have to include inputs that were not used while writing it. Removing a skill re-runs the
recorded checks for the same reason: a skill whose recorded checks start failing while
results still look fine is the measured signature of one that has quietly broken.

Condition 3 is vacuous for a skill that did not exist before: it touches nothing, so
nothing it promised can be broken. The normative text says so, and makes the skill's
first use its first recorded check, so that the next change to it has something to
re-run.

Note what this does not change. The conditions are still seven, and the count is fixed
in [architecture.md](architecture.md); changing it would be a major version. This is a
rule about how condition 3 is judged, which is what this section is for.

### Condition 5 at intake

Taking in an outside skill copies its body without a change of wording, and the copy
usually holds things that belong elsewhere -- a definition of done, a way of checking.
Read literally, condition 5 would then fail every intake, and the agent would have to
reword without proof, which condition 1 forbids. The normative text resolves it: the
misplaced parts stay in the copy and each is recorded as an improvement item with its
destination, and that satisfies condition 5 for the copy. Moving them is later, gated
work, one piece of proof at a time. The exception covers the recorded destination, not
the content: an intake with no such records does not pass.

### Condition 6 no longer has a recursion to guard

The design record noted condition 6 as most easily broken when `owlseed-grow` revised
itself. Growth is now the seed's own role rather than a skill the project holds and
improves, so that case does not arise. Condition 6 still applies to every change: a
derived skill may not contradict the seed's norms, and nothing beneath the seed may
modify it.
