# Acceptance gate

The normative text is `skills/owlseed/references/grow.md`. This document records what
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
seen while building: derived from the contract, or from the capability's own definition.

The same rule is what makes a bundled script's tests load-bearing rather than hygienic.
Conditions 2, 3 and 4 apply to a script the same way they apply to prose, and its tests
have to include inputs that were not used while writing it. Pruning re-runs the
recorded verifications for the same reason: a capability whose recorded verifications
start failing while results still look fine is the measured signature of one that has
quietly broken.

Note what this does not change. The conditions are still seven, and the count is fixed
in [architecture.md](architecture.md); changing it would be a major version. This is a
rule about how condition 3 is judged, which is what this section is for.

### Condition 6 no longer has a recursion to guard

The design record noted condition 6 as most easily broken when `owlseed-grow` revised
itself. Growth is now the seed's own role rather than a skill the project holds and
improves, so that case does not arise. Condition 6 still applies to every change: a
derived skill may not contradict the seed's norms, and nothing beneath the seed may
modify it.
