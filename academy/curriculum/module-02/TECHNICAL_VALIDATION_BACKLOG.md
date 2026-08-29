# Module 2 Technical Validation Backlog

## Db2 for i + SQL

**Status:** source/static validation complete; target execution validation required before release  
**Target execution environment:** PUB400 IBM i 7.5 learner-owned private library/schema  
**Canonical source branch:** `academy/module-2-db2-sql`  
**Static/source recheck:** 2026-08-10

This backlog separates **content built**, **source/static validation**, and **behavior validated**. Runtime items remain open until there is direct evidence from the documented IBM i environment.

## Static and Source Validation Pass — 2026-08-10

- [x] Canonical roadmap confirmed: Module 2 is Db2 for i + SQL.
- [x] Module lesson sequence checked against the approved roadmap and source coverage.
- [x] Uploaded iBegin and COMMON SQL Bootcamp material rechecked as supplemental references, not copied course structure/content.
- [x] Executable syntax and concepts cross-checked against IBM i 7.5 primary documentation, the target PUB400 release.
- [x] IBM i 7.6 documentation retained only as a forward/current cross-check; 7.6-only behavior is not assumed on PUB400.
- [x] Current Code for IBM i / Db2 for IBM i documentation rechecked for SQL execution, Schema Browser, SQL job, and per-user server component.
- [x] Current PUB400 service documentation rechecked for IBM i 7.5, two private libraries, and SSH port 2222.
- [x] Native `member` ↔ SQL `partition` explanation corrected to avoid universal one-to-one equivalence; specific multimember-file access through SQL aliases documented.
- [x] PRODUCT → INVENTORY cardinality corrected: schema enforces zero-or-one INVENTORY row per PRODUCT; seed data supplies one for each.
- [x] Assessment corrected so DELETE requires the same preview-before-change discipline as UPDATE.
- [x] Reset script changed to IBM i 7.5 `DROP ... IF EXISTS` for repeatable partial/full cleanup.
- [x] Workbook, capstone lab, answer key, and slide source reconciled with those corrections.
- [x] Expected results mathematically reconciled from the deterministic seed dataset.

### Static expected-result reconciliation

From the committed seed data, the expected outcomes are internally consistent:

- CATEGORY / PRODUCT / INVENTORY counts: `3 / 5 / 5`
- active products below 16.00: Logo Mug 12.00, Morning Blend 14.95, House Decaf 15.95
- `PRICE >= 15.00`: Pour Over Starter Kit 24.95, Midnight Roast 16.95, House Decaf 15.95
- missing roast level: Pour Over Starter Kit and RPG Blend Logo Mug
- first three by PRODUCT_ID: `1001, 1002, 1003`
- base product/category join: 5 rows
- base product/inventory join: 5 rows because the seed data contains one matching inventory row per product
- reorder attention: House Decaf and Pour Over Starter Kit
- product counts: Coffee 3, Equipment 1, Merchandise 1
- `HAVING count(*) >= 2`: Coffee only
- quantity totals: Coffee 67, Equipment 5, Merchandise 26
- totals below 30: Equipment 5 and Merchandise 26
- price min/max/average from the five seed products: 12.00 / 24.95 / 16.96 when average is expressed at two decimals

These values are **static reconciliation**, not IBM i execution evidence. They must still be reproduced on PUB400.

## Gate 1 — Environment

- [ ] Confirm current PUB400 IBM i release during validation run.
- [ ] Confirm current PUB400 SSH port during validation run; static check on 2026-08-10 found port 2222.
- [ ] Record learner profile and private library naming/authority behavior without recording credentials.
- [ ] Confirm Code for IBM i connection workflow.
- [ ] Confirm Code for IBM i and Db2 for IBM i extension versions.
- [ ] Confirm expected Db2 for IBM i per-user server-component install/update behavior.
- [ ] Confirm learner can create tables, view, and index in the private library.
- [ ] Confirm course completion does not require authority outside the private library.

**Evidence required:** environment record and screenshots/notes with secrets removed.

## Gate 2 — DDL

Run `01_create_catalog.sql` from a clean schema.

