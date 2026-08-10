# Module 3 Instructor Guide — Files + Data Access

**Status:** development guide; runtime validation pending

## Instructor Intent

Module 3 is the learner's first serious bridge from language fundamentals and database fundamentals into application data access. Teach behavior and evidence before syntax speed.

Core teaching loop:

```text
Target → Predict → Access/Change → Observe condition → Verify → Explain
```

## Preflight

Before delivery:

- validate Module 2 prerequisite commit/data state
- run Module 3 DDL/seed/reset in learner-equivalent IBM i 7.5 library
- compile every RPGLE and SQLRPGLE source through the current Code for IBM i workspace flow
- confirm external file/system/record-format names
- capture actual expected results and SQL diagnostics
- validate lock demonstration or remove it from live delivery
- validate the transaction environment separately
- confirm no lab requires broader authority than the learner role
- recheck Bob/tool UI/version-sensitive statements

## Suggested Timing

| Lesson | Time |
|---|---:|
| 3.1 Two access models | 55 min |
| 3.2 DCL-F | 75 min |
| 3.3 Keyed reads | 90 min |
| 3.4 Native changes/locks | 90 min |
| 3.5 SELECT INTO | 90 min |
| 3.6 Cursors | 100 min |
| 3.7 Diagnostics | 90 min |
| 3.8 Transactions | 105 min |
| 3.9 Engineering choice | 65 min |
| 3.10 Capstone | 150–180 min |
| Assessment/defense | 75–90 min |

## 3.1 — Two Models

Do not frame native access as obsolete or SQL as magic. Ask learners to state the requirement/data shape first. Draw both paths to Db2 for i.

## 3.2 — DCL-F

Make compile-time versus runtime resolution the center of the lesson. Ask the learner to point to the actual external file before compile. Show how SQL-created order tables expose stable system names and record formats for native code.

## 3.3 — Native Reads

Demonstrate CHAIN found/not-found first. Then teach SETLL/READE as position + retrieve. Require expected record counts. A loop that cannot explain its termination does not pass.

## 3.4 — Changes and Locks

Use only key 5901 or instructor-assigned disposable equivalent. Require before/after proof. Lock demonstration is optional until validated safe; concept discussion is mandatory.

## 3.5 — SELECT INTO

Show SQLRPGLE build flow. Have learner map every SQL column to RPG host variable. Ask what enforces one-row-or-none. Run success and no-data cases.

## 3.6 — Cursor

Teach lifecycle on a board before code. First FETCH before loop is worth emphasizing. Ask what happens to host variables after no-data and why the program must not process them.

## 3.7 — Diagnostics

Preserve the original condition before experimenting. Capture SQLSTATE/SQLCODE and GET DIAGNOSTICS immediately where needed. Actual target messages go into validation records, not guesses in learner prose.

## 3.8 — Transactions

Read the preflight aloud the first time. A learner who stops because journaling/commitment-control evidence is missing has passed the safety decision. Use the instructor environment for live commit/rollback proof.

## 3.9 — Engineering Choice

Require tradeoffs and evidence. Ban unsupported “SQL is faster” and “native is faster” arguments. Existing code, set shape, target clarity, locks, diagnostics, testing, and team maintainability all matter.

## 3.10 — Capstone

Help in this order:

1. ask expected behavior
2. ask target/evidence
3. ask which interface rule applies
4. point to source/doc
5. provide narrow hint only when needed

Do not paste final code.

## Troubleshooting Ladder

- wrong object/file: stop and trace resolution
- compile error: first meaningful event/listing message
- not found unexpectedly: verify key + target + seed state
- extra lines: inspect key/cardinality/data state
- SQL +100: determine whether no-data is expected
- negative SQLCODE: preserve diagnostic, do not treat as EOF
- lock: identify context/owner; do not clear blindly
- transaction failure: verify preflight/journaling/commit scope before source changes
- Bob mismatch: runtime evidence + current primary docs win

## Production-Safety Signals

A learner is becoming ready when they naturally:

- name the target before access
- distinguish compile from runtime proof
- check found/end status before processing data
- predict row/record counts
- preserve diagnostics
- use disposable changes
- stop on unknown transaction prerequisites
- avoid unsupported performance claims
- explain AI findings instead of quoting them

## Pilot Record

Capture actual duration, compile failures, target-resolution confusion, lock behavior, SQL diagnostics, transaction setup friction, Bob misconceptions, assessment ambiguity, and every hidden instructor step.