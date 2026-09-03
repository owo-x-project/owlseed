# Lifecycle

The normative text is `skills/owlseed/SKILL.md` and
`skills/owlseed/references/lifecycle.md`. This document records what was decided and
why.

## The unit is work, not a session

The design makes the base unit a **work unit** rather than a session, and treats a
session as something that breaks partway through a unit. A unit is sized to reach
verification within one session.

State is updated at every stage, so a session that ends mid-unit leaves the next one
able to resume from orientation.

## The seven stages

Germination happens once. After that, orient through close runs once per work unit.

| Stage | The question | Answered by | The invariant |
|---|---|---|---|
| **Germinate** | Where are the purpose, the state, and the means of verification? | grow, generating compass / state / verify | Do not start work until all four core skills exist. If the purpose cannot be read, ask a human. |
| **Orient** | Where are we now? Is the foundation intact? | state, verify, compass | Do not start new work on a broken foundation. Queue the repair as a work unit first. |
| **Select** | What is the next single unit? Does it serve the purpose? | state, compass | One unit at a time, sized to reach verification in one session. |
| **Act** | Do we have the capability? If not, is it worth building? | derived skills, grow | Do not modify the seed. Do not silently change the purpose or the verification contract; a change is recorded as a decision. |
| **Verify** | Can this be called verified? On what evidence? | verify | Never call something verified without evidence. On failure, return to act or split the unit. |
| **Sediment** | Which layer does this experience belong to? | grow, into L1 / L2 / L3 | Changes to L1 pass the acceptance gate. L3 is applied as a proposal. Norms that duplicate the seed are deleted. |
| **Close** | Can the next session pick this up? | state | Never finish leaving unrecorded work in progress. |

Among the findings the design cites as its grounds are four failure modes observed in
Anthropic's long-running harness work: trying to do everything at once, declaring
completion from looking at the progress file, leaving things in a broken state, and
calling something done without verifying it. The invariants above address the same
four, though the design record does not map them one to one. See
[foundations.md](foundations.md).

## Dialogue and autonomy are the same path

A request from a human becomes a work unit by going through *register in state →
check against compass → select*. It does not go straight to action.

That leaves only two differences between a conversational session and an autonomous
loop:

| | Dialogue | Autonomous |
|---|---|---|
| Where a unit enters | a human's request | the queue in state |
| On encountering a question | ask immediately | record it and move to another unit |

Everything else is identical. The practical payoff is that a request made in
conversation survives the session ending, because it was registered before work
began.

## When an improvement gets applied

The handoff proposed an immediate-versus-at-the-end split. It is absorbed like this:
an improvement found mid-work is sorted into **immediate** or **waiting to
sediment**. Waiting ones are queued in state and handled at the sediment stage,
through the gate.

The handoff gave four situations in which an improvement **may** be applied
immediately, mid-work:

- the agent judges it to be of high importance
- it directly affects the current problem
- deferring it may cause rework in later work
- continuing in a wrong state would spread harm to downstream deliverables

Anything that does not affect the current result, and can be applied later without
rework, is left until the end of the work.

The disposition on that list matters: it is **not** the sole control. The handoff's
wording is that the judgement is not governed by a fixed condition list alone, but
left to the agent looking at the situation, and the decision record preserved that
delegation unchanged.

The normative text compresses those four into two questions -- does it affect the
result of the current work unit, and does deferring it cause rework
(`skills/owlseed/references/lifecycle.md`). That compression is narrower than the
handoff, and it is tracked as a known drift in `NOTES.md`.

## Two responsibilities that did not become skills

Rather than add a fifth core skill, two responsibilities were folded into existing
contracts:

- **the boundary of decision authority** -- what must go back to a human, what the
  agent may decide alone -- belongs to **compass**.
- **the recovery procedure** -- how to get back when things break -- belongs to
  **state**.

Thickening two contracts was judged better than standing up a fifth skill, on two
grounds the record names: **name collision** -- which follows from publishing as open
source -- and selection accuracy between similar descriptions.
