# Module 0 Lab — First Controlled Coffee Company Change

## Purpose

Complete one full IBM i development cycle on the connected Coffee Company application using the Academy's canonical learning loop:

**Learn → Practice → Prove → Review → Explain**

The goal is not to learn RPG syntax deeply. The goal is to prove that you can work safely in the IBM i development environment, make one controlled change, and explain the evidence.

## Estimated time

45–60 minutes.

## Before you start

You must have:

- VS Code and Code for IBM i installed.
- Access to the approved non-production IBM i training environment.
- An assigned learner library. Use that library everywhere this lab shows `<YOURLIB>`.
- A local clone of the Academy repository or instructor-provided Coffee Company workspace.
- Permission to compile in the assigned library.

Do not record passwords, private keys, tokens, MFA codes, customer data, PHI, or confidential system information in evidence.

---

## Part 1 — Verify context

### Goal

Prove that you know where you are before changing anything.

### Do this

1. Open VS Code.
2. Connect to the approved IBM i training system with Code for IBM i.
3. Verify the connection name and user profile.
4. Confirm your assigned learner library.
5. Locate the source that will be used for the Coffee Company starter.
6. Identify where the compiled program object will be created.

### Expect to see

You can state all five items without guessing:

- host or approved connection name;
- user profile;
- source location;
- build library;
- resulting program object name.

### If you do not see it

Use the troubleshooting ladder at the end of this lab. Do not switch systems, create objects, or delete anything to make the instructions fit.

### Prove it

Record:

- approved connection name: __________
- user profile: __________
- source: __________
- build library: __________
- target program: `<YOURLIB>/COFFEE00`

### Explain it

Why is a successful sign-on not enough evidence that you are in the correct place to make a change?

---

## Part 2 — Find and understand the Coffee Company starter

### Goal

Identify what the starter program does before changing it.

### Do this

Open `code/rpg/COFFEE00.rpgle` in the local Git workspace or the instructor-approved source location.

Starter source:

```rpgle
**free

ctl-opt dftactgrp(*no);

dcl-s message varchar(52) inz('Coffee Company system ready.');

dsply message;

*inlr = *on;
return;
```

Before running it, predict the displayed message.

### Expect to see

The program contains one visible behavior: it displays a short Coffee Company status message.

### Prove it

Write your prediction before compiling:

> Expected output: __________________________________________

### Explain it

Which artifact is editable source, and which artifact will be executable after compilation?

---

## Part 3 — Compile the known-good starting state

### Goal

Create and verify the baseline program object.

### Do this

Use the approved Code for IBM i action or the equivalent explicit command for the configured source location. For a source-member workflow, the command will follow this pattern:

```cl
CRTBNDRPG PGM(<YOURLIB>/COFFEE00) SRCFILE(<YOURLIB>/QRPGLESRC) SRCMBR(COFFEE00) OPTION(*EVENTF) DBGVIEW(*SOURCE) REPLACE(*YES)
```

Your instructor may provide a different approved action when source is deployed from the IFS or a local workspace. Follow the configured Academy build path; do not invent a deployment path.

### Expect to see

- compile completes successfully;
- `<YOURLIB>/COFFEE00` exists as `*PGM`;
- diagnostics show no unresolved compile error.

### Prove it

Record the compile action or command and the resulting object.

### Explain it

What does a successful compile prove? What does it **not** prove?

---

## Part 4 — Run the baseline

### Goal

Verify the starter behavior before changing it.

### Do this

Run the qualified program:

```cl
CALL PGM(<YOURLIB>/COFFEE00)
```

### Expect to see

`Coffee Company system ready.`

### Prove it

Record expected and actual output.

---

## Part 5 — Diagnose a controlled failure

### Goal

Use evidence instead of guessing when compilation fails.

### Do this

1. Remove the semicolon from the `dsply message;` statement.
2. Save the source.
3. Compile again.
4. Read the first useful diagnostic in Problems, terminal output, or the approved diagnostic view.
5. Record the message identifier or first-level text.
6. Restore the semicolon.
7. Save and compile again.
8. Verify that the program is known-good again.

### Expect to see

