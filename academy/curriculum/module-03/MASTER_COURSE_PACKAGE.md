# Module 3 Master Course Package

## Files + Data Access

**Status:** content-complete development package; target execution validation pending  
**Canonical source branch:** `academy/module-3-files-data-access` family  
**Stacking rule:** Module 3 is developed from the Module 2 branch while Module 2 runtime validation proceeds

## Purpose

Module 3 turns database knowledge into application data access. It covers both native RPG record-level access and embedded SQL because enterprise IBM i developers encounter both and must reason about their operational differences.

## Prerequisites

Modules 0–2. Learner can already use VS Code/Code for IBM i, compile basic RPG, understand data/decisions/loops/basic procedures, navigate Db2 for i, read DDL/keys/constraints/SELECT/joins, use safe DML habits, and work with Git/Bob under Academy rules.

## Canonical Lessons

1. `lessons/03-01-rpg-meets-db2.md`
2. `lessons/03-02-externally-described-files-dcl-f.md`
3. `lessons/03-03-keyed-native-reads.md`
4. `lessons/03-04-native-data-changes-locks.md`
5. `lessons/03-05-embedded-sql-single-row.md`
6. `lessons/03-06-embedded-sql-cursors.md`
7. `lessons/03-07-sql-diagnostics-errors.md`
8. `lessons/03-08-transactions-commitment-control.md`
9. `lessons/03-09-native-vs-sql.md`
10. `lessons/03-10-module-lab.md`

## SQL Assets

- `code/sql/10_create_order_access.sql`
- `code/sql/11_seed_orders.sql`
- `code/sql/19_reset_module3.sql`

## Native RPG Assets

- `code/rpg/03_native_header_lookup.pgm.rpgle`
- `code/rpg/03_native_line_scan.pgm.rpgle`
- `code/rpg/04_native_order_change.pgm.rpgle`

## Embedded SQL RPG Assets

- `code/rpg/05_sql_product_lookup.pgm.sqlrpgle`
- `code/rpg/06_sql_low_inventory.pgm.sqlrpgle`
- `code/rpg/07_sql_diagnostics.pgm.sqlrpgle`
- `code/rpg/08_transaction_order.pgm.sqlrpgle`

All executable assets remain **reviewed rather than runtime-validated** until target IBM i evidence exists.

## Supporting Assets

- `environment/PUB400_SETUP.md`
- `environment/TRANSACTION_PREFLIGHT.md`
- `environment/actions-module3.example.json`
- `code/bob/module3_prompts.md`
- `code/README.md`
- `workbook/student-workbook.md`
- `lab/module-03-lab.md`
- `lab/instructor-solution.md`
- `assessment/module-03-assessment.md`
- `assessment/module-03-answer-key.md`
- `instructor-notes/instructor-guide.md`
- `sources/source-register.md`
- `presentations/module-03-slide-source.md`
- `TECHNICAL_VALIDATION_BACKLOG.md`

## Object Bridge

| SQL name | IBM i system name | Record format | Native purpose |
|---|---|---|---|
| ORDER_HEADER | ORDHDR | OHDRR | header keyed lookup/change |
| ORDER_LINES | ORDLINE | OLINER | partial-key order-line scan |

Long descriptive SQL column names receive explicit system column names in the DDL where needed. Runtime validation must verify the external descriptions actually presented to RPG.

## Teaching Architecture

```text
Module 2 relational model
         |
         +-----------------------+
         |                       |
         v                       v
Native RPG I/O              Embedded SQL RPG
DCL-F / keys                host variables
CHAIN / READE               SELECT INTO
WRITE / UPDATE              cursor / FETCH
DELETE / locks              SQLSTATE / diagnostics
         |                       |
         +-----------+-----------+
                     v
          transaction + error judgment
                     |
                     v
            Module 3 capstone
```

## Module Boundary

Module 3 teaches data access, not deep ILE modularity. Module 4 owns prototypes, procedure-interface depth, modules, service programs, exports, binding, activation groups, and reusable service architecture.

## Publication Rule

Canonical Markdown/source is the technical authority. Generate branded coursebook, instructor guide, workbook, slides, video/LMS adaptations, and download packages only after runtime validation. Corrections flow into canonical source first.