- [ ] CATEGORY created.
- [ ] PRODUCT created.
- [ ] INVENTORY created.
- [ ] Primary keys exist.
- [ ] Unique constraints exist.
- [ ] Foreign keys exist and point to intended parent keys.
- [ ] CHECK constraints exist.
- [ ] Defaults behave as described.
- [ ] `ROAST_LEVEL` permits NULL.
- [ ] Metadata verification query returns expected objects after creation.
- [ ] Verify PRODUCT can exist without INVENTORY, confirming the documented 0..1 relationship.
- [ ] Verify a second INVENTORY row for the same PRODUCT is rejected by the INVENTORY primary key.

**Evidence required:** SQL outcomes plus catalog metadata.

## Gate 3 — Seed Data

Run `02_seed_catalog.sql`.

- [ ] CATEGORY count = 3.
- [ ] PRODUCT count = 5.
- [ ] INVENTORY count = 5.
- [ ] All intended product values match source.
- [ ] Foreign keys allow valid rows.
- [ ] Defaults/timestamps behave acceptably in the target environment.

**Evidence required:** count results and representative row query.

## Gate 4 — SELECT Exercises

Run `03_select_practice.sql`.

- [ ] Explicit-column query returns 5 rows.
- [ ] `PRICE >= 15.00` returns Pour Over Starter Kit, Midnight Roast, and House Decaf in the requested order.
- [ ] Sample-tax expression executes with expected decimal behavior.
- [ ] `ROAST_LEVEL is null` returns the two non-coffee products.
- [ ] `FETCH FIRST 3 ROWS ONLY` returns IDs 1001, 1002, 1003 with ordered query.
- [ ] Independent-task result = Logo Mug, Morning Blend, House Decaf ordered by price/SKU.

**Evidence required:** saved result rows/counts.

## Gate 5 — Joins

Run `04_join_practice.sql`.

- [ ] product/category join = 5 rows.
- [ ] product/inventory join = 5 rows with base seed data.
- [ ] three-table join = 5 rows with base seed data.
- [ ] reorder task returns House Decaf and Pour Over Starter Kit.
- [ ] no unintended row multiplication.
- [ ] reviewer explains why the seed result is 5 without claiming the schema mandates an INVENTORY row for every PRODUCT.

**Evidence required:** row counts, query results, and cardinality explanation.

## Gate 6 — Aggregation

Run `05_aggregation_practice.sql`.

- [ ] PRODUCT count = 5.
- [ ] lowest price = 12.00.
- [ ] highest price = 24.95.
- [ ] two-decimal average = 16.96.
- [ ] product-count-by-category = Coffee 3, Equipment 1, Merchandise 1.
- [ ] HAVING example returns only Coffee for count >= 2.
- [ ] inventory totals = Coffee 67, Equipment 5, Merchandise 26.
- [ ] independent below-30 result = Equipment 5, Merchandise 26.

**Evidence required:** actual aggregate outputs.

## Gate 7 — Constraint Negative Tests

Using lesson/lab test statements:

- [ ] duplicate CATEGORY primary key rejected.
- [ ] duplicate SKU rejected.
- [ ] invalid product CATEGORY_ID rejected by foreign key.
- [ ] invalid ACTIVE value rejected by CHECK.
- [ ] negative PRICE rejected by CHECK.
- [ ] required-column NULL omission/rejection behaves as documented.
- [ ] nullable ROAST_LEVEL test succeeds when otherwise valid.

Record the actual SQLSTATE/message for each failure; do not hard-code unverified message IDs into learner material.

**Evidence required:** statement, intended constraint, SQLSTATE/message, cleanup result.

## Gate 8 — Controlled DML

Run `06_safe_data_changes.sql` one statement at a time.

- [ ] initial disposable key/SKU query = 0.
- [ ] INSERT creates exactly one row.
- [ ] verification values match.
- [ ] UPDATE preview = 1.
- [ ] UPDATE changes only intended disposable row.
- [ ] post-update verification matches.
- [ ] DELETE preview = 1.
- [ ] DELETE removes only intended disposable row.
- [ ] final verification = 0.
- [ ] base PRODUCT count returns to 5.

