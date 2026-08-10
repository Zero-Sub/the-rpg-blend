# Lesson 3.10 — Module Lab: Order Access Increment

## Metadata

- **Estimated time:** 150–180 minutes
- **Prerequisites:** Lessons 3.1–3.9
- **Required:** `../lab/module-03-lab.md`
- **AI mode:** review/reference only
- **Validation status:** design complete; first learner execution pending

## Learning Objectives

The learner independently demonstrates that they can:

1. prove the Module 2 prerequisite data state
2. create/verify Module 3 order objects
3. compile an externally described native RPG program
4. retrieve a header and related lines using keyed native I/O
5. compile/run a single-row SQLRPGLE lookup
6. process a multi-row SQL cursor safely
7. capture SQL no-data/error diagnostics
8. perform one controlled disposable data change
9. explain transaction prerequisites and run the approved transaction path only when validated
10. make and defend a native-vs-SQL decision
11. use Bob for review without surrendering ownership
12. leave the training environment in the required state

## Capstone Scenario

The RPG Blend Coffee Company needs a small order-access increment that later modules can modularize and expose through cleaner service interfaces.

The learner must prove both access models rather than writing two copies of the entire application.

## Required Evidence

- environment record
- DDL/system-name metadata
- compile action/diagnostics/object proof for each program
- native found/not-found and line-count results
- SQL SELECT INTO success/no-data results
- cursor row results/end condition
- one controlled diagnostic record
- disposable change before/after evidence
- transaction preflight outcome
- Git diff/status
- Bob finding disposition
- independent design defense

## AI Rule

Bob may explain a diagnostic, review a completed access sequence, and suggest tests. Bob may not generate the complete capstone solution, decide the target, or supply invented execution evidence.

## Independent Defense

With Bob closed, the learner explains:

1. compile-time vs runtime native file target
2. when `%FOUND` is used in the native lookup
3. how the equal-key read loop terminates
4. why SELECT INTO is one-row oriented
5. how the cursor detects end-of-data
6. what SQLSTATE contributes
7. why rollback requires environment preparation
8. which access style they would choose for one new requirement and why

## Safety Failures That Block Completion

- wrong schema/file target
- data change outside the learner objects
- unbounded/unexplained delete/update
- authority escalation to force a lab
- starting a transaction exercise without journaling/commit evidence
- ignoring a lock by ending another user's work
- Bob-generated code the learner cannot explain
- fabricated or missing runtime evidence

## Completion Criteria

The separate lab and assessment must pass, cleanup must be proven, and the learner must explain the access behavior without Bob open.