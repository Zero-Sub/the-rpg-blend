# Lesson 3.4 — Native Data Changes and Record Locks

## Metadata

- **Estimated time:** 90 minutes
- **Required source:** `04_native_order_change.pgm.rpgle`
- **Training boundary:** disposable Module 3 order only
- **Validation status:** source reviewed; lock/runtime behavior pending

## Learning Objectives

Explain native `WRITE`, `UPDATE`, and `DELETE`; define update/output/delete usage deliberately; prove the exact record before change; verify after change; recognize record-lock risk; distinguish ordinary update locks from commitment-control locks introduced in Lesson 3.8.

## Change Discipline

```text
Verify target → identify record → predict → change → verify → cleanup
```

Native I/O does not make a data change intrinsically safer. The wrong runtime file or wrong key is still a defect.

## Disposable Cycle

The canonical example reserves order 5901 and runs only after proving it is unused:

1. CHAIN → not found
2. set all required external fields
3. WRITE `OHDRR`
4. CHAIN and verify NEW
5. set STATUS=READY and UPDATE
6. CHAIN and verify READY
7. DELETE
8. CHAIN and prove not found

If any check differs from expectation, stop.

## Constraints Still Matter

SQL-created keys/checks/referential rules remain part of the database object. A native operation that violates a database rule should fail; the course captures the failure instead of removing the rule.

## Locks

Update-capable record access can create lock contention. A lock is operational evidence to understand, not something a beginner should defeat by ending another job. Capture job/session, target file/key, access operation, transaction status, and approved recovery path.

Commitment-control locks are taught separately because their scope/release behavior depends on commitment configuration.

## Bob Activity

Review the disposable cycle for target, key, constraint, lock, verification, and cleanup risks. Reject blind retries, authority expansion, or kill-job advice.

## Independent Task

Create a reviewer checklist containing host, runtime file, key, before value, after value, verification, and cleanup.

## Completion Criteria

Learner completes the disposable cycle and can explain why target/lock evidence matters.