# RPG Blend Academy — Module 3: Files + Data Access

**Status:** content build complete — source/static validation in progress; IBM i execution validation pending  
**Roadmap position:** Module 3 of 8  
**Prerequisites:** Module 0 — Getting Started; Module 1 — RPG Fundamentals; Module 2 — Db2 for i + SQL  
**Primary environment:** Visual Studio Code + Code for IBM i + Db2 for IBM i extension  
**Supporting environment:** IBM i Access Client Solutions where deeper database or job analysis is appropriate  
**Training target:** PUB400 IBM i 7.5 learner-owned library/schema for normal labs; transaction lab requires a validated journaled non-production environment

## Module Promise

Module 2 taught learners to reason about the database. Module 3 teaches an RPG program to work with it.

Learners use two access styles that coexist in real IBM i applications:

- native RPG record-level access
- embedded SQL in RPG

The goal is not to declare one interface universally superior. The learner should understand what each interface does, how targets resolve, how locks and errors surface, and how to choose a maintainable approach for the business problem.

## Learning Objectives

By the end of Module 3, the learner can:

1. Explain how RPG native I/O and embedded SQL access the same Db2 for i data while using different programming models.
2. Define an externally described disk file with `DCL-F` and explain compile-time versus runtime file resolution.
3. Perform keyed native reads with `CHAIN`, `SETLL`, `READE`, `%FOUND`, and `%EOF` where appropriate.
4. Perform controlled native `WRITE`, `UPDATE`, and `DELETE` operations and explain record-lock implications.
5. Compile and run SQL RPG source and use host variables with a single-row `SELECT INTO`.
6. Process a multi-row SQL result with a cursor and recognize end-of-data correctly.
7. Use `SQLSTATE`, `SQLCODE`, and `GET DIAGNOSTICS` as evidence when embedded SQL succeeds, warns, affects rows, or fails.
8. Explain journaling, commitment control, commitment boundaries, `COMMIT`, `ROLLBACK`/`ROLBK`, and why environment preconditions matter.
9. Distinguish normal record locks from commitment-control behavior at an introductory level.
10. Choose native I/O, embedded SQL, or a deliberate combination based on access pattern, clarity, set orientation, and operational needs.
11. Use IBM Bob for explanation, dependency analysis, diagnostics, and test suggestions without outsourcing target verification or correctness.
12. Complete an independent order-access capstone and produce reproducible evidence.

## Lesson Sequence

| Lesson | Title | Primary outcome |
|---:|---|---|
| 3.1 | RPG Meets Db2 for i: Two Access Models | Trace native and SQL paths to the same data |
| 3.2 | Externally Described Files and `DCL-F` | Define and target an external database file safely |
| 3.3 | Keyed Native Reads | Use CHAIN and positioned reads with status BIFs |
| 3.4 | Native Data Changes and Record Locks | Write/update/delete with target and lock discipline |
| 3.5 | Embedded SQL: Single-Row Access | Use host variables and SELECT INTO |
| 3.6 | Embedded SQL Cursors | Process multi-row sets without pretending SELECT INTO is a loop |
| 3.7 | SQL Diagnostics and Application Errors | Interpret SQLSTATE/SQLCODE and retrieve useful diagnostics |
| 3.8 | Transactions, Journaling, and Commitment Control | Group related changes only in a validated environment |
| 3.9 | Native I/O or SQL? Make an Engineering Choice | Choose an access style from evidence and requirements |
| 3.10 | Module Lab — Order Access Increment | Build, read, change, diagnose, and defend the solution |

## Application Increment

Module 3 extends the fictional RPG Blend Coffee Company database from Module 2 with two tables:

- SQL table `ORDER_HEADER`, system name `ORDHDR`, record format `OHDRR`
- SQL table `ORDER_LINES`, system name `ORDLINE`, record format `OLINER`

The SQL names are intentionally longer than a traditional 10-character system object name, allowing the DDL to assign explicit IBM i system names. Embedded SQL examples use descriptive SQL names. Native RPG examples use stable system names/record formats. This makes the SQL/native bridge visible rather than leaving generated names to chance.

`ORDER_LINES.PRODUCT_ID` references the Module 2 `PRODUCT` table. Module 3 therefore assumes Module 2 base objects exist when the integrated labs run.

## Safety Model

Every data-access exercise starts with the same questions:

1. Which host and profile are active?
2. Which library/schema will the program compile against?
3. Which object will be opened or referenced at runtime?
4. Is the operation read-only or data-changing?
5. Which record(s) or row(s) should be affected?
6. What lock or transaction behavior could exist?
7. What evidence proves success or failure?
8. What cleanup or rollback path is actually available in this environment?

A successful compile proves syntax and external-description compatibility for that build. It does not prove the runtime target, business result, authority model, or transaction behavior is correct.

## Transaction Boundary

Module 3 teaches commitment control because production developers need the concept. It does **not** assume a public PUB400 learner library is journaled or that the learner should create journals or request elevated authority.

The transaction exercise has a mandatory preflight. If the environment cannot satisfy journaling and commitment-control prerequisites under approved normal authority, the learner completes the conceptual/test-design portion on PUB400 and the executable transaction demonstration moves to an instructor-provided non-production IBM i.

## IBM Bob Integration

Bob may explain file definitions/operations, trace native I/O, compare access styles, review cursor loops, explain captured SQL diagnostics, identify dependency/lock risks, propose tests, and review a completed Git diff. Bob may not choose the production target, expand authority, manufacture runtime evidence, or declare transaction prerequisites satisfied without evidence.

## Independent Work Rule

Every lesson contains an independent task. The capstone requires the learner to write and defend core access logic without copying a Bob-generated solution. Bob is review/reference only during the assessed portion.

## Content Package

- 10 canonical lessons
- order DDL, seed, and reset SQL
- three native RPG examples
- four SQLRPGLE examples
- Bob prompt set
- PUB400 setup and transaction preflight
- local Action reference
- learner workbook
- capstone + instructor solution
- assessment + answer key
- instructor guide
- source register
- slide source
- technical validation backlog

## Before Release

- [ ] Module 2 runtime validation completed or compatible base database proven
- [ ] Order DDL executed on IBM i 7.5 target
- [ ] Every RPGLE/SQLRPGLE source compiles on target compiler/PTF level
- [ ] Native read/write/update/delete behavior reproduced
- [ ] Embedded SQL results and diagnostics reproduced
- [ ] Lock behavior observed and documented without unsafe contention
- [ ] Transaction environment/journaling preflight validated
- [ ] Commit/rollback demonstration reproduced where approved
- [ ] Reset/rebuild proven
- [ ] Independent technical reviewer run completed
- [ ] First-time learner pilot completed
- [ ] Branded publication assets generated from validated canonical source

## Definition of Done

Module 3 is release-ready only when a reviewer can start from documented Module 2 prerequisites, build the Module 3 order objects, compile and run every required RPG access example, reproduce documented data/diagnostic behavior, complete the approved transaction demonstration or documented alternate environment path, reset safely, and pass the capstone without hidden instructor knowledge.