**Evidence required:** preview/change/verification record.

## Gate 9 — View and Index

Run `07_views_and_indexes.sql`.

- [ ] ACTIVE_PRODUCT_SUMMARY created.
- [ ] view query returns 5 active base products with the seed data.
- [ ] category/product/inventory values match base tables.
- [ ] IX_PRODUCT_CATEGORY created.
- [ ] object metadata confirms view/index.
- [ ] learner material makes no unverified optimizer/performance claim.

**Evidence required:** metadata + result set.

## Gate 10 — Reset and Rebuild

- [ ] `99_reset.sql` succeeds when all Module 2 objects exist.
- [ ] `99_reset.sql` succeeds when one or more Module 2 objects are already absent, using `IF EXISTS`.
- [ ] no Module 2 view/index/tables remain.
- [ ] learner library itself remains intact.
- [ ] full setup can be run again successfully after reset.
- [ ] second-run results match first run.

**Evidence required:** before/after metadata and second-run checks.

## Gate 11 — Tooling Workflow

- [ ] Learner can execute individual SQL statements from a `.sql` file in VS Code.
- [ ] Result presentation matches instructions.
- [ ] Schema Browser can locate learner objects.
- [ ] SQL job starts/functions as current extension documentation describes.
- [ ] Server-component installation/update prompt is accurately represented if it appears.
- [ ] ACS supplementary workflow is accurately described.
- [ ] No course step relies on a UI label copied from an obsolete screenshot.

## Gate 12 — Source Review

- [x] IBM i 7.5 target documentation rechecked during static validation on 2026-08-10.
- [x] IBM i 7.6 treated as forward/current cross-check rather than target authority.
- [x] COMMON references remain supplemental only.
- [x] No protected diagrams or exercises intentionally copied into the Academy module.
- [x] Examples remain original Academy work.
- [x] Release-sensitive statements marked for review cadence.
- [ ] Recheck target documentation and current tooling immediately before release freeze.

## Gate 13 — Independent Technical Reviewer

A reviewer other than the author must:

- [ ] follow `environment/PUB400_SETUP.md` from scratch
- [ ] execute all scripts
- [ ] reconcile every documented result
- [ ] verify schema-enforced vs observed PRODUCT/INVENTORY cardinality
- [ ] run at least the core capstone queries
- [ ] run full and partial reset/rebuild
- [ ] record defects/ambiguities
- [ ] sign off or return issues

Reviewer: ____________________  
Date: ____________________

## Gate 14 — Learner Pilot

- [ ] learner completes setup without hidden steps
- [ ] learner completes lessons/lab in expected time range
- [ ] learner can explain terms without parroting Bob
- [ ] learner demonstrates preview-before-DML behavior for UPDATE and DELETE
- [ ] learner distinguishes DDL-enforced cardinality from seed-data coincidence
- [ ] learner identifies at least one Bob assumption/limitation
- [ ] assessment wording is unambiguous
- [ ] instructor defense distinguishes memorization from understanding

## Known Decisions to Preserve

- Module 2 is **Db2 for i + SQL**, not procedures/data structures.
- Module 3 owns RPG/native I/O, embedded SQL, transactions, locking, commitment control, and application error handling.
- Module 4 owns procedures + ILE depth.
- VS Code is the primary learner workflow; ACS is supporting tooling.
- PUB400 learner private libraries are the public-course default training boundary unless replaced by a documented equivalent.
- Bob assists but does not complete independent work or override evidence.
- Static/source validation must never be labeled as successful IBM i execution.

## Release Blockers

Any of these block release:

- SQL script fails in target environment for an undocumented reason.
- Expected row counts differ from actual results.
- Reset/rebuild is not repeatable.
- Learner instructions require broader authority than documented.
- Current extension workflow differs materially from learner instructions.
- Source conflict remains unresolved.
- Assessment expects behavior not taught.
- Pilot learner cannot complete work without hidden instructor knowledge.

## Completion Record

Technical reviewer: ____________________  
Instructional reviewer: ____________________  
Source reviewer: ____________________  
Release approver: ____________________  
Validation date: ____________________  
Validated commit/tag: ____________________
