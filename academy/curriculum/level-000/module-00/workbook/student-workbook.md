# Module 0 Student Workbook — IBM i Orientation

## Student information

- Name: ______________________________
- Date started: _______________________
- Approved connection name: __________
- User profile: _______________________
- Assigned learner library: __________

Do not record passwords, private keys, tokens, MFA codes, customer data, PHI, or confidential system details.

# Learning loop

Use this sequence throughout Module 0:

**Learn → Practice → Prove → Review → Explain**

The engineering promise behind the module is:

**Understand the system. Make a controlled change. Prove the result. Repeat.**

---

# 1 — Where Am I?

In your own words:

1. IBM Power is:  
   ________________________________________________________________

2. IBM i is:  
   ________________________________________________________________

3. A partition is:  
   ________________________________________________________________

4. A library is:  
   ________________________________________________________________

5. An IBM i object is:  
   ________________________________________________________________

6. A source member is:  
   ________________________________________________________________

7. A program object (`*PGM`) is:  
   ________________________________________________________________

8. The IFS is:  
   ________________________________________________________________

9. A job is:  
   ________________________________________________________________

10. Why might someone still say “AS/400” or “iSeries”?  
    ________________________________________________________________

## Context record

Before any change, I can identify:

- [ ] approved host/connection;
- [ ] user profile;
- [ ] source location;
- [ ] build library;
- [ ] target object.

Explain why “I connected successfully” is not enough proof that you are safe to modify an object:

________________________________________________________________

---

# 2 — Which Tool Should I Use?

Complete the table.

| Need | Tool I would choose | Why |
|---|---|---|
| Edit RPG source | | |
| Browse IBM i libraries/objects | | |
| Run a quick SQL query while coding | | |
| Use Run SQL Scripts | | |
| Work with 5250 or spooled files | | |
| Inspect approved operational views | | |
| Investigate a broad performance symptom | | |
| Ask AI to explain unfamiliar IBM i code | | |

## Tool-selection scenarios

1. You need to make a small RPG source change. What is your home-base tool?  
   ________________________________________________________________

2. You need to inspect a result set using SQL and want the Academy's modern development workflow. What do you try first?  
   ________________________________________________________________

3. You need a mature SQL administration/performance feature not exposed in the VS Code workflow. What tool might be more appropriate?  
   ________________________________________________________________

4. A user says “the system is slow.” Should you immediately turn on or reconfigure collectors? Why or why not?  
   ________________________________________________________________

5. When is a legacy tool such as PDM, SEU, STRSQL, or RDi relevant to a new learner?  
   ________________________________________________________________

---

# 3 — Find the Coffee Company

Record the starting state.

- Repository/workspace: __________________________________________
- RPG source: _________________________________________________
- IBM i build library: _________________________________________
- Program object: ______________________________________________

## Source versus object

Explain this relationship:

```text
source
  ↓ compile
program object
  ↓ call/run
runtime behavior
```

________________________________________________________________

What can change in source without changing the existing program object?

________________________________________________________________

---

# 4 — First Controlled Change

## Starting prediction

Before compiling the starter, what do you expect it to display?

________________________________________________________________

## Baseline evidence

- Compile action/command: ______________________________________
- Compile successful: Yes / No
- Program object verified: _____________________________________
- Object type: _________________________________________________
- Expected output: _____________________________________________
- Actual output: _______________________________________________

## Diagnostic exercise

- Intentional defect: __________________________________________
- First useful diagnostic: _____________________________________
- What the diagnostic told me: _________________________________
- Correction: __________________________________________________
- Recompile successful: Yes / No

Explain why running an old program after a failed compile can mislead you:

________________________________________________________________

---

# 5 — Requirement and proof

Requirement:

> The Coffee Company orientation program must display `Coffee Company development environment ready.`

Write the acceptance criterion in your own words:

________________________________________________________________

## Change record

- Source changed: ______________________________________________
- Intended target: _____________________________________________
- Before-change prediction recorded: Yes / No
- Diff reviewed before finalizing: Yes / No
- Compile successful: Yes / No
- Intended object verified: Yes / No
- Expected runtime result: _____________________________________
- Actual runtime result: _______________________________________

