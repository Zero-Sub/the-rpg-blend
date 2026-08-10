# Module 2 Lab — Coffee Catalog Database

## Lab Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lab:** 2.10
- **Estimated time:** 120–150 minutes
- **Difficulty:** Assisted → Independent
- **Prerequisites:** Lessons 2.1–2.9 completed
- **Required tools:** Visual Studio Code, Code for IBM i, Db2 for IBM i extension
- **Optional tool:** ACS Run SQL Scripts for troubleshooting or deeper inspection
- **Required access:** PUB400 learner profile with learner-owned private library/schema
- **Expected deliverables:** SQL source, evidence record, answers to reflection questions
- **AI mode:** Bob allowed for review/reference only; complete solution generation prohibited
- **Validation status:** source/static validated; end-to-end learner run pending

## Scenario

The RPG Blend Coffee Company is preparing the product catalog that later RPG programs will use. The development lead wants a small relational design that is easy to explain, difficult to corrupt accidentally, and safe for a new developer to rebuild in an isolated environment.

You have been asked to build the first database increment and prove that it supports product lookup, category relationships, inventory reporting, controlled data changes, and a simple reusable view.

## Objective

Build and validate a small Coffee Catalog database in your assigned learner schema. Demonstrate that you understand the model and can work with it safely before Module 3 connects RPG to the data.

## Starting Point

- Repository branch/tag: instructor-provided Module 2 build
- Workspace path: `academy/curriculum/module-02/`
- Learner schema/library: assigned PUB400 private library
- Starter references: lesson SQL under `code/sql/`
- No production or customer data is required

Before beginning, record:

| Item | Learner evidence |
|---|---|
| Connection nickname | |
| IBM i user profile | |
| Learner schema/library | |
| SSH port/current connection setting | |
| Code for IBM i version | |
| Db2 for IBM i extension version | |
| Date/time | |
| Db2 for IBM i connection verified | |

Do not record credentials or secrets.

## Part A — Verify the Boundary

1. Connect to PUB400 with the approved learner profile and current documented connection settings.
2. Locate the assigned private schema in the Db2 for IBM i extension.
3. Run a read-only catalog or current-context query that supports the schema/connection check.
4. Record one sentence explaining why the schema is safe for the lab.
5. Stop if the schema or ownership is uncertain.

**Evidence:** schema name, read-only query, result/context evidence.

A new learner schema can legitimately contain no Module 2 tables yet. A zero-row `SYSTABLES` result before Part B is not proof that the schema is invalid.

## Part B — Build the Relational Model

Create three tables representing:

### CATEGORY

Required business rules:

- integer category identifier
- category name required
- category name unique in this training model
- active status required, default `Y`, only `Y` or `N`
- primary key on category identifier

### PRODUCT

Required business rules:

- integer product identifier
- every product belongs to an existing category
- SKU required and unique
- product name required
- roast level may be absent for non-coffee items
- price required and cannot be negative
- active status required, default `Y`, only `Y` or `N`
- introduction date required with a reasonable default
- primary key on product identifier

### INVENTORY

Required business rules:

- every inventory row belongs to an existing product
- at most one inventory row may exist for a given product in this training model
- the schema does **not** require every product to have an inventory row
- quantity on hand cannot be negative
- reorder point cannot be negative
- count timestamp required with a reasonable default

The primary-key/foreign-key design on `INVENTORY.PRODUCT_ID` enforces the first two rules. The seed data later creates one inventory row for every product, but that is a property of the seed data, not a mandatory one-to-one rule enforced from PRODUCT to INVENTORY.

You may start from the lesson DDL, but you must explain every constraint before execution.

**Evidence:** CREATE statements plus a metadata query showing all three objects in the learner schema.

## Part C — Load and Prove the Base Data

Load the fictional dataset from `02_seed_catalog.sql` or recreate the same business data yourself.

Expected base counts:

- CATEGORY = 3
- PRODUCT = 5
- INVENTORY = 5

Record expected and actual counts. If they differ, stop and reconcile before continuing.

| Table | Expected | Actual | Evidence |
|---|---:|---:|---|
| CATEGORY | 3 | | |
| PRODUCT | 5 | | |
| INVENTORY | 5 | | |

## Part D — Query the Catalog

Write these queries yourself. Do not copy the final SQL from Bob.

### Query 1 — Active affordable products

Return:

- SKU
- product name
- price

for active products below `16.00`, ordered lowest price first and then SKU.

Before execution, write the expected product names.

### Query 2 — Missing roast level

Return the products whose roast level is absent. Explain why `= NULL` is not the correct predicate.

### Query 3 — Bounded exploration

Return the first three products in product-ID order. Explain what the result limit protects against and what it does not protect against.

**Evidence:** SQL, predicted results, actual results.

## Part E — Join Related Data

### Query 4 — Product and category

Return product name, category name, and price.

Before execution:

- identify the parent key
- identify the foreign key
- predict the row count

### Query 5 — Reorder attention

Return:

- product name
- category name
- quantity on hand
- reorder point

only for products at or below the reorder point.

Before execution, explain:

- why the join predicates represent real relationships rather than merely matching similarly named columns
- what PRODUCT → INVENTORY cardinality the schema enforces
- why the seeded data currently gives one matching INVENTORY row for each PRODUCT

