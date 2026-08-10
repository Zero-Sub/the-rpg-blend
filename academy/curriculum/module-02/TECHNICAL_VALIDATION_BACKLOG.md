# Module 2 Technical Validation Backlog

## Db2 for i + SQL

**Status:** required before release  
**Target execution environment:** PUB400 IBM i 7.5 learner-owned private library/schema  
**Canonical source branch:** `academy/module-2-db2-sql`

This backlog separates **content built** from **behavior validated**. Items remain open until there is direct evidence from the documented environment.

## Gate 1 — Environment

- [ ] Confirm current PUB400 IBM i release during validation run.
- [ ] Record learner profile and private library naming/authority behavior without recording credentials.
- [ ] Confirm Code for IBM i connection workflow.
- [ ] Confirm Db2 for IBM i extension version and exact command/view labels used by learner instructions.
- [ ] Confirm learner can create tables, view, and index in the private library.
- [ ] Confirm learner cannot accidentally require authority outside the private library for course work.

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
- [ ] Metadata verification query returns expected objects.

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
- [ ] `PRICE >= 15.00` result matches documented expectation.
- [ ] sample-tax expression executes with expected decimal behavior.
- [ ] `ROAST_LEVEL is null` returns the two non-coffee products.
- [ ] `FETCH FIRST 3 ROWS ONLY` returns IDs 1001, 1002, 1003 with ordered query.
- [ ] Independent-task expected result documented after run.

**Evidence required:** saved result rows/counts.

## Gate 5 — Joins

Run `04_join_practice.sql`.

- [ ] product/category join = 5 rows.
- [ ] product/inventory join = 5 rows.
- [ ] three-table join = 5 rows.
- [ ] reorder task returns House Decaf and Pour Over Starter Kit.
- [ ] no unintended row multiplication.

**Evidence required:** row counts and query results.

## Gate 6 — Aggregation

Run `05_aggregation_practice.sql`.

- [ ] PRODUCT count = 5.
- [ ] lowest/highest/average price confirmed.
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

- [ ] initial disposable key query = 0.
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
- [ ] view query returns 5 active base products.
- [ ] category/product/inventory values match base tables.
- [ ] IX_PRODUCT_CATEGORY created.
- [ ] object metadata confirms view/index.
- [ ] learner material makes no unverified optimizer/performance claim.

**Evidence required:** metadata + result set.

## Gate 10 — Reset and Rebuild

- [ ] `99_reset.sql` succeeds when all Module 2 objects exist.
- [ ] no Module 2 view/index/tables remain.
- [ ] learner library itself remains intact.
- [ ] full setup can be run again successfully after reset.
- [ ] second-run results match first run.

**Evidence required:** before/after metadata and second-run checks.

## Gate 11 — Tooling Workflow

- [ ] Learner can execute individual SQL statements from a `.sql` file in VS Code.
- [ ] Result presentation matches instructions.
- [ ] Schema browser can locate learner objects.
- [ ] Query history/other referenced extension features still exist if included in publication assets.
- [ ] ACS supplementary workflow is accurately described.
- [ ] No course step relies on a UI label copied from an obsolete screenshot.

## Gate 12 — Source Review

- [ ] Current IBM documentation links/topics rechecked immediately before release.
- [ ] COMMON references remain supplemental only.
- [ ] No protected diagrams or exercises copied.
- [ ] All examples remain original Academy work.
- [ ] Release-sensitive statements marked for review cadence.

## Gate 13 — Independent Technical Reviewer

A reviewer other than the author must:

- [ ] follow `environment/PUB400_SETUP.md` from scratch
- [ ] execute all scripts
- [ ] reconcile every documented result
- [ ] run at least the core capstone queries
- [ ] run reset/rebuild
- [ ] record defects/ambiguities
- [ ] sign off or return issues

Reviewer: ____________________  
Date: ____________________

## Gate 14 — Learner Pilot

- [ ] learner completes setup without hidden steps
- [ ] learner completes lessons/lab in expected time range
- [ ] learner can explain terms without parroting Bob
- [ ] learner demonstrates preview-before-DML behavior
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

## Release Blockers

Any of these block release:

- SQL script fails in target environment for an undocumented reason.
- Expected row counts differ from actual results.
- reset/rebuild is not repeatable.
- learner instructions require broader authority than documented.
- current extension workflow differs materially from learner instructions.
- source conflict remains unresolved.
- assessment expects behavior not taught.
- pilot learner cannot complete work without hidden instructor knowledge.

## Completion Record

Technical reviewer: ____________________  
Instructional reviewer: ____________________  
Source reviewer: ____________________  
Release approver: ____________________  
Validation date: ____________________  
Validated commit/tag: ____________________
