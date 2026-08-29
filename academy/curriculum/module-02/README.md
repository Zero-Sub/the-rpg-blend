# RPG Blend Academy — Module 2: Db2 for i + SQL

**Status:** Content + source/static validation complete — target IBM i execution validation pending  
**Roadmap position:** Module 2 of 8  
**Prerequisite:** Module 0 — Getting Started; Module 1 — RPG Fundamentals  
**Primary environment:** Visual Studio Code + Code for IBM i + Db2 for i extension  
**Supplementary environment:** IBM i Access Client Solutions Run SQL Scripts when its deeper database tooling is useful  
**Training system:** PUB400 or another approved non-production IBM i with a learner-specific library/schema

## Module Promise

Module 2 makes the database a first-class part of the learner's IBM i mental model.

The learner enters this module able to read and write basic fully free-form RPG. The learner leaves able to inspect a Db2 for i database, explain the relationship between familiar IBM i and SQL terminology, create safe training tables, query data, combine and summarize rows, and perform controlled data changes without treating SQL as a collection of magic statements.

This module deliberately precedes RPG file and embedded-SQL access. Module 3 will connect RPG to the database after the learner understands the data model itself.

## Learning Objectives

By the end of Module 2, the learner can:

1. Explain what Db2 for i is and how it is integrated with IBM i.
2. Translate between common IBM i database terminology and SQL terminology without assuming the terms are always perfectly interchangeable.
3. Navigate schemas/libraries and database objects from Visual Studio Code.
4. Create original training tables using SQL DDL in an assigned learner schema.
5. Select, filter, sort, calculate, and label query results.
6. Explain primary keys, foreign keys, constraints, NULL, defaults, views, and indexes at an introductory level.
7. Join related tables using explicit join conditions and distinguish constraint-enforced from observed cardinality.
8. Summarize data with aggregate functions, GROUP BY, and HAVING.
9. Insert, update, and delete training data using explicit preview-before-change discipline.
10. Use IBM Bob to explain or review SQL while independently validating the result.
11. Complete an independent database task without relying entirely on Bob.
12. Produce evidence showing what was created, queried, changed, and validated.

## Lesson Sequence

| Lesson | Title | Skill outcome |
|---:|---|---|
| 2.1 | Db2 for i Is Part of the Platform | Explain Db2 for i, SQL, and the IBM i database mental model |
| 2.2 | Libraries, Schemas, Files, Tables, Fields, Columns, Records, and Rows | Translate terminology and inspect objects safely |
| 2.3 | Build the Coffee Catalog Schema | Create tables with appropriate names, data types, keys, and cardinality |
| 2.4 | Keys, Constraints, Defaults, and NULL | Protect data quality through database definitions |
| 2.5 | SELECT: Ask the Database a Precise Question | Select columns, filter rows, sort output, and use expressions |
| 2.6 | Joins: Put Related Business Data Back Together | Join tables using keys and identify incorrect join/cardinality assumptions |
| 2.7 | Aggregation: Turn Rows into Information | Use COUNT, SUM, AVG, MIN, MAX, GROUP BY, and HAVING |
| 2.8 | Safe Data Changes | Use INSERT, UPDATE, and DELETE with evidence-first safety habits |
| 2.9 | Views, Indexes, and the Next Layer | Explain the purpose of views and indexes without over-teaching performance tuning |
| 2.10 | Module Lab — Build and Query the Coffee Catalog | Independently build and validate a small relational database increment |

## Sample Application Increment

Module 2 establishes the first relational database increment for **The RPG Blend Coffee Company**.

This module creates only the objects needed for its learning goals:

- `CATEGORY`
- `PRODUCT`
- `INVENTORY`
- `ACTIVE_PRODUCT_SUMMARY` view
- `IX_PRODUCT_CATEGORY` introductory index

Customer and order objects are intentionally deferred until later modules need them. The learner should understand a small model deeply before the Academy expands the application.

### Important cardinality note

The DDL enforces:

- one CATEGORY can be referenced by many PRODUCT rows
- each PRODUCT must reference an existing CATEGORY
- each INVENTORY row must reference an existing PRODUCT
- at most one INVENTORY row can exist for a PRODUCT because `INVENTORY.PRODUCT_ID` is the primary key
- the schema does **not** require every PRODUCT to have an INVENTORY row

The deterministic seed data contains one INVENTORY row for every PRODUCT. Lessons and assessments explicitly distinguish that observed seed state from what the schema actually requires.

## Package Map

### Canonical content

- `MASTER_COURSE_PACKAGE.md`
- `lessons/02-01-db2-for-i-platform.md`
- `lessons/02-02-native-and-sql-terms.md`
- `lessons/02-03-build-coffee-catalog-schema.md`
- `lessons/02-04-keys-constraints-defaults-null.md`
- `lessons/02-05-select-precise-question.md`
- `lessons/02-06-joins.md`
- `lessons/02-07-aggregation-group-by-having.md`
- `lessons/02-08-safe-data-changes.md`
- `lessons/02-09-views-indexes-next-layer.md`
- `lessons/02-10-module-lab.md`

### Learner assets

- `workbook/student-workbook.md`
- `lab/module-02-lab.md`
- `assessment/module-02-assessment.md`

### Instructor assets

- `instructor-notes/instructor-guide.md`
- `lab/instructor-solution.md`
- `assessment/module-02-answer-key.md`

