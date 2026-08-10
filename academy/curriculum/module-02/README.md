# RPG Blend Academy — Module 2: Db2 for i + SQL

**Status:** Development  
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
7. Join related tables using explicit join conditions.
8. Summarize data with aggregate functions, GROUP BY, and HAVING.
9. Insert, update, and delete training data using explicit safe-change discipline.
10. Use IBM Bob to explain or review SQL while independently validating the result.
11. Complete an independent database task without relying entirely on Bob.
12. Produce evidence showing what was created, queried, changed, and validated.

## Working Lesson Sequence

| Lesson | Working title | Skill outcome |
|---:|---|---|
| 2.1 | Db2 for i Is Part of the Platform | Explain Db2 for i, SQL, and the IBM i database mental model |
| 2.2 | Libraries, Schemas, Files, Tables, Fields, Columns, Records, and Rows | Translate terminology and inspect objects safely |
| 2.3 | Build the Coffee Catalog Schema | Create tables with appropriate names and data types |
| 2.4 | Keys, Constraints, Defaults, and NULL | Protect data quality through database definitions |
| 2.5 | SELECT: Ask the Database a Precise Question | Select columns, filter rows, sort output, and use expressions |
| 2.6 | Joins: Put Related Business Data Back Together | Join tables using keys and identify incorrect join behavior |
| 2.7 | Aggregation: Turn Rows into Information | Use COUNT, SUM, AVG, MIN, MAX, GROUP BY, and HAVING |
| 2.8 | Safe Data Changes | Use INSERT, UPDATE, and DELETE with evidence-first safety habits |
| 2.9 | Views, Indexes, and the Next Layer | Explain the purpose of views and indexes without over-teaching performance tuning |
| 2.10 | Module Lab — Build and Query the Coffee Catalog | Independently build and validate a small relational database increment |

Lesson numbering remains provisional until technical and pilot review. The module title and roadmap position are canonical.

## Sample Application Increment

Module 2 establishes the first relational database increment for **The RPG Blend Coffee Company**.

Initial objects are expected to include a small subset of:

- `CUSTOMER`
- `PRODUCT`
- `CATEGORY`
- `INVENTORY`
- `ORDER_HEADER`
- `ORDER_DETAIL`

The learner will not build the full application schema in one sitting. Objects are introduced only when they support the current learning objective.

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

A successful SQL statement is not sufficient evidence of a safe change.

## IBM Bob Integration

Bob activities will include:

- explaining unfamiliar DDL or SELECT syntax
- comparing IBM i and SQL terminology
- reviewing a proposed table design
- identifying missing join predicates or unsafe UPDATE/DELETE statements
- suggesting boundary and data-quality test cases
- generating a documentation draft after the learner has verified the database behavior

Learners must identify what Bob got right, what required correction, and what independent evidence they used.

## Independent Work Rule

The module capstone includes a no-copy independent section. Bob may be used only in the mode defined by the assessment. The learner must be able to explain every submitted SQL statement and reproduce the required result.

## Initial Source Basis

Primary publication validation will use current IBM documentation. Supplemental Academy research includes:

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

These sources validate coverage and terminology. Academy lessons, examples, SQL, labs, diagrams, and assessments must remain original.

## Development Gates

- [x] Roadmap alignment confirmed
- [x] Module purpose and lesson sequence drafted
- [ ] Current IBM 7.6 documentation mapped to material claims
- [ ] Db2 for i extension workflow validated against current tooling
- [ ] PUB400 permissions and learner-library assumptions smoke-tested
- [ ] SQL starter schema created and executed
- [ ] Lessons drafted
- [ ] Bob activities drafted and reviewed
- [ ] Labs and independent task completed
- [ ] Assessment and answer key completed
- [ ] Instructor guide completed
- [ ] Learner workbook/course book completed
- [ ] Branded slide deck completed
- [ ] Full technical validation run completed
- [ ] Pilot learner review completed

## Definition of Done

Module 2 is not release-ready until another person can start from the documented environment, execute the module without hidden setup knowledge, reproduce the expected SQL results, reset the training objects safely, explain the database model, and pass the practical assessment without unreviewed AI dependence.
