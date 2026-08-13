# The RPG Blend Academy

## RPGBA-101 Module 1: RPG Fundamentals — Read, Change, Test — and Coffee

**Status:** Release Candidate 1  
**Estimated time:** 6-8 hours including labs and capstone  
**Prerequisite:** Module 0 or equivalent supervised IBM i development workflow experience  
**Primary environment:** Visual Studio Code, Code for IBM i, Git, IBM Bob  
**Lab environment:** approved non-production IBM i partition or learner-owned PUB400 account/private libraries

## Why this module exists

Module 0 teaches how to work safely in the IBM i environment. Module 1 starts the deeper RPG path. The learner moves from compiling a sample to understanding, changing, testing, and reviewing a small modern RPG program.

The course teaches modern fully free-form RPG first. Learners are told that they will encounter fixed-form source, cycle-driven logic, subroutines, indicators, externally described files, SEU, PDM, and RDi in real systems, but those are not the primary teaching workflow here.

## Measurable learning objectives

By the end of Module 1, the learner can:

- Explain the visible structure of a small modern fully free-form RPG program.
- Create a program map before editing unfamiliar source.
- Declare and initialize common character, numeric, date, indicator, array, and constant values.
- Explain packed-decimal precision and distinguish technical capacity from business validation.
- Build assignment, arithmetic, comparison, Boolean, and string expressions.
- Use selected built-in functions and identify conversion/precision risks.
- Implement and trace IF/ELSEIF/ELSE and SELECT/WHEN decisions.
- Implement bounded FOR, DOW, and DOU loops and explain termination.
- Create and call a small internal procedure with a clear DCL-PR/DCL-PI contract.
- Compile with an approved Code for IBM i action and interpret diagnostics.
- Test normal, boundary, invalid, and regression cases.
- Inspect a Git diff and explain every intended change.
- Use IBM Bob for explanation, review, and test suggestions without outsourcing understanding or validation.

## The safe change loop

1. **Verify context** — host, identity, branch, source, current/build library, target object.
2. **Understand source** — map inputs, outputs, decisions, side effects, calls, and dependencies.
3. **Define the change** — state exact acceptance criteria and tests.
4. **Change minimally** — make the smallest clear change.
5. **Compile** — treat compiler acceptance as one evidence point.
6. **Test** — compare expected and actual behavior.
7. **Review** — self-review, Bob review, and peer review where assigned.
8. **Commit** — keep only intentional source and evidence.

This aligns with the broader RPG Blend Method: **Assess → Understand → Stabilize → Test → Modernize → Validate → Document → Govern → Repeat.** Module 1 emphasizes Understand, Test, Validate, Document, and Govern.

## Lesson map

### Lesson 1 — Read a Modern RPG Program

- Identify `**free`, `ctl-opt`, declarations, executable logic, output, termination, and procedure boundaries.
- Read before changing.
- Build a program map.
- Separate source facts from inferred intent.

**Bob activity:** explain source section by section, explicitly separating facts, assumptions, and unanswered questions.  
**Independent task:** map a second program without Bob, then compare Bob's review afterward.

### Lesson 2 — Declare Data That Matches the Business

- `dcl-s`, `dcl-c`, initialization, scope.
- `char`, `varchar`, `packed`, `int`, `date`, `ind`, arrays.
- Packed precision and capacity.
- Technical validity versus business validity.

**Bob activity:** review declarations for capacity, initialization, and business-rule assumptions.  
**Independent task:** correct a declaration set without Bob and justify every type/length/precision choice.

### Lesson 3 — Build Expressions and Use Built-In Functions

- Assignment, arithmetic, comparison, Boolean logic.
- Parentheses for readability.
- Selected BIFs: `%trim`, `%len`, `%upper`, `%lower`, `%subst`, `%scan`, `%char`, `%dec`, `%dech`, `%date`, `%diff`, `%abs`.
- Intermediate precision and conversion behavior.

**Bob activity:** predict likely risks and tests, not fixes.  
**Independent task:** hand-trace intermediate values, run, then explain any mismatch.

### Lesson 4 — Express Business Decisions Clearly

- `if/elseif/else`.
- `select/when/other`.
- Branch priority and exact boundaries.
- Invalid paths first where appropriate.

**Bob activity:** inspect a decision tree for unreachable or shadowed branches.  
**Independent task:** repair branch ordering and prove exact-boundary tests.

### Lesson 5 — Repeat Work with Bounded Loops

- `for`, `dow`, `dou`.
- Arrays and `%elem`.
- Start, progress, termination.
- Off-by-one and nontermination risks.

**Bob activity:** identify loop assumptions and missing termination evidence.  
**Independent task:** implement a bounded aggregation loop without Bob and prove first/last item behavior.

