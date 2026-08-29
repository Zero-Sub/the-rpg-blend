# Module 2 Source Validation Register

**Module:** 2 — Db2 for i + SQL  
**Status:** source/static validation complete; target execution validation still required  
**Review date:** 2026-08-10

This register records the sources used to validate Module 2 coverage and technical terminology. The Academy explanations, examples, diagrams, labs, SQL, assessments, and teaching sequence are original.

## Authority order

1. IBM Documentation for the **target execution release, IBM i 7.5**, governs executable Module 2 SQL and target-platform behavior.
2. Current IBM i 7.6 documentation is used as a forward/current cross-check, but a 7.6-only feature must not silently enter the PUB400 7.5 course path.
3. Current primary project documentation governs Code for IBM i / Db2 for IBM i tooling behavior.
4. Current PUB400 service documentation governs PUB400-specific connection and learner-environment assumptions.
5. COMMON iBegin and SQL Bootcamp material validates coverage and terminology.
6. Academy operational guidance defines safety, sequencing, learner evidence, and production discipline.

## Current authoritative sources

| ID | Source | Owner | Scope used | Release sensitivity | Status |
|---|---|---|---|---|---|
| M2-IBM-01 | IBM i 7.5 SQL — schemas and database object naming | IBM | Schema/library relationship and database namespace | Medium | Reviewed 2026-08-10 |
| M2-IBM-02 | IBM i 7.5 SQL — CREATE TABLE and table design | IBM | Tables, columns, data types, defaults, primary keys | Medium | Reviewed 2026-08-10 |
| M2-IBM-03 | IBM i 7.5 SQL — constraints and referential integrity | IBM | Primary, unique, parent, foreign, and CHECK constraints | Low/medium | Reviewed 2026-08-10 |
| M2-IBM-04 | IBM i 7.5 SQL — SELECT / INSERT / UPDATE / DELETE | IBM | Query and DML semantics used by Module 2 | Medium | Reviewed 2026-08-10 |
| M2-IBM-05 | IBM i 7.5 SQL — views and indexes | IBM | View definitions, indexes, and limits of performance claims | Medium | Reviewed 2026-08-10 |
| M2-IBM-06 | IBM i 7.5 SQL catalog views | IBM | Metadata and object discovery | Medium | Reviewed 2026-08-10 |
| M2-IBM-07 | IBM i 7.5 SQL — aliases, members, and table partitions | IBM | Nuance for member/partition terminology | Medium | Reviewed 2026-08-10 |
| M2-IBM-08 | IBM i 7.5 SQL — DROP and `IF EXISTS` | IBM | Repeatable reset behavior | Medium | Reviewed 2026-08-10 |
| M2-IBM-09 | IBM i 7.6 SQL documentation | IBM | Forward/current cross-check only | High for 7.5 delivery | Cross-checked 2026-08-10 |
| M2-TOOL-01 | Db2 for IBM i VS Code extension documentation | Code for IBM i project | SQL execution, Schema Browser, SQL job, per-user server component | High | Reviewed 2026-08-10 |
| M2-TOOL-02 | Code for IBM i documentation | Code for IBM i project | SSH-based connection workflow and connection settings | High | Reviewed 2026-08-10 |
| M2-ENV-01 | PUB400 official site and help | PUB400 | IBM i 7.5, two private libraries, current SSH port 2222 | High | Reviewed 2026-08-10 |

## Supplemental uploaded sources

