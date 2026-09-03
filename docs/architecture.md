# Architecture

## Vocabulary

The proposal used one word, "harness", for both the distributed skill and the whole
growing arrangement. That made it read as something immutable that nevertheless
grows, so the word was split:

| Term | Meaning |
|---|---|
| **owlseed** (the seed) | The immutable single skill that is distributed. Read-only. |
| **the grown harness** | What the project generates and improves around the seed: its capabilities, its state, its own understanding of itself. |
| **the harness** | Both together. |

## The four layers

| Layer | Rate of change | Contents | Owner |
|---|---|---|---|
| **L0 seed** | never | principles, lifecycle, contracts, acceptance gate, precedence, version | the distributed artefact (read-only) |
| **L1 capability** | low | the four core skills (names fixed) and derived skills the project generates | the project |
| **L2 state** | high | current position, work units, progress, decision history, verification contract, recovery procedure, improvements waiting to sediment | the project, owned by the state contract |
| **L3 project understanding** | human-led | stack, structure, constraints -- AGENTS.md | humans; the agent proposes |

**Splitting L2 out is the largest structural change the design decision record made
to the proposal.** The proposal routed all experience into project skills. That
inflates L1 with state logs and drops the selection accuracy of descriptions, since a
description is all a runtime has to go on. Splitting state out keeps L1 describable.

## Boundary rules

- **L1 vs L2** — a named, reusable procedure is L1. "What happened when" is L2.
- **L3** — holds project understanding only. If a norm has leaked in: delete the part
  that duplicates the seed, and keep the part that is genuinely project-specific
  (the seed never absorbs project-specific norms). If a procedure leaked in, move it
  to L1; if state leaked in, move it to L2.
- **L3 is read by humans too**, so the agent's tidying of it is proposed and applied
  at the end of work rather than immediately.
- **The seed knows nothing about the contents of L1, L2 or L3.**

Experience is not only used to *grow* L1. It is equally used to keep each layer in
the layer it belongs to.

## What the seed fixes, and what it does not

Fixed:

- the seven lifecycle stages and their order
- the invariant of each stage
- the four core contracts: name, guarantees, prohibitions, the stages that reference
  them, the description template, the body preamble
- the seven conditions of the acceptance gate
- precedence: seed > core > derived
- the layer boundary rules
- its own version and migration policy

Not fixed:

- **any path.** Where L1 lives is left to the runtime's discovery mechanism; where L2
  lives is left to the state contract.
- the data structure of state, and the storage format of the record of truth
- the means of verification
- project-specific knowledge, procedures and constraints, including any specific
  release, migration or debugging procedure

**What the seed fixes is names and contracts, nothing else.** Fixing locations was
considered and rejected: once L1 had become a name contract, making L2 follow the
same principle removed the need for an exception.

## Why the seed cannot hold a means of verification

The design takes it as a premise that **the means of verifying an outcome differs per
project**, and concludes that the seed cannot hold one.

So the seed does not require a *means*. It requires that **a verification contract
exists**, and it refuses to let work start in a project where one has not been
settled. The contract is the project's; the requirement that there be one is the
seed's.

## The seed's own structure

```
owlseed/
├── SKILL.md                 # description, the seven stages and invariants,
│                            # precedence, pointers to the contracts
└── references/
    ├── lifecycle.md         # each stage in detail
    ├── contracts/
    │   ├── compass.md
    │   ├── state.md
    │   ├── verify.md
    │   └── grow.md          # each: guarantees, prohibitions, stages, description template
    ├── preamble.md          # body preamble templates for core and derived skills
    ├── gate.md              # the seven conditions and how to judge them
    ├── migration.md         # per-version mapping and reconstruction procedure
    └── guidance.md          # recommendations with evidence, explicitly not norms
```

`SKILL.md` stays under 500 lines; detail goes to `references/`. `guidance.md` is
where "things the seed does not fix but has evidence for" live, and it is kept
clearly distinct from the norms.

**This is the normative artefact.** The documents in `docs/` explain it; they do not
override it.