### Lesson 6 — Separate Logic with Procedures

- `dcl-pr`, call, `dcl-proc`, `dcl-pi`, return value.
- One responsibility and explicit inputs.
- Procedure contract versus implementation.
- Regression testing after extraction.

**Bob activity:** review the procedure interface and suggest tests after the learner has a working implementation.  
**Independent task:** extract one calculation without Bob, compile, test, and explain the diff.

## Capstone — Blend Order Calculator

Enhance the starter program to:

- Reject order amounts less than or equal to zero.
- Apply 0% below 500.00, 5% from 500.00 through 999.99, and 10% at 1000.00 and above.
- Use half-adjust monetary conversion for the calculated discount where required by the exercise.
- Classify shipping as STANDARD below 999.99 final/order threshold as defined in the capstone instructions and PRIORITY at the configured threshold.
- Split the final total into three installments where the third absorbs any remaining cents.
- Use a focused procedure for discount calculation.
- Prove the required boundary matrix.

### Required capstone test cases

| Order | Expected discount | Expected final | Required reasoning |
|---:|---:|---:|---|
| -0.01 | Invalid | N/A | No downstream processing |
| 0.00 | Invalid | N/A | No downstream processing |
| 0.01 | 0.00 | 0.01 | Smallest positive case |
| 499.99 | 0.00 | 499.99 | Just below discount threshold |
| 500.00 | 25.00 | 475.00 | Exact 5% threshold |
| 750.00 | 37.50 | 712.50 | Normal 5% case |
| 999.99 | 50.00 | 949.99 | Precision/rounding case |
| 1000.00 | 100.00 | 900.00 | Exact 10% threshold |

For 999.99, the unconverted 5% amount is 49.9995. The exercise uses this case specifically to distinguish truncating conversion from half-adjust monetary conversion.

## Compile and diagnostics workflow

The Academy uses a workspace-scoped Code for IBM i action that deploys local source first and compiles the resolved stream file. Before execution, the learner verifies build library, program object, and source path.

Command pattern:

```cl
CRTBNDRPG PGM(<buildlib>/<object>)
           SRCSTMF('<remote-source-path>')
           DFTACTGRP(*NO)
           ACTGRP(*CALLER)
           OPTION(*EVENTF *SRCSTMT)
           DBGVIEW(*SOURCE)
           TGTRLS(*CURRENT)
           REPLACE(*YES)
```

`OPTION(*EVENTF)` supports editor-associated compiler diagnostics. `DBGVIEW(*SOURCE)` is used for the Academy debug-friendly build. The learner must still inspect the resolved command and target before execution.

## Git workflow

Before commit:

```text
git status
git diff
git diff --check
```

The learner must explain every changed line, remove unrelated edits, exclude credentials/generated output, and create one focused commit.

## IBM Bob rules

Bob may:

- Explain unfamiliar RPG.
- Identify likely missed impacts and assumptions.
- Review a focused diff.
- Explain diagnostics.
- Suggest boundary and regression tests.
- Draft documentation that the learner validates.

Bob may not replace:

- Source reading.
- Requirement understanding.
- Environment verification.
- Compile/runtime evidence.
- Security rules.
- Human review.
- The independent task.

Learners record accepted, corrected, and rejected Bob findings and the evidence used for each disposition.

## Production safety and security

- Work only on the assigned non-production host/profile/library/path.
- Never use production/client data, PHI, credentials, tokens, private keys, or unrestricted logs in source, screenshots, Git, or AI prompts.
- Do not request broad authority to bypass a compile or runtime problem.
- Do not assume a successful sign-on or compile proves correct context.
- Stop when the resolved command, target, data boundary, or authority is unclear.

## Completion criteria

- Six lesson labs completed with evidence.
- Knowledge checks completed with at least 80% overall.
- Capstone meets all required test cases.
- Git diff contains only intentional changes.
- Bob findings are dispositioned with evidence.
- Learner can explain the final program without Bob open.
- No credential, production-data, PHI, or unauthorized-system exposure.

## Release status

Static curriculum and source are RC1. Final release requires live IBM i compile/runtime validation, Code for IBM i workflow validation, independent RPG technical review, learner pilot, and closure of all Critical/High defects.

## Primary validation sources

- IBM i 7.6 ILE RPG Programmer's Guide.
- IBM i 7.6 ILE RPG Reference.
- Current Code for IBM i documentation and Academy Quick Start Handbook.
- Current IBM Bob documentation for any version-sensitive Bob behavior.

Third-party/IBM sources validate terminology and behavior; Academy explanations, examples, labs, tests, and capstone design are original.