| ID | Source | Presenter / provider | Coverage supported | Academy use |
|---|---|---|---|---|
| M2-SUP-01 | iBegin — Db2 for i | Scott Forstie / COMMON | Db2 for i integration, Db2 family, native/SQL terminology, data model, DDL/DML categories | Validate terminology and scope only |
| M2-SUP-02 | iBegin — Db2 for i Tooling | Scott Forstie / COMMON | ACS, VS Code Db2 for IBM i extension, database tooling | Validate tool categories; current behavior rechecked independently |
| M2-SUP-03 | COMMON SQL Bootcamp — The Power of SQL | Scott Forstie / COMMON | SQL/database mental model, tables, views, indexes | Coverage inspiration only |
| M2-SUP-04 | COMMON SQL Bootcamp — SQL DDL: Create Table — Basic | Sue Romano / COMMON | DDL, SQL/native names, data types, NULL, CREATE TABLE | Coverage and terminology; examples rewritten |
| M2-SUP-05 | COMMON SQL Bootcamp — SELECT Statement Basics | Vern Hamberg / COMMON | SELECT grammar, WHERE, expressions, ORDER BY | Coverage and progression; examples rewritten |
| M2-SUP-06 | COMMON SQL Bootcamp — Scalar Functions and Date Calculation | Birgitta Hauser / COMMON | Scalar expressions, date/time calculations | Selective enrichment; not a standalone Module 2 lesson |
| M2-SUP-07 | COMMON SQL Bootcamp — Data Manipulation | Sven Jansson / COMMON | INSERT, UPDATE, DELETE | Coverage validation; Academy safety workflow is original |
| M2-SUP-08 | COMMON SQL Bootcamp — Group By and Having | Mike Zaringhalam / COMMON | Aggregate functions, GROUP BY, HAVING | Coverage validation; examples rewritten |
| M2-SUP-09 | COMMON SQL Bootcamp — Joining Tables | Ryan Moeller / COMMON | Join concepts and join conditions | Coverage validation; examples rewritten |
| M2-SUP-10 | COMMON SQL Bootcamp — Next Steps | Scott Forstie and Sue Romano / COMMON | Advanced SQL awareness | Used only to define what Module 2 intentionally defers |
| M2-ACADEMY-01 | RPGBA-101 Code for IBM i Quick Start Handbook v1.1 | The RPG Blend Academy | Safe connection context, VS Code workflow, evidence gates | Academy operational standard |

## Validation findings incorporated on 2026-08-10

The source/static recheck produced several deliberate corrections:

- `DROP ... IF EXISTS` is supported by IBM i 7.5 and is now used by the Module 2 reset script for repeatable partial/full resets.
- The native `member` ↔ SQL `partition` mapping remains useful, and the uploaded iBegin material explicitly teaches it. Current IBM documentation adds an important boundary: an SQL table is represented through the traditional interface as a physical file/member, a partitioned SQL table becomes a multimember file, and SQL can address an arbitrary native database-file member through an alias. The Academy now teaches the mapping as contextual rather than universal identity.
- PRODUCT → INVENTORY cardinality was tightened. The DDL enforces **at most one** INVENTORY row per PRODUCT because `INVENTORY.PRODUCT_ID` is its primary key and foreign key. It does not enforce that every PRODUCT must have an INVENTORY row. The seed data intentionally supplies one inventory row for every product.
- The practical assessment now requires a DELETE target preview explicitly, matching the module's preview-before-change safety rule.
- PUB400's current service documentation identifies IBM i 7.5, two private libraries, and SSH port 2222. Those values are treated as delivery-sensitive and must be rechecked before release.
- Current Db2 for IBM i extension documentation confirms a Schema Browser and a per-user server component managed by the extension on connection. The learner setup now accounts for that expected prompt without recommending broader authority.

## Claims still requiring execution validation

The following are source-supported or statically reviewed but still require hands-on validation before Module 2 is released:

- The exact Db2 for IBM i extension labels and commands used in screenshots and demonstrations on the delivery version.
- PUB400 authority behavior for the selected learner library and the ability to create every course object.
- Every SQL script in `code/sql/` on the actual PUB400 IBM i 7.5 environment.
- Actual SQLSTATE/messages for negative constraint tests.
- Expected row counts and outputs in the learner workbook and instructor guide against Db2 for i execution.
- Cleanup/reset behavior after a complete and a partial learner run.
- A second complete rebuild after reset.

## Version notes

PUB400 currently advertises IBM i 7.5. Module 2 executable SQL therefore uses conservative syntax checked against IBM i 7.5 documentation. IBM i 7.6 documentation remains valuable for forward/current review, but publication must not assume that a 7.6-only capability exists on the 7.5 training host.

The Db2 for IBM i VS Code extension changes independently of IBM i. UI labels, commands, connection behavior, SQL-job behavior, and server-component behavior must be rechecked before each Academy delivery.

PUB400 service settings can also change. Connection port, release level, storage limits, and library policy are environment facts, not permanent Academy guarantees.

## Copyright and reuse

COMMON and IBM training decks are reference sources. Do not copy their slides, diagrams, exercises, course structures, or substantial wording. The Academy may preserve accurate IBM i terminology and source-supported facts while creating original teaching material.