## Part F — Aggregate

### Query 6 — Product count by category

Return one row per category represented in PRODUCT and a product count.

State the result grain before execution.

### Query 7 — Inventory pressure

Return category name and total quantity on hand only for categories with total quantity below `30`.

Explain why the group filter belongs in `HAVING` rather than `WHERE` when it depends on the aggregate result.

## Part G — Prove the Constraints

Create at least three negative tests, including:

- one duplicate-key or duplicate-SKU test
- one invalid foreign-key test
- one invalid CHECK or NOT NULL test

For each test, record:

| Test | Expected result | Actual result | Constraint/rule |
|---|---|---|---|
| | | | |

At least one negative test must be designed without Bob.

Do not remove a constraint to make an invalid statement succeed. A syntax error is not proof that an intended database constraint works.

## Part H — Controlled Data Change

Create a disposable product row with an unused training identifier and SKU.

Then perform this sequence:

1. SELECT to prove the target key/SKU is unused.
2. INSERT exactly one disposable row.
3. SELECT to verify the inserted row.
4. SELECT with the exact future UPDATE predicate and prove it returns one row.
5. UPDATE one business value on the disposable row.
6. SELECT to verify the update.
7. SELECT with the exact future DELETE predicate and prove it returns one row.
8. DELETE the disposable row.
9. SELECT to prove zero rows remain for that key/SKU.

If a preview returns anything other than the expected count, stop and investigate.

## Part I — View and Index Awareness

Create a view that presents active products with category and inventory information. It should expose only the columns needed by a simple catalog consumer.

Create an index on a key that could plausibly support category-based product access.

Then answer:

1. What logic did the view centralize?
2. Where does the underlying data remain stored?
3. Why can you not prove meaningful index performance improvement from this tiny dataset?
4. What evidence would you seek in a real performance investigation?

## Bob Review

After completing your SQL, choose **two** of these for Bob review:

- one DDL definition
- one JOIN
- one grouped query
- the disposable-row UPDATE/DELETE workflow
- the view

For each review, capture:

| Item | Evidence |
|---|---|
| Prompt | |
| Verified fact | |
| Assumption | |
| Suggestion accepted/corrected/rejected | |
| Evidence for decision | |
| Risk Bob missed | |

Bob may not write the remaining unanswered lab queries for you.

## Independent Defense

With Bob closed, explain to the instructor or reviewer:

- the three-table relationship
- the difference between schema-enforced PRODUCT/INVENTORY cardinality and the seeded data
- one integrity rule and what invalid state it prevents
- one join's expected cardinality
- the grain of one aggregate query
- the safe data-change sequence
- the purpose of the view
- the purpose and limitation of the index exercise

## Validation Checklist

- [ ] Correct PUB400 host/profile/schema verified
- [ ] Current connection/tool versions recorded
- [ ] CATEGORY, PRODUCT, INVENTORY created in learner schema
- [ ] Base row counts are 3 / 5 / 5
- [ ] Required SELECTs return predicted rows
- [ ] Join row counts and cardinality are explained
- [ ] Aggregate grain is explained
- [ ] Three negative constraint tests behave as predicted
- [ ] Disposable DML row is previewed, inserted, verified, update-previewed, updated, verified, delete-previewed, deleted, and cleanup-verified
- [ ] View is queryable
- [ ] Index object exists
- [ ] Bob evidence records are complete
- [ ] Independent defense completed
- [ ] No credentials, production data, PHI, or client data used

## Troubleshooting Guide

| Symptom | Check first |
|---|---|
| Object already exists | Confirm whether this is a prior lab run; use the reset process only against your learner objects |
| Table not found | Verify schema qualification and object creation order |
| Foreign-key insert fails | Verify the parent category/product exists |
| Duplicate-key error | Verify whether the key/SKU already exists; do not change the constraint casually |
| Query returns too many rows | Inspect predicates and joins before adding DISTINCT |
| Aggregate is too high | Inspect underlying joined detail rows for multiplication |
| UPDATE/DELETE preview returns unexpected rows | Stop; inspect the key/predicate and data before changing anything |
| Permission failure | Verify learner schema ownership and expected extension setup; do not request broad access as a shortcut |
| Bob and actual behavior disagree | Treat executed evidence and target-release IBM documentation as authoritative; investigate the mismatch |

## Reflection

1. Which database rule was most valuable to enforce centrally, and why?
2. Which SQL statement required the most reasoning before execution?
3. What evidence made you confident your data change was controlled?
4. What would need to change before these scripts were suitable for an enterprise production deployment?

## Cleanup

Use `code/sql/99_reset.sql` only after reviewing the substituted schema and every object name.

The reset must remove only:

- `ACTIVE_PRODUCT_SUMMARY`
- `IX_PRODUCT_CATEGORY`
- `INVENTORY`
- `PRODUCT`
- `CATEGORY`

The reset uses `DROP ... IF EXISTS` so a partial prior run can be cleaned safely without failing merely because an Academy object is already absent. This does not protect against a wrong schema substitution.

After reset, confirm the Module 2 objects no longer exist. Do not drop the learner's library/schema. Then perform the required clean rebuild during technical validation.

## Completion

The lab passes when the learner demonstrates working behavior, provides reproducible evidence, completes cleanup, and explains the solution without dependence on Bob.
