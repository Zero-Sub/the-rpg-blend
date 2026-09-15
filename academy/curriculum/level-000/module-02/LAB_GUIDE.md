# Module 2 Lab Guide

## Lab operating rules

Every lab uses an approved non-production IBM i context. Before DDL or DML, verify host, profile, branch, script, schema/library, target object, expected affected rows, and transaction/recovery plan.

Bob is a review/learning aid. Where the lab says “learner first,” do the reasoning before asking Bob.

---

# Lab 1 — Map Native and SQL Data Concepts

## Goal

Build a correct IBM i data mental model before writing SQL.

## Tasks

1. Connect to the assigned training system.
2. Identify the Coffee Company schema/library and supplied objects.
3. Record each object using native and SQL terminology.
4. Identify whether any source members or database-file members exist in the inspected area.
5. Explain why the term `member` needs context.
6. Identify any logical files/views/index-like access structures relevant to the supplied example.
7. Ask Bob for a second-pass explanation only after your map is complete.

## Evidence

- object/terminology map;
- member-context explanation;
- unresolved questions;
- Bob finding dispositions.

## Completion check

You can explain the observed objects without using “file,” “table,” “member,” or “library” ambiguously.

---

# Lab 2 — Build the Coffee Company Schema

## Goal

Create a relational model with database-enforced integrity.

## Source

`src/sql/01_create_schema.sql` and `src/sql/02_seed_data.sql`

## Tasks

1. Review the DDL before execution.
2. Identify every table, primary key, foreign key, check constraint, unique constraint, default, and nullable column.
3. Confirm the training schema is correct.
4. Execute the DDL in the approved environment.
5. Verify created objects and catalog metadata.
6. Load seed data.
7. Verify baseline row counts.
8. Run isolated invalid-data cases from the validation matrix.
9. Capture the exact database response for rejected invalid states.

## Required reasoning

Explain one constraint that belongs in the database and one business decision that does not belong in the database schema.

## Evidence

- Git revision;
- DDL script;
- object/catalog evidence;
- baseline counts;
- negative-test results.

---

# Lab 3 — Query the Catalog

## Goal

Practice set-oriented reasoning and `NULL`/predicate behavior.

## Source

`src/sql/03_select_practice.sql`

## Tasks

For each assigned query:

1. state the requirement in plain language;
2. predict the result set or row count;
3. run the query;
4. compare expected and actual;
5. explain any difference;
6. save the final query in Git if it differs from the starter.

## Required cases

- active products;
- price range;
- calculated inventory value from stored facts;
- missing optional email;
- date-window query;
- case conversion/`COALESCE`;
- mixed `AND`/`OR` condition with explicit parentheses;
- `DISTINCT` statuses.

## Evidence

Prediction/result worksheet plus final SQL.

---

# Lab 4 — Join and Summarize Orders

## Goal

Reason about keys, cardinality, grouping, and result grain.

## Source

`src/sql/04_joins_aggregates.sql`

## Tasks

1. Draw or describe the relevant key relationships.
2. Predict row counts for order/customer and order-item/product joins.
3. Execute the joins and compare counts.
4. Break one join predicate in a disposable query and predict the multiplication effect before execution.
5. Correct the query.
6. Run aggregate queries.
7. State the grain of each result.
8. Reconcile at least one aggregate to the underlying detail rows.

## Evidence

- relationship map;
- predicted/actual row counts;
- broken-join diagnosis;
- aggregate reconciliation.

---

# Lab 5 — Change Data Safely

## Goal

Prove that a controlled data change can be identified, executed, rolled back, and deliberately committed.

## Source

`src/sql/05_dml_transactions.sql`

## Hard prerequisite

Do not start until the instructor has confirmed the transaction setup. `ROLLBACK` is not a substitute for knowing whether the environment supports the behavior you expect.

## Tasks

1. Verify host/profile/schema/table.
2. Record the journaling/commitment-control/client setting evidence supplied by the instructor.
3. Run the pre-change SELECT.
4. Predict affected rows.
5. Execute the update statement only.
6. Verify changed state.
7. Roll back.
8. Prove restoration.
9. Repeat the controlled update.
10. Verify again.
11. Commit only when the lab instructs it.
12. Prove final state.
13. Follow the instructor reset procedure for the next learner.

## Stop conditions

Stop immediately if:

- affected rows differ from prediction;
- rollback does not restore the baseline;
- the target schema/table is not the assigned one;
- transaction settings are unclear;
- another learner has changed the shared baseline.

## Evidence

Before/change/rollback/final result plus affected-row counts and recovery explanation.

---

# Lab 6 — Create the Data Service Boundary

## Goal

Create the exact data seam Module 3 needs without putting domain logic into SQL.

## Source

`src/sql/06_views_ctes.sql` and `src/rpg/product_data_demo.rpgle`

## Tasks

1. Review `V_PRODUCT_SNAPSHOT`.
2. Explain why each column belongs in the data contract.
3. List at least three business decisions that do not belong in the view.
4. Create the view.
5. Verify all baseline rows and columns.
6. Run the CTE/subquery examples.
7. Review the embedded-SQL RPG example.
8. Compile with the validated SQL RPG workflow.
9. Test existing-product and missing-product paths.
10. Under instructor control, force a technical data-access failure and verify `DATA_ERROR` behavior.
11. Confirm raw SQL diagnostics remain internal to the implementation/support evidence.
12. Complete the Data Service boundary worksheet.

## Evidence

- view definition and result;
- compile command/output;
- program/object evidence;
- result-status tests;
- boundary explanation;
- focused Git diff.

---

# Independent challenge — Category Data Slice

Complete without step-by-step Bob or instructor workflow direction.

## Requirement

Coffee Company wants products grouped by category for reporting and catalog navigation.

## Required outcomes

- relational category entity;
- appropriate key/foreign-key integrity;
- controlled training data;
- tested join/query;
- explicit result grain;
- optional view change only if it creates a useful stable fact interface;
- no order-eligibility, discount, shipping, or approval logic moved into SQL;
- negative and regression tests;
- focused Git diff;
- post-implementation Bob review;
- independent explain-back.

## Completion standard

The work is complete only when another developer can understand the data design, reproduce the result, see the integrity guarantees, and identify exactly what Module 3 may depend on.