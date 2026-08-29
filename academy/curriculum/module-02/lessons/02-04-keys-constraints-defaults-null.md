# Lesson 2.4 — Keys, Constraints, Defaults, and NULL

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.4
- **Estimated time:** 75 minutes
- **Prerequisites:** Lesson 2.3
- **Required files:** `01_create_catalog.sql`, `02_seed_catalog.sql`
- **Sample application:** Coffee Catalog data integrity
- **Validation status:** source reviewed; execution validation pending

## Today's Coffee

A café recipe has rules: espresso must be in the cup, milk cannot be negative, and a decaf label cannot be left to guesswork. Database constraints are similar. They prevent invalid states at the boundary where data enters the system.

## Learning Objectives

The learner can:

1. Explain primary, unique, and foreign keys.
2. Explain `NOT NULL`, `DEFAULT`, and `CHECK` constraints.
3. Distinguish NULL from blank, zero, and an empty string.
4. Predict which inserts should succeed or fail based on the table definition.
5. Explain referential integrity using the Coffee Catalog.
6. Design at least one negative test without Bob.

## Why This Matters

If every application must remember every data rule, the first forgotten rule becomes bad data. Database constraints protect data regardless of whether the writer is RPG, SQL, an API, a batch load, or another authorized interface.

Constraints do not replace all business logic. They protect rules that are universally true for the data model.

## Key Types

### Primary key

A primary key uniquely identifies a row and does not allow NULL. A table has at most one primary key, although that key can contain more than one column.

In the training model:

```sql
constraint PK_PRODUCT primary key (PRODUCT_ID)
```

### Unique constraint

A unique constraint prevents duplicate key values under its defined rules. The Coffee Catalog uses it for SKU:

```sql
constraint UQ_PRODUCT_SKU unique (SKU)
```

### Foreign key

A foreign key connects a dependent row to a valid parent key:

```sql
constraint FK_PRODUCT_CATEGORY foreign key (CATEGORY_ID)
    references YOURSCHEMA.CATEGORY (CATEGORY_ID)
```

A product cannot reference a category that does not exist.

## Referential Integrity

```text
CATEGORY 10: Coffee
      |
      +--> PRODUCT 1001
      +--> PRODUCT 1002
      +--> PRODUCT 1003

PRODUCT.CATEGORY_ID must reference a valid CATEGORY.CATEGORY_ID.
```

The database rule prevents an orphan product whose category identifier has no matching parent row.

## NULL

NULL means **the absence of a value**. It is not:

- zero
- blank
- an empty string
- the word `NULL`

The non-coffee products intentionally have no roast level:

```sql
select SKU, PRODUCT_NAME, ROAST_LEVEL
from YOURSCHEMA.PRODUCT
where ROAST_LEVEL is null;
```

Do not test NULL with `= NULL`.

## Defaults

A default supplies a value when an INSERT does not provide one and the column definition permits the default to apply.

Example:

```sql
ACTIVE char(1) not null default 'Y'
```

A default is not the same as a rule that the value must always be `Y`. The `CHECK` constraint defines the allowed domain:

```sql
check (ACTIVE in ('Y', 'N'))
```

## Guided Constraint Tests

After loading the valid seed data, create test statements in a scratch SQL file. Run one at a time and clean up only the rows that successfully insert.

### Duplicate primary key — expected rejection

```sql
insert into YOURSCHEMA.CATEGORY
    (CATEGORY_ID, CATEGORY_NAME, ACTIVE)
values
    (10, 'Duplicate Key Test', 'Y');
```

### Invalid foreign key — expected rejection

```sql
insert into YOURSCHEMA.PRODUCT
    (PRODUCT_ID, CATEGORY_ID, SKU, PRODUCT_NAME, PRICE)
values
    (9001, 9999, 'BAD-FK-01', 'Invalid Category Test', 10.00);
```

### Invalid CHECK value — expected rejection

```sql
insert into YOURSCHEMA.CATEGORY
    (CATEGORY_ID, CATEGORY_NAME, ACTIVE)
values
    (99, 'Bad Status Test', 'X');
```

### Nullable roast level — expected success if all other rules are satisfied

```sql
insert into YOURSCHEMA.PRODUCT
    (PRODUCT_ID, CATEGORY_ID, SKU, PRODUCT_NAME, ROAST_LEVEL, PRICE)
values
    (9002, 20, 'NULL-OK-01', 'Null Roast Test', null, 9.95);
```

If you run the successful test, delete only that exact test row afterward.

## IBM Bob-Assisted Activity

Give Bob the table definition and ask it to propose positive and negative constraint tests. Before executing any generated test:

1. predict success or failure yourself
2. verify the target schema
3. identify any cleanup needed
4. check whether the test could modify a base training row

## Independent Task

Design one new negative test without Bob. It must target one of these rules:

- `NOT NULL`
- `UNIQUE`
- `CHECK`
- foreign key

Write down the expected result before execution and explain which constraint should reject it.

## Common Mistakes

- Assuming NULL behaves like blank or zero.
- Using `= NULL` instead of `IS NULL`.
- Thinking a foreign key automatically creates meaningful business relationships when the data model is wrong.
- Treating defaults as validation.
- Disabling or removing a constraint just to make a failing insert succeed.
- Failing to clean up successful test rows.

## Pro Tips

- Negative tests are as important as happy-path inserts when validating a database design.
- Name constraints so error investigation can point to a recognizable rule.
- If many applications independently validate the same invariant, consider whether it belongs in the database definition.
- Do not add a constraint to production data without first understanding whether existing rows satisfy it.

## Manager's Perspective

Database constraints reduce the number of places where teams must correctly repeat the same data-integrity rule. They also make defects fail closer to the source. But adding constraints to an established system is a change-management activity: existing data, batch processes, vendor interfaces, and support procedures must be considered.

## Knowledge Check

1. What makes a primary key different from a nullable unique column?
2. What does a foreign key protect?
3. What does NULL mean?
4. Why does `ROAST_LEVEL = NULL` not correctly test for missing values?
5. What is the difference between `DEFAULT 'Y'` and `CHECK (ACTIVE in ('Y','N'))`?
6. Why should a negative constraint test include cleanup planning?
7. Why can adding a new constraint to an existing production table be risky?

## Completion Criteria

The learner loads the seed data, explains each integrity rule, successfully demonstrates at least three expected constraint rejections, and completes one independent negative test.

## Final Sip

Quality is easier to maintain when the system refuses impossible recipes instead of relying on everyone to remember the rules.

## References

See M2-IBM-03, M2-IBM-04, and M2-SUP-04 in the source register.
