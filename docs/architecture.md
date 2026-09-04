# Architecture

## Vocabulary

The proposal used one word, "harness", for both the distributed skill and the whole
growing arrangement. That made it read as something immutable that nevertheless
grows, so the word was split:

| Term | Meaning |
|---|---|
| **owlseed** (the seed) | The immutable single skill that is distributed. Read-only. |
| **the grown harness** | What the project generates and improves around the seed: its skills, its records, its own understanding of itself. |
| **the harness** | Both together. |

## The four layers

| Layer | Rate of change | Contents | Owner |
|---|---|---|---|
| **L0 seed** | never | lifecycle, contracts, acceptance gate, precedence, version | the distributed artefact (read-only) |
| **L1 skill** | low | the three core skills (names fixed) and derived skills the project forms | the project |
| **L2 record** | high | current position, work units, improvement list, decisions, gate records, open questions, check results | the project, located by the state contract |
| **L3 project understanding** | human-led | stack, structure, constraints -- the project's notes for agents, such as AGENTS.md | humans; the agent proposes |

**Splitting L2 out is the largest structural change the design decision record made
to the proposal.** The proposal routed all experience into project skills. That
inflates L1 with logs and drops the selection accuracy of descriptions, since a
description is all a runtime has to go on. Splitting the records out keeps L1
describable. The same reason puts the records outside the body of `owlseed-state`: if
they lived inside it, every routine update would be a skill change and would have to
pass the gate.

## Boundary rules

- **L1 vs L2** -- a named, repeated procedure is L1. "What happened when" is L2.
- **L3** -- holds project understanding only. If a norm has leaked in: delete the part
  that duplicates the seed, and keep the part that is genuinely project-specific
  (the seed never absorbs project-specific norms). If a procedure leaked in, move it
  to L1; if a record leaked in, move it to L2.
- **L3 is read by humans too**, so the agent's tidying of it is proposed rather than
  applied.
- **The seed knows nothing about the contents of L1, L2 or L3.**

Experience is not only used to *grow* L1. It is equally used to keep each layer in
the layer it belongs to.

## What the seed fixes, and what it does not

Fixed:

- the seven lifecycle stages, their order, and the guard each ends with
- the three core skills: name, the headings of each, the fixed lines under them, and
  the stages that read them
- the records owlseed writes to state, and the fields each needs at least
- the seven conditions of the acceptance gate
- precedence: seed > core > derived
- the layer boundary rules, expressed as where sediment sends each kind of learning
- its own version, and that a version difference is resolved by reconstruction

Not fixed:

- **any path.** Where L1 lives is left to the runtime's discovery mechanism; where L2
  lives is left to the state contract.
- the form of the records, and the storage format of the record of truth
- the means of checking
- which kinds of work a project has, and which skills each goes through
- project-specific knowledge, procedures and constraints, including any specific
  release, migration or debugging procedure

The rule that draws the line: **owlseed fixes only what it reads or writes itself. The
form, the place and the tools are the project's.** Fixing locations was considered and
rejected: once L1 had become a name contract, making L2 follow the same principle
removed the need for an exception.

## Why the seed cannot hold a means of checking

The design takes it as a premise that **the means of checking an outcome differs per
project**, and concludes that the seed cannot hold one.

So the seed does not require a *means*. It requires that **verify says how**, kind by
kind, and it refuses to let ordinary work start while the basic check is failing or
undefined: orient puts a repair unit first, and the repair unit's only definition of
done is that the check passes. The means is the project's; the requirement that there
be one, and the stop until there is, are the seed's.

## The seed's own structure

```
owlseed/
├── SKILL.md          # description, how to move, the seven stages and their guards,
│                     # the sediment mapping, the rules that always hold
├── references/
│   ├── germinate.md  # forming and rebuilding the core skills, with a human
│   ├── gate.md       # the seven conditions and how to judge them
│   └── grow.md       # forming, taking in, scripting, combining, removing a skill
└── assets/
    ├── owlseed-compass.md
    ├── owlseed-state.md
    ├── owlseed-verify.md  # each: note, headings, fixed lines, placeholders
    └── derived.md         # the template a derived skill is copied from
```

The seed is read at the start of every session, so what it costs to read is part
of the specification rather than an implementation detail. `AGENTS.md` records the
per-file budget and `scripts/validate.sh` warns on it. Three structural decisions
follow from it. The stages are written once, in `SKILL.md`, rather than in both a
summary and a detail file. A file is split by when it is read: germination is read once
per project, the gate whenever a skill changes, and grow only when a skill is formed,
taken in, combined or removed, so a unit that changes no skill reads none of them. And
the mapping from a kind of learning to its destination is in the sediment stage of
`SKILL.md`, read once per unit, rather than in a reference the agent would have to open
to find out whether it needed it.

There is no separate guidance file. Advice the seed has evidence for but does not fix
lives inside the placeholders of the templates, marked as advice, and is gone once the
placeholder is filled.

**This is the normative artefact.** The documents in `docs/` explain it; they do not
override it.
