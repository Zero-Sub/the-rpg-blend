# Lesson 3.4 — Native Data Changes and Record Locks

## Metadata

- **Estimated time:** 90 minutes
- **Required source:** `04_native_order_update.pgm.rpgle`
- **Training boundary:** disposable Module 3 order only
- **Validation status:** source reviewed; lock/runtime behavior pending

## Learning Objectives

The learner can:

1. Explain native `WRITE`, `UPDATE`, and `DELETE` at a beginner level.
2. Use an update-capable file definition deliberately.
3. Preview/identify the exact record before a change.
4. Verify the record after the change.
5. Explain why input-for-update can create record-lock concerns.
6. Distinguish normal record-lock discussion from commitment-control locks taught in Lesson 3.8.

## Change Discipline

The Module 2 SQL habit still applies:

```text
Verify target → identify record → predict → change → verify → cleanup
```

Native I/O does not make row/record changes intrinsically safer. A keyed operation can still target the wrong object, the wrong key, or a record someone else is using.

## UPDATE

The training example reads a disposable order for update and changes only its status. Before `UPDATE`, the learner proves:

- correct host/profile/library
- correct `ORDHDR` runtime target
- disposable order key
- found status
- original status
- intended new status

After the update, the program or a separate read-only verification query confirms the value.

## WRITE

`WRITE` creates a new record using a record format. The database still enforces applicable constraints. Module 3 does not teach learners to bypass a failed write by removing constraints or changing base data casually.

## DELETE

A delete is destructive even in training. The lab deletes only a disposable order created for the exercise, after proving its key and dependent-line state. Referential constraints can legitimately reject a header deletion while child lines exist; that rejection is useful evidence about the model.

## Locks

Record-oriented update processing can hold a record lock depending on how the record is obtained and the file/access mode. The course treats a lock as observable operational state, not an invisible nuisance to defeat.

If a second session cannot update the same record, the learner asks:

- which job/session owns the relevant lock?
- which access operation obtained it?
- is the first program still processing normally?
- is commitment control involved?
- what is the approved recovery path?

Do not end another user's job or clear locks as a beginner troubleshooting shortcut.

## Guided Lab

Using one disposable order:

1. prove it exists
2. read it for update
3. record original status
4. update status
5. verify changed status
6. restore or delete the disposable data according to the lab

A controlled two-session lock observation may be performed only if the validation environment supports it without disrupting other users.

## Bob-Assisted Activity

Ask Bob to review the change sequence for wrong-target, wrong-key, stale-read, lock, and cleanup risks. Reject any suggestion that says “just retry forever,” “kill the locking job,” or “remove the constraint” without environment/approval evidence.

## Independent Task

Write a change checklist for a one-record native update. The checklist must contain enough evidence that another reviewer can identify the host, file, key, before value, after value, and cleanup decision.

## Completion Criteria

The learner performs a controlled native change only against disposable data, verifies the result, and can explain why lock evidence matters before moving into transactions.