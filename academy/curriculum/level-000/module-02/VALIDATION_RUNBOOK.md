# Module 2 Validation Runbook

## Purpose

This runbook separates static curriculum review from empirical IBM i validation. A clean Markdown review does not prove SQL execution, transaction behavior, or embedded-SQL compilation.

## Validation environment record

Before testing, record:

- IBM i host and release/PTF level;
- learner/test profile;
- training schema/library;
- VS Code version;
- Code for IBM i version;
- Db2 for IBM i extension version;
- ACS version if used;
- Git branch/commit;
- journaling and commitment-control setup used for the DML lab;
- IBM Bob mode/version used for AI activities.

## Gate 1 — Static source review

Verify:

- no reference-source exercises or wording were copied into Academy artifacts;
- Coffee Company schema/query examples are original;
- all DDL/DML is scoped to the training schema;
- comments do not instruct learners to use production data;
- no credential, token, client, PHI, or environment-specific secret is present;
- Module 2 content matches the canonical Module 2 → Module 3 handoff.

## Gate 2 — Schema creation

Run `01_create_schema.sql` in an approved disposable training schema.

Prove:

- schema and all expected tables are created;
- primary keys exist;
- foreign keys exist;
- check constraints exist;
- column data types/nullability/defaults match the course text;
- generated/identity behavior, where used, matches expectations;
- object names are the intended names on IBM i.

Record any release-specific syntax corrections instead of silently changing the lesson.

## Gate 3 — Seed data and integrity

Run `02_seed_data.sql`.

Verify expected row counts for each table.

Then run documented negative tests:

- invalid product active flag;
- negative price or quantity;
- order for an unknown customer;
- order item for an unknown product;
- duplicate primary key;
- other documented constraint cases.

Expected result: each invalid state is rejected by the database layer for the reason documented in the course.

## Gate 4 — SELECT behavior

Run `03_select_practice.sql` statement by statement.

For every statement used in the student material:

- record expected row count/result;
- record actual row count/result;
- verify `NULL` examples behave as documented;
- verify date/time expressions on the designated release;
- verify predicates and Boolean grouping produce the intended set.

## Gate 5 — Join and aggregate behavior

Run `04_joins_aggregates.sql`.

Verify:

- relationship cardinality matches the relational model;
- no accidental Cartesian products occur in supported examples;
- left-join unmatched-row example works;
- aggregate queries reconcile to detail rows;
- `WHERE`/`HAVING` examples produce the documented result grain.

## Gate 6 — Transaction lab

Do not start this gate until journaling and commitment-control behavior are known.

Run `05_dml_transactions.sql` statement by statement.

Prove:

1. pre-change SELECT identifies exactly the expected row;
2. UPDATE affects exactly the predicted rows;
3. changed value is visible in the intended transaction context;
4. `ROLLBACK` restores the original value;
5. second controlled UPDATE affects the same expected rows;
6. `COMMIT` persists only the intended change;
7. recovery/reset instructions restore the lab baseline for the next learner.

If rollback does not behave as documented, stop and diagnose client settings, journaling, isolation/commitment configuration, or unsupported assumptions. Do not rewrite the lesson to pretend rollback succeeded.

## Gate 7 — Views and CTEs

Run `06_views_ctes.sql`.

Verify:

- `V_PRODUCT_SNAPSHOT` exists;
- its columns match the documented Data Service contract;
- inactive products remain facts in the view rather than being silently converted into order-eligibility decisions;
- CTE and subquery examples return the documented result sets;
- any IBM i Service examples used in instruction are authorized and release-valid.

## Gate 8 — Embedded-SQL RPG demonstration

Validate `src/rpg/product_data_demo.rpgle` with the approved SQL RPG compile workflow.

Record the exact Code for IBM i Action / `CRTSQLRPGI` command used.

Prove:

- SQL precompile succeeds;
- RPG compile/bind succeeds;
- existing product returns `FOUND` and expected facts;
- missing product returns `NOT_FOUND` without exposing raw SQL diagnostics to the caller;
- forced database error returns a stable data-access failure status while technical diagnostics remain available to the implementation/support path;
- target program/object and source revision are the intended ones.

## Gate 9 — Tooling workflow

Validate current learner workflow in:

- Code for IBM i;
- Db2 for IBM i extension;
- ACS only where the module explicitly uses ACS.

Recheck labels, menus, connection behavior, result presentation, content assist, and execution behavior before publication. Screenshots from reference training are not publication authority.

## Gate 10 — IBM Bob activities

For each Bob activity:

- use only sanitized Academy source/data;
- verify Bob can perform the intended analysis in the approved mode;
- record misleading or incomplete suggestions;
- ensure the learner activity still requires independent verification;
- confirm the independent challenge is completable without Bob.

## Gate 11 — Module 2 → Module 3 handoff

A reviewer who knows Module 3 must confirm that Module 2 leaves the learner able to explain:

- persistence shape versus application contract;
- keys and relationship cardinality;
- the `V_PRODUCT_SNAPSHOT` data contract;
- why SQLCODE/SQLSTATE remain inside Data Services;
- why order eligibility/discount/approval do not belong in the snapshot view;
- basic transaction ownership considerations.

## Release decision

Promote to Release Candidate only when:

- all required gates have evidence;
- Critical/High defects are closed;
- the independent technical review passes;
- learner pilot findings are dispositioned;
- source/manual register and Curriculum Coverage Matrix are current;
- package status files match the evidence.