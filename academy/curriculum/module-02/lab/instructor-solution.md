# Module 2 Lab — Instructor Solution and Scoring Guide

**Instructor-only source**  
**Validation status:** reviewed; PUB400 execution evidence pending

This guide provides expected behavior and scoring guidance for `module-02-lab.md`. It is not learner-facing and should not be distributed as a shortcut to the capstone.

## Expected Base Model

The canonical development SQL is under `../code/sql/`.

Expected objects:

- `CATEGORY`
- `PRODUCT`
- `INVENTORY`
- `ACTIVE_PRODUCT_SUMMARY` after Part I
- `IX_PRODUCT_CATEGORY` after Part I

Expected base row counts after seed:

- CATEGORY: 3
- PRODUCT: 5
- INVENTORY: 5

## Expected Query Outcomes

### Query 1 — Active products below 16.00

Expected rows, ascending by price then SKU:

1. `MER-MUG-01` — RPG Blend Logo Mug — 12.00
2. `COF-MORN-12` — Morning Blend 12 oz — 14.95
3. `COF-DECF-12` — House Decaf 12 oz — 15.95

### Query 2 — Missing roast level

Expected products:

- Pour Over Starter Kit
- RPG Blend Logo Mug

Accept equivalent ordering if the learner did not claim a deterministic order. Prefer an explicit `ORDER BY` for the final submission.

### Query 3 — First three by product ID

Expected IDs:

- 1001
- 1002
- 1003

### Query 4 — Product/category join

Expected row count: 5.

Parent: `CATEGORY.CATEGORY_ID`  
Child/foreign key: `PRODUCT.CATEGORY_ID`

### Query 5 — At or below reorder point

Expected products:

- House Decaf 12 oz — 7 on hand / 8 reorder
- Pour Over Starter Kit — 5 on hand / 5 reorder

Expected row count: 2.

### Query 6 — Product count by category

Expected:

- Coffee — 3
- Equipment — 1
- Merchandise — 1

Expected grain: one row per represented category.

### Query 7 — Category total quantity below 30

Base totals:

- Coffee: 42 + 18 + 7 = 67
- Equipment: 5
- Merchandise: 26

Expected qualifying groups:

- Equipment — 5
- Merchandise — 26

## Constraint Tests

Accept any safe test that clearly targets the intended rule and is cleaned up if it unexpectedly succeeds.

Strong examples:

- duplicate `CATEGORY_ID = 10` → primary key rejection
- duplicate SKU `COF-MORN-12` with a new product ID → unique constraint rejection
- product with `CATEGORY_ID = 9999` → foreign-key rejection
- `ACTIVE = 'X'` → CHECK rejection
- negative product price → CHECK rejection
- missing required product name → NOT NULL rejection

Do not award full credit if the learner treats a syntax error as evidence that a business constraint works.

## Controlled DML

The learner's disposable key may differ from the canonical `2999` / `LAB-TEMP-01` values. Score the process, not the chosen unused identifier.

Required evidence:

1. key/SKU not already present
2. insert succeeds
3. inserted values verified
4. exact update predicate preview returns 1
5. update affects intended row
6. update verified
7. exact delete predicate preview returns 1
8. delete removes intended row
9. cleanup query returns 0

Critical failure: learner changes a permanent seed row or runs an unbounded UPDATE/DELETE without explicit instructor-controlled error-example context.

## View

A strong solution resembles:

```sql
create view <schema>.ACTIVE_PRODUCT_SUMMARY as
    select P.PRODUCT_ID,
           P.SKU,
           P.PRODUCT_NAME,
           C.CATEGORY_NAME,
           P.PRICE,
           I.QTY_ON_HAND,
           I.REORDER_POINT
    from <schema>.PRODUCT P
    join <schema>.CATEGORY C
      on C.CATEGORY_ID = P.CATEGORY_ID
    join <schema>.INVENTORY I
      on I.PRODUCT_ID = P.PRODUCT_ID
    where P.ACTIVE = 'Y';
```

Accept equivalent column order/naming if the learner explains the contract and the joins are correct.

## Index

The canonical exercise creates an index on `PRODUCT(CATEGORY_ID)`. Accept a different reasonable index only if the learner can explain the access pattern it is intended to support and explicitly avoids claiming measured performance improvement from the tiny dataset.

## Suggested Scoring

| Area | Points |
|---|---:|
| Environment and target verification | 10 |
| DDL, keys, constraints, and data types | 20 |
| SELECT fundamentals | 10 |
| Joins and relationship reasoning | 15 |
| Aggregation and grain | 10 |
| Controlled DML safety | 20 |
| View/index understanding | 5 |
| Bob evidence and independent explanation | 5 |
| Cleanup and reproducibility | 5 |
| **Total** | **100** |

### Passing threshold

- 80 points minimum
- all critical safety gates passed
- required cleanup complete
- learner can explain the submitted SQL

## Critical Failure Conditions

Regardless of numeric score, require correction before passing if the learner:

- exposes a credential, token, private key, PHI, customer data, or production data
- runs destructive SQL outside the assigned learner schema
- runs an unbounded UPDATE or DELETE against a non-disposable dataset
- removes integrity constraints merely to bypass a failed statement
- submits Bob-generated SQL they cannot explain
- cannot identify which schema/table a data-changing statement targets
- leaves disposable data or Module 2 objects in an unexpected state after cleanup is required

## Common Misconceptions and Coaching Questions

### “A library and schema are exactly the same thing.”

Coaching question: What else can an IBM i library contain besides relational database objects?

### “The query ran, so the join is right.”

Coaching question: What relationship and row count did you expect before execution?

### “DISTINCT fixes duplicates.”

Coaching question: Which relationship created the extra rows?

### “NULL is blank.”

Coaching question: How would Db2 distinguish a known blank value from an absent value?

### “We have a WHERE clause, so UPDATE is safe.”

Coaching question: How many rows does that predicate actually identify right now?

### “The index made it faster.”

Coaching question: What measurement or access-plan evidence supports that claim?

## Alternate Solutions

Accept technically equivalent SQL that:

- remains within the learner schema
- preserves required integrity rules
- produces the required business result
- has deliberate NULL behavior
- uses understandable naming
- does not weaken safety controls
- can be explained by the learner

Do not force learners to match whitespace, alias letters, constraint names, or one specific valid expression when an equivalent solution is clearer.

## Validation Evidence to Capture During Pilot

The instructor/reviewer should capture:

- PUB400 IBM i release observed
- Db2 for IBM i extension version
- successful DDL execution order
- actual SQLSTATE/message for each negative test
- base row counts
- expected query result rows
- reset behavior
- time required by a first-time learner
- unclear instructions or hidden prerequisites

Update the module validation record after the pilot instead of silently changing expected outcomes.
