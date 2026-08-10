# Lesson 3.8 — Transactions, Journaling, and Commitment Control

## Metadata

- **Estimated time:** 105 minutes
- **Required:** `environment/TRANSACTION_PREFLIGHT.md`
- **Executable source:** `08_transaction_order.pgm.sqlrpgle`
- **Validation status:** concepts source-reviewed; executable environment pending

## Learning Objectives

The learner can:

1. Explain a transaction as a business unit of related changes.
2. Explain why journaling/commitment-control preparation matters on IBM i.
3. Explain a commitment boundary.
4. Distinguish changes under commitment control from changes outside it.
5. Demonstrate commit and rollback only in a validated environment.
6. Explain how commitment control changes lock/recovery behavior at an introductory level.
7. Stop safely when prerequisites are unknown.

## Business Unit First

An order header without its required lines is a partial business state. The training transaction therefore treats header + line creation as one unit:

```text
Create header
Create lines
All valid? ---- yes ----> COMMIT
     |
     no
     v
  ROLLBACK
```

The transaction boundary comes from the business rule, not from arbitrary code size.

## IBM i Preparation

Commitment control is not activated merely because source contains a COMMIT statement. Files/resources must be participating appropriately, and IBM i commitment control must be active in the execution context. Journal configuration and authority are environment responsibilities.

That is why Module 3 has a preflight rather than a “type these commands until it works” lab.

## SQL and RPG Vocabulary

Embedded SQL uses SQL `COMMIT` and `ROLLBACK` statements. Native RPG also has commitment-control support, including a file-definition `COMMIT` keyword and RPG `COMMIT`/`ROLBK` operations. Module 3's executable transaction increment uses embedded SQL so the transaction is visible around multiple relational changes; learners still learn to recognize the native vocabulary.

## Locks Under Commitment Control

Commitment-control locks have rules/lifetimes that differ from ordinary record locks. Commit or rollback can release commitment-control locks. The exact lock scope depends on commitment configuration and access behavior.

Do not generalize one lab observation into a universal lock statement without checking the environment and IBM documentation.

## Mandatory Preflight

Before execution, the learner must prove:

- intended tables are journaled as required
- commitment control can be started/used in the approved context
- compiler/SQL commit option is known
- learner has only normal approved authority
- cleanup/recovery is documented

If not, use the non-executable alternate path in the preflight document.

## Positive Test

Expected outcome in validated transaction environment:

1. start clean
2. create disposable header
3. create valid line(s)
4. commit
5. prove all intended rows exist

## Failure Test

Expected outcome:

1. start clean
2. create disposable header
3. cause one controlled line failure
4. capture SQL condition
5. rollback
6. prove no partial transaction rows remain

The failure must be intentional and isolated. Never cause a shared-system incident to demonstrate rollback.

## Bob-Assisted Activity

Ask Bob to review the transaction plan for missed partial-failure cases. It may suggest tests. It may not declare the environment journaled, start commitment control, or assert rollback safety without evidence.

## Independent Task

Without Bob, draw a transaction boundary for an order with two lines and identify three failure points. For each, state what should exist after rollback.

## Completion Criteria

The learner can explain commitment control and transaction prerequisites, and either executes the approved commit/rollback matrix on a validated IBM i or correctly follows the documented alternate path without seeking unsafe authority.