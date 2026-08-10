# Module 2 Source Validation Register

**Module:** 2 — Db2 for i + SQL  
**Status:** Source reviewed; execution validation still required  
**Review date:** 2026-08-10

This register records the sources used to validate Module 2 coverage and technical terminology. The Academy explanations, examples, diagrams, labs, SQL, assessments, and teaching sequence are original.

## Authority order

1. Current IBM Documentation for IBM i 7.6 for SQL language and database behavior.
2. Current primary project documentation for Code for IBM i / Db2 for IBM i tooling.
3. COMMON iBegin and SQL Bootcamp material for coverage validation and terminology.
4. Academy operational guidance for safety, sequencing, learner evidence, and production discipline.

## Current authoritative sources

| ID | Source | Owner | Scope used | Release sensitivity | Status |
|---|---|---|---|---|---|
| M2-IBM-01 | IBM i 7.6 SQL — Creating a schema / CREATE SCHEMA | IBM | Schema/library relationship and schema creation | Medium | Reviewed 2026-08-10 |
| M2-IBM-02 | IBM i 7.6 SQL — Creating a table / CREATE TABLE | IBM | Tables, rows, columns, data types, primary keys | Medium | Reviewed 2026-08-10 |
| M2-IBM-03 | IBM i 7.6 SQL — Referential integrity and tables | IBM | Primary, unique, parent, and foreign keys | Low/medium | Reviewed 2026-08-10 |
| M2-IBM-04 | IBM i 7.6 SQL — INSERT | IBM | Insert forms, defaults, nullability, uniqueness | Medium | Reviewed 2026-08-10 |
| M2-IBM-05 | IBM i 7.6 SQL — Views | IBM | View definition and relationship to base tables | Low | Reviewed 2026-08-10 |
| M2-IBM-06 | IBM i 7.6 catalog documentation | IBM | Catalog metadata and object discovery | Medium | Reviewed 2026-08-10 |
| M2-TOOL-01 | Db2 for IBM i VS Code extension | Code for IBM i project | SQL execution, result sets, schemas view, query history, SQL Job Manager | High | Reviewed 2026-08-10 |
| M2-ENV-01 | PUB400 public IBM i service | PUB400 | Training environment; IBM i 7.5; private user libraries | High | Reviewed 2026-08-10 |

## Supplemental uploaded sources

| ID | Source | Presenter / provider | Coverage supported | Academy use |
|---|---|---|---|---|
| M2-SUP-01 | iBegin — Db2 for i | Scott Forstie / COMMON | Db2 for i integration, Db2 family, native/SQL terminology, data model, DDL/DML categories | Validate terminology and scope only |
| M2-SUP-02 | iBegin — Db2 for i Tooling | Scott Forstie / COMMON | ACS, VS Code Db2 for IBM i extension, database tooling | Validate tool categories; current behavior rechecked independently |
| M2-SUP-03 | COMMON SQL Bootcamp — The Power of SQL | COMMON | SQL/database mental model, tables, views, indexes | Coverage inspiration only |
| M2-SUP-04 | COMMON SQL Bootcamp — SQL DDL: Create Table — Basic | Sue Romano / COMMON | DDL, SQL/native names, data types, NULL, CREATE TABLE | Coverage and terminology; examples rewritten |
| M2-SUP-05 | COMMON SQL Bootcamp — SELECT Statement Basics | COMMON | SELECT grammar, WHERE, expressions, ORDER BY | Coverage and progression; examples rewritten |
| M2-SUP-06 | COMMON SQL Bootcamp — Scalar Functions and Date Calculation | Birgitta Hauser / COMMON | Scalar expressions, date/time calculations | Selective enrichment; not a standalone Module 2 lesson |
| M2-SUP-07 | COMMON SQL Bootcamp — Data Manipulation | Sven Jansson / COMMON | INSERT, UPDATE, DELETE | Coverage validation; Academy safety workflow is original |
| M2-SUP-08 | COMMON SQL Bootcamp — Group By and Having | COMMON | Aggregate functions, GROUP BY, HAVING | Coverage validation; examples rewritten |
| M2-SUP-09 | COMMON SQL Bootcamp — Joining Tables | Ryan Moeller / COMMON | Join concepts and join conditions | Coverage validation; examples rewritten |
| M2-SUP-10 | COMMON SQL Bootcamp — Next Steps | COMMON | Advanced SQL awareness | Used only to define what Module 2 intentionally defers |
| M2-ACADEMY-01 | RPGBA-101 Code for IBM i Quick Start Handbook v1.1 | The RPG Blend Academy | Safe connection context, VS Code workflow, evidence gates | Academy operational standard |

## Claims requiring execution validation

The following are source-supported but still require hands-on validation before Module 2 is released:

- The exact Db2 for IBM i extension labels and commands used in screenshots and demonstrations.
- PUB400 authority behavior for each learner library and the ability to create all course objects.
- Every SQL script in `code/sql/` on the current PUB400 IBM i 7.5 environment.
- Expected row counts and outputs in the learner workbook and instructor guide.
- Cleanup/reset behavior when a learner reruns the module.

## Version notes

PUB400 currently advertises IBM i 7.5. Publication-ready lesson text must therefore avoid requiring IBM i 7.6-only SQL features unless a second validated environment is provided. Current IBM i 7.6 documentation remains the authoritative language reference, but executable course SQL is intentionally conservative and must be validated on IBM i 7.5.

The Db2 for IBM i VS Code extension is open-source project tooling and changes independently of the IBM i operating system. UI labels, commands, connection behavior, and feature availability must be rechecked before every Academy delivery.

## Copyright and reuse

COMMON and IBM training decks are reference sources. Do not copy their slides, diagrams, exercises, course structures, or substantial wording. The Academy may preserve accurate IBM i terminology and source-supported facts while creating original teaching material.
