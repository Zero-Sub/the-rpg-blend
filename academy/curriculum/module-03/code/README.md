# Module 3 Code Assets

**Validation status:** author/source reviewed; IBM i compile/run pending

## SQL order

1. `sql/10_create_order_access.sql`
2. `sql/11_seed_orders.sql`
3. RPG/SQLRPGLE lessons
4. `sql/19_reset_module3.sql` only for intentional Module 3 cleanup

## Native RPG

- `rpg/03_native_header_lookup.pgm.rpgle` — direct CHAIN / %FOUND
- `rpg/03_native_line_scan.pgm.rpgle` — partial-key SETLL / READE / %EOF
- `rpg/04_native_order_change.pgm.rpgle` — disposable WRITE / UPDATE / DELETE cycle

## Embedded SQL RPG

- `rpg/05_sql_product_lookup.pgm.sqlrpgle` — SELECT INTO
- `rpg/06_sql_low_inventory.pgm.sqlrpgle` — cursor / FETCH
- `rpg/07_sql_diagnostics.pgm.sqlrpgle` — controlled error + GET DIAGNOSTICS
- `rpg/08_transaction_order.pgm.sqlrpgle` — COMMIT / ROLLBACK; requires transaction preflight

## Placeholder Rule

Files containing `YOURSCHEMA` are development templates. Replace the placeholder only in the learner's controlled working copy with the assigned library/schema. Never mass-replace it with an employer or shared production schema.

## Compile Rule

Use the validated Code for IBM i local Action/workspace flow. `environment/actions-module3.example.json` is a reference to merge carefully, not a replacement for an established workspace configuration.

## Evidence

For every program capture:

- source path and Git commit/branch
- host/profile
- compile/build library
- external file/schema target
- compile action and diagnostics
- created program object
- expected runtime result
- actual runtime result
- cleanup state

A clean compile is necessary evidence, not sufficient evidence.