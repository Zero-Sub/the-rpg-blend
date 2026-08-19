# Lesson 0.4 — First Controlled Change

## Purpose

Perform the first complete RPG Blend controlled-change cycle on the Coffee Company application.

## Learning objectives

By the end, the learner can baseline current behavior, make one minimal requirement-driven change, compile it, diagnose one controlled failure, verify the intended program object, and validate runtime behavior.

## Learn

Module 0 introduces the practical use of the RPG Blend Method without forcing every stage into one exercise.

Primary sequence:

**Assess → Understand → Stabilize → Test → Validate → Document → Govern → Repeat**

The core promise is simpler:

**Understand the system. Make a controlled change. Prove the result. Repeat.**

A successful compile is evidence, not complete proof. It does not by itself prove that:

- the right requirement was implemented;
- the right source was built;
- the right target object was created;
- runtime behavior is correct;
- boundary behavior is correct;
- the change is approved for production.

## Practice

Use the Module 0 lab to:

1. verify context;
2. record expected baseline output;
3. compile the known-good starter;
4. verify `<YOURLIB>/COFFEE00 *PGM`;
5. run and compare expected vs actual;
6. introduce the controlled missing-semicolon failure;
7. read the first useful diagnostic;
8. correct and return to known-good;
9. implement the specified Coffee Company message change;
10. compile and validate again.

## Prove

Required evidence:

- context record;
- baseline prediction;
- successful baseline compile;
- target-object proof;
- intentional diagnostic and correction;
- focused requirement-driven source change;
- expected and actual final behavior.

## Review

Ask:

- Did I change only what the requirement required?
- Did I prove the target rather than assume it?
- Did I read the diagnostic before changing more code?
- Did I validate runtime behavior after a successful build?

## Explain

Explain why calling an old `*PGM` after a failed compile could produce convincing but invalid evidence.

## AI-assisted activity

Only after your own diagnosis, ask the approved AI assistant to explain the compiler diagnostic or review your interpretation. Verify the explanation against the compiler evidence and course material.

## Common mistakes

- changing multiple things before recompile;
- assuming compile success equals requirement correctness;
- calling an unqualified or wrong-library program;
- fixing symptoms without reading diagnostics;
- letting AI propose a large rewrite for a tiny requirement.

## Completion criteria

You can perform the guided controlled-change cycle and explain the evidence for source, build target, diagnostic, and runtime result.
