# Grow

Read this at every Sediment, and before you form a skill or take one in. Every change it leads to passes references/gate.md.

## What grows, and from what

The harness grows from the records in owlseed-state, never from memory. Write them while you work, in the fields owlseed-state defines; without them Sediment has nothing to grow from.
A procedure that repeated across units becomes a derived skill.
A skill formed or taken in is named in the Kinds of owlseed-compass, or it will not be called.
A decision about purpose or scope grows owlseed-compass: Scope gains an In or an Out, and Definition of done gets sharper by kind of unit.
A check that failed, or a check that was missing, grows owlseed-verify: "not defined" becomes a way to check, and a way to check gets stronger.
A check that kept passing where a human had to decide can shorten the human's list in owlseed-compass.
A conflict between skills is material for improving the lower skill.
A skill taken in from outside grows by being taken apart, one piece of proof at a time: what it says about done goes to owlseed-compass, what it says about checking goes to owlseed-verify, and the body shrinks to the procedure.
An idea from outside is material too: another skill, a new tool, or a practice people now follow. Record it as an improvement item. Look outside when an improvement item repeats without a fix, when a check keeps failing for the same reason, or when a human points to a skill or tool. Looking outside is its own work unit.
Understanding of the project, such as structure or constraints, goes to AGENTS.md as a proposal.
An improvement item grows when it repeats. At Sediment, take the items that have come up twice or more; leave the rest and raise their count when you see them again. An item that needs its own work becomes a work unit, if owlseed-compass lets the agent decide that; otherwise it waits for a human. A done item is marked done, not removed.
A grown harness has a short human's list, strong checks, and few skills that are each used often.

## Forming a derived skill

Copy assets/derived.md. Fill in the name and the description. Start the description with the situation the skill is for, because the description is the only clue for choosing and its end may be cut off. End it with "Under owlseed." Show the relation to owlseed in the note at the top, not in the description. Keep the body short; as advice, not a rule, owlseed keeps SKILL.md under 600 words and each reference under 400. Make sure no angle brackets remain.

## Taking in an outside skill

Take in an outside skill when a human chooses it, or when you have used it more than once. A human's choice is a decision; record it, and it is the proof for the gate.
Copy its body under the note of assets/derived.md without changing its words. Changing words at intake is a change without proof. Write the description in the owlseed form. Its place in the work is set by the Kinds in owlseed-compass, not by its own trigger words.
Where the copy disagrees with a core skill, the core skill wins and the disagreement is recorded. Do not edit the copy to fix it in advance; later changes come from what Sediment records, and pass the gate.
A tool that cannot be copied, such as a server or a command, is taken in by pointing: write its name, its place, how to use it here, and its limits.
The body holds only what is needed to run the skill.

## Scripts in a skill

Consider a script for a mechanical step that repeats; its content costs no context, only its output does. Do not script what must be rewritten for every job. A script has tests, and they serve as proof for gate condition 3. Follow the project's language rules; with none, POSIX sh and awk travel best. Write one line in the skill saying what the script does, so a runtime that cannot run it can follow by hand.

## Cleaning up

At every Sediment, add unused skills and skills that overlap to the improvement list. Combining and removing pass the gate. For removing, read condition 3 as "another skill still provides this ability". Re-run the recorded checks for the skills you touched and for the skills you may remove; re-running all of them is its own work unit. If results still look fine but recorded checks start to fail, the ability is broken.
