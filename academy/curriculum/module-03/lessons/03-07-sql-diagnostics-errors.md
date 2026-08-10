# Lesson 3.7 — SQL Diagnostics and Application Errors

## Metadata

- **Estimated time:** 90 minutes
- **Required source:** `07_sql_diagnostics.pgm.sqlrpgle`
- **Validation status:** source reviewed; diagnostic values/messages pending runtime capture

## Learning Objectives

The learner can:

1. Explain what SQLSTATE and SQLCODE communicate.
2. Recognize success, no-data, warning, and error categories.
3. Use SQLSTATE as a portable primary condition signal while retaining SQLCODE as useful Db2 evidence.
4. Use `GET DIAGNOSTICS` to retrieve row count or condition information where appropriate.
5. Capture the first meaningful database diagnostic before changing code.
6. Avoid hard-coding a message observed only in one unvalidated environment.

## RPG and SQL Condition Data

RPG receives an SQL communication area automatically for embedded SQL. After SQL statements, Db2 sets SQL condition information.

The beginner decision model is:

```text
SQL statement
   |
   +-- success → continue with verified result
   +-- no data → explicit not-found/end path
   +-- warning → decide whether the warning matters
   +-- error → capture evidence and stop/handle deliberately
```

SQLSTATE is the standards-oriented condition code. SQLCODE remains useful because Db2 documentation and support diagnostics commonly reference it. The course teaches both rather than making learners memorize dozens of codes.

## No Data

End-of-data or no matching row is a normal application outcome in many queries. The program should not treat it as equivalent to an integrity failure, syntax error, or authority failure.

## GET DIAGNOSTICS

`GET DIAGNOSTICS` can retrieve information about the previous SQL statement in application code. Module 3 focuses on a small useful set:

- `ROW_COUNT` after DML
- returned SQLSTATE/condition information for a controlled error
- message text or constraint/table identity only after target validation proves the example works on the target release

The learner must execute GET DIAGNOSTICS at the correct point so later SQL does not replace the condition context they intended to inspect.

## Controlled Failure

The lesson uses a disposable constraint violation, not a syntax typo, because the goal is to prove the application can distinguish a database integrity failure and retrieve useful evidence.

Do not remove the constraint to “fix” the example.

## Bob-Assisted Activity

After capturing the actual SQLSTATE/SQLCODE, ask Bob to explain likely meaning and safe verification steps. Require it to distinguish facts from guesses. The actual Db2 diagnostic and current IBM documentation outrank Bob.

## Independent Task

Without Bob, classify these scenarios as likely success/no-data/warning/error behavior, then verify in the lab where applicable:

- SELECT INTO with a missing key
- cursor FETCH after the last row
- UPDATE matching exactly one disposable row
- INSERT violating a foreign key

## Production-Support Habit

Before editing source, capture:

- program/job/context
- statement or operation
- SQLSTATE
- SQLCODE
- row count if relevant
- full meaningful message/diagnostic
- target object
- expected behavior

A fast code change made before preserving evidence can destroy the trail needed to diagnose the original problem.

## Completion Criteria

The learner distinguishes major SQL outcome categories, retrieves diagnostic evidence, and explains an observed controlled failure without weakening the database rule.