### Executable/source assets

- `environment/PUB400_SETUP.md`
- `code/sql/01_create_catalog.sql`
- `code/sql/02_seed_catalog.sql`
- `code/sql/03_select_practice.sql`
- `code/sql/04_join_practice.sql`
- `code/sql/05_aggregation_practice.sql`
- `code/sql/06_safe_data_changes.sql`
- `code/sql/07_views_and_indexes.sql`
- `code/sql/99_reset.sql`
- `code/bob/module2_prompts.md`

### Review/publication assets

- `sources/source-register.md`
- `TECHNICAL_VALIDATION_BACKLOG.md`
- `presentations/module-02-slide-source.md`

## Safety Model

Every learner works only in an assigned non-production schema/library.

Before any data-changing statement, the course trains the learner to answer:

1. Which system am I connected to?
2. Which user/profile am I using?
3. Which schema/library and table am I targeting?
4. Which rows should change?
5. How will I preview or prove that target set?
6. How will I validate the result?
7. What cleanup or reset is required in the training environment?

The preview-before-change rule applies to both UPDATE and DELETE. A successful SQL statement is not sufficient evidence of a safe change.

## IBM Bob Integration

Bob activities include:

- explaining unfamiliar DDL or SELECT syntax
- comparing IBM i and SQL terminology
- reviewing a proposed table design
- identifying missing join predicates or unsafe UPDATE/DELETE statements
- suggesting boundary and data-quality test cases
- reviewing views and index claims
- assisting with diagnostics without replacing evidence

Learners must identify what Bob got right, what required correction, and what independent evidence they used.

## Independent Work Rule

The module capstone includes a no-copy independent section. Bob may be used only in the mode defined by the assessment. The learner must be able to explain every submitted SQL statement and reproduce the required result.

## Source Basis

Executable behavior is validated first against IBM i **7.5** documentation because PUB400 is the target public training host. IBM i 7.6 documentation is used as a current/forward cross-check and must not introduce an unvalidated 7.6-only dependency into the 7.5 learner path.

Supplemental Academy research includes:

- COMMON iBegin — Db2 for i
- COMMON iBegin — Db2 for i Tooling
- COMMON SQL Bootcamp — The Power of SQL
- COMMON SQL Bootcamp — SQL DDL: Create Table — Basic
- COMMON SQL Bootcamp — SELECT Statement Basics
- COMMON SQL Bootcamp — Scalar Functions and Date Calculation
- COMMON SQL Bootcamp — Data Manipulation
- COMMON SQL Bootcamp — Group By and Having
- COMMON SQL Bootcamp — Joining Tables
- COMMON SQL Bootcamp — Next Steps: A Little Bit Beyond the Basics

These sources validate coverage and terminology. Academy lessons, examples, SQL, labs, diagrams, and assessments remain original.

## 2026-08-10 Validation Pass

Completed static/source validation included:

- IBM i 7.5 SQL behavior and syntax cross-check
- current Code for IBM i / Db2 for IBM i tooling documentation review
- current PUB400 service facts review
- expected-result reconciliation from deterministic seed data
- member/partition terminology correction
- PRODUCT/INVENTORY cardinality correction
- assessment DELETE-preview correction
- reset hardening with `DROP ... IF EXISTS`
- workbook/lab/answer-key/slide-source reconciliation

See `TECHNICAL_VALIDATION_BACKLOG.md` for the detailed evidence boundary.

## Development Gates

### Content and static/source validation

- [x] Roadmap alignment confirmed
- [x] Module purpose and lesson sequence defined
- [x] IBM i 7.5 target documentation mapped to executable claims
- [x] IBM i 7.6 used as forward/current cross-check only
- [x] Current Code for IBM i / Db2 for IBM i documentation reviewed
- [x] Current PUB400 environment documentation reviewed
- [x] Module source register created/reconciled
- [x] All ten lesson manuscripts drafted
- [x] Original SQL starter/practice/reset assets drafted
- [x] Bob activities drafted
- [x] Independent work included in every major skill area
- [x] Capstone lab drafted
- [x] Instructor lab solution drafted
- [x] Assessment and answer key drafted and reconciled
- [x] Instructor guide drafted
- [x] Learner workbook drafted and reconciled
- [x] Presentation source drafted and reconciled
- [x] Expected result set mathematically reconciled from seed data
- [x] Technical validation backlog defined

### Still required before release

- [ ] Db2 for IBM i extension workflow smoke-tested against the delivery version
- [ ] PUB400 permissions and learner-library assumptions smoke-tested
- [ ] Every SQL asset executed on the target IBM i environment
- [ ] Negative-test SQLSTATE/messages captured
- [ ] Expected row counts/results reconciled with actual execution
- [ ] Full and partial reset plus clean rebuild proven
- [ ] Independent technical reviewer repeat run completed
- [ ] First-time learner pilot completed
- [ ] Pilot feedback incorporated
- [ ] Branded coursebook/PDF generated from validated canonical source
- [ ] Branded instructor/learner documents generated
- [ ] Branded PPTX generated from validated slide source
- [ ] Release manifest frozen and release candidate tagged

## Definition of Done

Module 2 is not release-ready until another person can start from the documented environment, execute the module without hidden setup knowledge, reproduce the expected SQL results, reset the training objects safely, explain the database model, and pass the practical assessment without unreviewed AI dependence.