## Review

- [ ] Only the requirement was changed.
- [ ] The target environment/library was correct.
- [ ] The source was saved before compiling.
- [ ] The intended program object was verified.
- [ ] Runtime evidence matches the acceptance criterion.
- [ ] Git evidence contains no unrelated change.

---

# 6 — Read-only SQL observation

Your instructor will provide an approved read-only query appropriate to the training environment.

- Tool used: ___________________________________________________
- Query purpose: _______________________________________________
- What the result told me: _____________________________________
- Why this was safe/read-only: _________________________________

Do not create, alter, update, insert, or delete data in this exercise unless the instructor has explicitly changed the lab scope and provided a controlled training target.

---

# 7 — AI-assisted engineering

AI tool used, if available: ____________________________________

What context did you provide?

________________________________________________________________

What did the AI suggest or explain?

________________________________________________________________

What evidence did you use to verify it?

________________________________________________________________

Disposition of one material finding:

- Finding: _____________________________________________________
- Decision: Accept / Reject / Investigate / Defer
- Evidence: ____________________________________________________

Explain why successful use of IBM Bob or another AI product is not the same as mastering the engineering competency:

________________________________________________________________

---

# 8 — Git evidence

- Starting status: _____________________________________________
- Files changed: _______________________________________________
- Diff reviewed: Yes / No
- `git diff --check` result, when used: _________________________
- Commit message: ______________________________________________
- Final status: ________________________________________________

What does Git evidence prove? What does it not prove?

________________________________________________________________

---

# 9 — Troubleshooting record

When I got stuck, I used this order:

1. Stop.
2. Restate the goal.
3. Verify host → profile → source → library → target.
4. Compare expected versus actual.
5. Read the diagnostic.
6. Use course troubleshooting material.
7. Use approved AI for explanation if needed.
8. Verify any suggestion.
9. Escalate with evidence.

Record one problem you encountered:

- Goal: ________________________________________________________
- Expected: ____________________________________________________
- Actual: ______________________________________________________
- Diagnostic: __________________________________________________
- Context checked: _____________________________________________
- What I tried: ________________________________________________
- Resolution: __________________________________________________

---

# 10 — Independent challenge: Do It Without Me

Requirement:

> Change the Coffee Company orientation message to `Coffee Company Module 1 ready.`

Complete this after your first independent attempt. Course references are allowed. AI may help explain, diagnose, or review after the attempt, but it may not supply the workflow for you.

- [ ] I verified the environment without instructor navigation.
- [ ] I located the correct source without instructor navigation.
- [ ] I wrote the expected behavior before editing.
- [ ] I made only the required change.
- [ ] I compiled successfully.
- [ ] I verified the intended `*PGM`.
- [ ] I ran and validated the behavior.
- [ ] I reviewed the diff.
- [ ] I captured safe evidence.
- [ ] I can explain the entire workflow without AI assistance.

## Intervention record

Instructor help required:

- None
- Clarifying question only
- Hint
- Step-by-step guidance
- Instructor performed an action

Where did assistance occur?

________________________________________________________________

---

# 11 — Explain-back

Answer without AI assistance.

1. What is the relationship between IBM Power and IBM i?
2. What is the difference between source and a `*PGM`?
3. Why does the library/build target matter?
4. What does Code for IBM i provide?
5. When might ACS be the better tool?
6. What should you do first when the screen/result does not match the instructions?
7. What did you change in the Coffee Company application?
8. What evidence proves the intended object was created?
9. What evidence proves runtime behavior?
10. What did AI contribute, and what did you independently verify?

Instructor notes:

________________________________________________________________

---

# Module 0 readiness

I am ready for Module 1 when I can independently:

- [ ] verify IBM i context;
- [ ] select an appropriate basic tool;
- [ ] distinguish source from executable object;
- [ ] locate the Coffee Company source;
- [ ] make a small controlled change;
- [ ] compile and read a basic diagnostic;
- [ ] verify the intended program object;
- [ ] run and validate behavior;
- [ ] review Git evidence;
- [ ] use AI without surrendering verification;
- [ ] explain the workflow and evidence.

The area I still need help with is:

________________________________________________________________