The broken source does not produce a successful new compile. The corrected source does.

### Prove it

Record:

- intentional error: __________
- useful diagnostic: __________
- correction: __________
- final compile result: __________

### Explain it

Why would calling an old existing `*PGM` after a failed compile be dangerous evidence?

---

## Part 6 — Make the controlled change

### Requirement

The Coffee Company wants the orientation program to display:

`Coffee Company development environment ready.`

### Before changing code

Write the acceptance criterion:

> When `<YOURLIB>/COFFEE00` is compiled from the changed source and called, the displayed text is exactly `Coffee Company development environment ready.`

### Do this

1. Change only the message text required by the requirement.
2. Save.
3. Inspect the local Git diff before compiling if your workflow uses local Git source.
4. Confirm no unrelated file or source change is present.
5. Compile.
6. Verify the intended `*PGM` object.
7. Run it.
8. Compare actual output to the acceptance criterion.

### Prove it

Keep evidence of:

- requirement;
- focused diff;
- successful compile;
- intended target object;
- actual output.

### Review it

Answer yes/no:

- [ ] I changed only the requirement.
- [ ] I compiled into the intended learner library.
- [ ] I verified the intended program object.
- [ ] Actual behavior matches the acceptance criterion.
- [ ] My diff contains no unrelated change.

---

## Part 7 — AI-assisted review

### Goal

Use AI as a reviewer, not as the owner of the change.

After completing your own change, use the approved AI assistant. IBM Bob is the Academy's primary IBM i implementation example when available.

Ask it to review the small change for:

- unintended behavior;
- missing verification;
- unsafe assumptions;
- documentation gaps.

Do not include secrets, credentials, customer data, PHI, or unnecessary system information.

For every material finding, record one disposition:

- accept;
- reject;
- investigate;
- defer.

Include one sentence of evidence supporting the disposition.

### Prove it

Record at least one AI finding or state that no material finding was produced. Your evidence must show your own decision, not just the AI response.

---

## Part 8 — Git evidence

If the course repository workflow uses Git, complete the previously taught Git workflow:

1. inspect status;
2. inspect diff;
3. run `git diff --check` when appropriate;
4. stage only intended files;
5. commit with a meaningful message;
6. confirm the final status is clean or intentionally explained.

Suggested commit message:

`Complete Module 0 Coffee Company controlled change`

---

# Independent challenge — Do It Without Me

Complete this challenge without step-by-step instructor direction and without asking AI to produce the workflow.

## Requirement

Change the Coffee Company orientation message to:

`Coffee Company Module 1 ready.`

## Required proof

You must independently:

1. verify connection and target context;
2. locate the correct source;
3. state the expected result before editing;
4. make only the required change;
5. compile;
6. verify the intended program object;
7. run and validate;
8. inspect the diff;
9. capture evidence;
10. explain what you did.

Course references are allowed. AI may be used only after your first independent attempt for explanation, diagnosis, or review.

## Completion criteria

- [ ] Correct environment identified.
- [ ] Correct source located without instructor navigation.
- [ ] Expected behavior recorded before editing.
- [ ] Change is minimal.
- [ ] Compile succeeds.
- [ ] Correct `*PGM` is verified.
- [ ] Runtime behavior matches the requirement.
- [ ] Diff is focused.
- [ ] Evidence is complete and safe.
- [ ] Learner can explain the workflow without AI assistance.

---

# Troubleshooting ladder

When stuck:

1. **Stop.** Do not create, delete, or switch things at random.
2. **Restate the goal.** What exact result are you trying to produce?
3. **Verify context.** Host → profile → source → library → target.
4. **Compare expected vs actual.** State the exact difference.
5. **Read the diagnostic.** Capture the first useful message.
6. **Use the course troubleshooting material.** Search by symptom.
7. **Use approved AI assistance if needed.** Ask for explanation or diagnostic possibilities, not an unverified fix.
8. **Verify any suggestion.** Use source, diagnostics, documentation, compile, and runtime evidence.
9. **Escalate with evidence.** Give the instructor: goal, expected result, actual result, diagnostic, context, and what you already checked.
