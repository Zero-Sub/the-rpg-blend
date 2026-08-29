# Lesson 2.8 — Safe Data Changes: INSERT, UPDATE, and DELETE

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.8
- **Estimated time:** 90 minutes
- **Prerequisites:** Lessons 2.3–2.7
- **Required file:** `../code/sql/06_safe_data_changes.sql`
- **Training boundary:** learner-owned PUB400 schema only
- **Validation status:** source reviewed; execution validation pending

## Today's Coffee

Reading a menu is low risk. Changing the recipe card used by every barista is not. SQL has the same shift in risk: SELECT observes; INSERT, UPDATE, and DELETE change state.

## Learning Objectives

The learner can:

1. Explain the purpose of INSERT, UPDATE, and DELETE.
2. Use explicit column lists in INSERT statements.
3. Prove an UPDATE or DELETE target set with SELECT before changing it.
4. Use narrow predicates for training changes.
5. Verify the result after each data-changing statement.
6. Explain why a syntactically valid statement can still be operationally unsafe.
7. Identify when to stop instead of broadening authority or predicates.
8. Explain why commitment control is deferred to Module 3.

## Why This Matters

A SELECT that returns too many rows is inconvenient. An UPDATE that changes too many rows can create an incident.

The Academy therefore teaches a repeatable change discipline before syntax depth:

```text
Verify target
    ↓
Preview rows with SELECT
    ↓
Predict row count
    ↓
Run one controlled change
    ↓
Verify actual result
    ↓
Clean up / document evidence
```

## INSERT

Use an explicit target and column list:

```sql
insert into YOURSCHEMA.PRODUCT
    (PRODUCT_ID, CATEGORY_ID, SKU, PRODUCT_NAME, ROAST_LEVEL, PRICE, ACTIVE, INTRO_DATE)
values
    (2999, 20, 'LAB-TEMP-01', 'Temporary Lab Brewer', null, 19.95, 'Y', current_date);
```

The explicit column list makes the intended mapping visible and avoids relying on the physical column order.

Constraints still apply. An INSERT can fail because of:

- duplicate primary/unique key
- invalid foreign key
- NOT NULL violation
- CHECK violation
- incompatible data type or size
- insufficient authority

## UPDATE

Before UPDATE, run the same predicate as a SELECT:

```sql
select PRODUCT_ID, SKU, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';
```

Expected result: **exactly one row**.

Only then:

```sql
update YOURSCHEMA.PRODUCT
set PRICE = 21.95,
    PRODUCT_NAME = 'Temporary Lab Brewer - Revised'
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';
```

Then SELECT the row again and compare the changed values to the requirement.

## DELETE

DELETE removes rows, not the table definition.

Preview first:

```sql
select PRODUCT_ID, SKU
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';
```

Then delete only that row:

```sql
delete from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';
```

Then verify zero matching rows remain.

## The Dangerous Statement

```sql
update YOURSCHEMA.PRODUCT
set PRICE = PRICE * 1.10;
```

This can be valid SQL and still be unsafe because it has no row-limiting predicate. In a real environment, “it ran successfully” would be the wrong success criterion.

Do not run this statement in the lab.

## Target Proof Checklist

Before a data change, say out loud or record:

- host
- user profile
- schema
- table
- business requirement
- predicate
- expected row count
- verification query
- cleanup/reset plan

If any answer is uncertain, stop.

## Why Module 2 Does Not Pretend COMMIT Solves Everything

Commitment control, journaling, isolation, locks, COMMIT, and ROLLBACK are operational topics that depend on environment and application behavior. Module 3 teaches them with Files + Data Access.

The Module 2 training library may not be configured like an enterprise journaled application library. Do not teach learners that typing `ROLLBACK` is a universal safety net.

## IBM Bob-Assisted Activity

Give Bob a completed DML statement and ask for a production-safety review. Require it to identify:

- exact target
- row predicate
- constraints
- expected row count
- verification query
- cleanup/rollback concern

If Bob says “safe” without environment evidence, challenge the conclusion.

## Guided Lab

Run `06_safe_data_changes.sql` one statement at a time.

The script intentionally:

1. proves the temporary row does not exist
2. inserts one disposable row
3. verifies it
4. previews one-row UPDATE target
5. updates it
6. verifies it
7. previews one-row DELETE target
8. deletes it
9. verifies cleanup

Do not batch-run the file during the first pass.

## Independent Task

Without Bob, write a safe UPDATE against a new disposable training row that changes exactly one column and one row. Your submission must include:

- preview SELECT
- expected row count
- UPDATE
- verification SELECT
- cleanup statement

Do not alter one of the five permanent seed products.

## Common Mistakes

- Running UPDATE or DELETE before a preview SELECT.
- Checking the table name but not the schema.
- Treating a WHERE clause as automatically safe even when it matches many rows.
- Removing a constraint or broadening authority to make a test pass.
- Assuming commit/rollback behavior without checking journaling and commitment control.
- Failing to verify the actual changed values.
- Forgetting cleanup in a shared learning environment.

## Pro Tips

- Build a habit of copying the exact WHERE predicate between preview and change, then reviewing the statement again.
- For high-risk production work, independent peer verification is stronger than self-review alone.
- Capture before/after evidence appropriate to the change and data sensitivity.
- If the expected row count is one and the preview shows two, stop and investigate. Do not “pick one” casually.

## Manager's Perspective

Safe SQL behavior is a readiness signal. A learner who pauses to prove target rows is developing production judgment. A learner who immediately asks for more authority or removes constraints when blocked needs coaching before broader access.

## Knowledge Check

1. Why use an explicit column list in INSERT?
2. What should happen before an UPDATE or DELETE?
3. Why can an UPDATE with a WHERE clause still be unsafe?
4. What should you do if the expected target is one row but SELECT returns two?
5. Why is a successful SQL completion message not enough evidence?
6. Why does Module 2 defer transaction mechanics to Module 3?
7. Name three constraints that can reject an INSERT.
8. What evidence should be captured after a DELETE?

## Completion Criteria

The learner completes the disposable-row DML cycle, proves every target set before changing it, cleans up successfully, and completes the independent safe-update task without Bob.

## Final Sip

The best database developers are not the ones who type UPDATE fastest. They are the ones who know exactly what will change before they press Run.

## References

See M2-IBM-04, M2-SUP-07, M2-ENV-01, and the Academy code/safety standards.
