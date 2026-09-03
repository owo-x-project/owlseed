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

Forming, revising, merging and retiring derived skills; revising core skills;
reconstruction during a version migration. The normative text adds taking in an
external skill, which `docs/contracts.md` relies on.

**The conditions are identical for core and derived.** Condition 3 simply bears much
more weight on a core skill, because a core skill has a contract to keep satisfying.
Whether human approval is required is decided per project, by compass's boundary of
decision authority.

## The seven conditions

1. **There is evidence.** Which work unit's result produced this change can be
   recorded. Nothing changes on speculation alone.
2. **Recurrence or retention value.** It has appeared at least twice, or it is worth
   holding as a capability in its own right. A one-off procedure is not carved out --
   and the handoff's wording covers one-off *knowledge* as well as procedure.
3. **It does not break a guarantee.** For a core skill: it keeps satisfying the
   contract. For a derived skill: the verifications verify has already recorded still
   pass.
4. **It is not over-fitted.** With the specific values, paths and proper nouns of the
   triggering case removed, the skill's text still stands.
5. **The layer is right.** If state or history has leaked in, move it to L2; if
   project understanding has, move it to L3.
6. **It does not encroach on the seed.** It does not contradict the seed's norms, and
   it does not modify the seed itself.
7. **It is reversible.** Performed in a state that can be returned to -- which is
   where the gate connects to state's recovery procedure.

## How a condition is judged

Prefer executable verification wherever it exists. Where it does not, record the
reasoning in state's decision history in a form a human can audit later.

The record makes one weighting statement, and it is about condition 3: it bears
substantially harder on a core skill, which has a contract to keep satisfying.
Condition 2 is the one tied to the finding that selection accuracy drops as similar
descriptions accumulate; condition 4 is what keeps a skill from encoding one
incident.
