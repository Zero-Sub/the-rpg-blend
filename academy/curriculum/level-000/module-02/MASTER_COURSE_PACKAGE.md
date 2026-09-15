# The RPG Blend Academy

## Module 2: Db2 for i and SQL-Centered Development

**Status:** In Development  
**Estimated time:** 10–12 hours  
**Prerequisite:** Modules 0–1 or equivalent  
**Primary environment:** Visual Studio Code, Code for IBM i, Db2 for IBM i extension, Git, IBM Bob  
**Supporting tool:** IBM i Access Client Solutions when appropriate

## Why this module exists

Module 1 teaches the learner to read, change, compile, test, and explain a small modern RPG program. Module 2 develops the data skills required to make those changes safely in a real IBM i application.

The learner builds an original Coffee Company relational slice, queries it, changes it under controlled transaction conditions, and creates an explicit Data Service boundary. Module 3 then consumes that boundary while teaching reusable RPG Domain Services.

The module is intentionally not a generic SQL bootcamp. Every topic answers one of three questions:

1. What does the data mean and how is it represented on IBM i?
2. How do we query or change it safely and prove the result?
3. What database detail should the rest of the application be allowed to depend on?

## Measurable learning objectives

By the end of Module 2, the learner can:

1. Explain Db2 for i in the IBM i platform context.
2. Translate native IBM i data terms to SQL terms and explain where the mapping is approximate rather than absolute.
3. Distinguish source physical-file members from database-file member/partition context.
4. Verify host, identity, connection, and schema/library before executing SQL.
5. Create SQL-defined tables with deliberate types, nullability, defaults, keys, referential integrity, and check constraints.
6. Write `SELECT` statements with filtering, expressions, aliases, sorting, `DISTINCT`, scalar functions, and date/time expressions.
7. Explain and test `NULL` behavior.
8. Join related tables and reason about relationship cardinality before trusting results.
9. Use aggregates, `GROUP BY`, and `HAVING` with an explicit result grain.
10. Perform controlled `INSERT`, `UPDATE`, and `DELETE` work with expected-row counts and transaction evidence.
11. Explain practical relationships among journaling, commitment control, `COMMIT`, `ROLLBACK`, and client settings.
12. Use views, CTEs, and selected subqueries to shape stable relational interfaces.
13. Recognize basic performance evidence and separate correctness from efficiency.
14. Create a Coffee Company Data Service boundary that returns product facts without leaking raw SQL diagnostics as the application contract.
15. Use Bob for explanation, dependency discovery, review, and test suggestions while independently validating material findings.
16. Complete an independent relational/data-interface change without step-by-step Bob or instructor direction.

## Six mental models

### 1. Db2 for i is part of IBM i

IBM i applications may use SQL, native record-level access, or both. SQL-centered development does not require pretending native objects and interfaces do not exist.

### 2. Persistence shape is not application meaning

A row is how data is stored. A Data Service contract is what the application is allowed to rely on.

### 3. SQL is set-oriented

Queries should be reasoned about as sets, subsets, relationships, and result grains rather than as a hidden loop over records.

### 4. Integrity belongs near the data when appropriate

Types, nullability, keys, constraints, and referential integrity keep invalid persistence states out. They do not replace broader domain decisions.

### 5. Data changes need transaction discipline

Correct syntax is not sufficient evidence. Context, qualifying predicates, expected row counts, journaling/commitment behavior, and recovery matter.

### 6. Data Services shield later layers

Data Services own SQL and database-specific failures. Domain Services own business decisions. Module 2 must make that boundary visible before Module 3.

## Lesson 1 — Db2 for i: The Data Platform You Already Have

### Learn

- Db2 for i platform orientation.
- SQL and native data interfaces.
- Library/schema, physical file/table, field/column, record/row, logical file/view, keyed logical file/index.
- Source-member versus database-member context.
- Why multi-member data files are important to recognize but are not the Academy default for new relational design.

### Practice

Inventory a Coffee Company data area and map native/SQL terminology.

### Bob activity

Do the first map manually. Ask Bob to explain ambiguous objects or terms, then verify against the live object and primary documentation.

### Prove

Submit an object/terminology map with unresolved questions clearly marked.

## Lesson 2 — Modern SQL Tooling and Safe Context

### Learn

- Db2 for IBM i extension workflow.
- Code for IBM i connection context.
- Current schema and explicit qualification.
- Git-managed `.sql` scripts versus exploratory SQL.
- Read-only exploration before DDL/DML.
- ACS Run SQL Scripts as a supporting database tool.

### Practice

Connect to the assigned training system, verify context, execute read-only discovery queries, and save the final query in Git.

### Prove

Capture system/profile/schema context and a reproducible read-only result.

## Lesson 3 — Define Data with SQL DDL

### Learn

- `CREATE SCHEMA`, `CREATE TABLE`.
- Character, numeric, date/time, and timestamp choices.
- `NULL`/`NOT NULL`, defaults, identity behavior.
- Primary keys, foreign keys, unique and check constraints.
- Referential integrity.
- SQL names and IBM i system-name recognition.
- SQL-defined tables as the Academy default for new relational examples; DDS-defined files remain important to support.

### Practice

Create the Coffee Company customer, product, order-header, and order-item tables.

### Prove

Show the Git DDL, created objects/catalog evidence, and invalid inserts rejected by constraints.

## Lesson 4 — SELECT: Think in Sets

### Learn

- `SELECT`, `FROM`, `WHERE`, `ORDER BY`.
- Projection, expressions, aliases, `DISTINCT`.
- Predicates and explicit Boolean grouping.
- `IS NULL` / `IS NOT NULL`.
- Selected string/numeric/date functions.
- Expected-set reasoning.

### Practice

Answer Coffee Company catalog, inventory, date-window, and missing-data questions.

### Prove

State expected results before execution and explain any mismatch.

## Lesson 5 — Relationships, Joins, and Cardinality

### Learn

- Primary/foreign-key relationships.
- Inner and left outer joins.
- Cross joins at recognition/warning level.
- Finding unmatched rows.
- Correlation names/aliases.
- `NULL` effects.
- One-to-one, one-to-many, many-to-many reasoning.
- Row-count checks before and after joins.

### Practice

Join orders to customers and order items to products.

### Prove

Submit a correct join, a cardinality explanation, and one broken-join diagnosis.

## Lesson 6 — Aggregation: Result Grain Matters

### Learn

- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`.
- `GROUP BY` and `HAVING`.
- `WHERE` versus `HAVING`.
- Aggregate `NULL` behavior.
- Result grain and reconciliation.

### Practice

Summarize orders and units by customer/product using stored order-item values.

### Prove

Define one result row in plain language and reconcile at least one aggregate to detail rows.

## Lesson 7 — DML, Transactions, and Safe Data Change

### Learn

- `INSERT`, `UPDATE`, `DELETE`.
- Defaults/generated values.
- Pre-change `SELECT`.
- Expected affected-row counts.
- `COMMIT` and `ROLLBACK`.
- Journaling and commitment-control dependencies.
- Client/autocommit awareness.

### Practice

Perform a controlled inventory correction, prove the changed state, roll it back, prove restoration, then repeat and commit only when the lab instructs it.

### Prove

Submit before/change/rollback/final evidence plus a recovery explanation.

## Lesson 8 — Views, CTEs, Performance Evidence, and the Data Service Boundary

### Learn

- Views as reusable relational interfaces.
- CTEs and practical subqueries.
- `UNION` and table functions at progression level.
- IBM i Services at recognition/practical-use level with authority/version awareness.
- Query correctness versus performance evidence.
- Indexes as access structures rather than business logic.
- Data Services versus Domain Services.

### Coffee Company target

Create `RPGBA_CC.V_PRODUCT_SNAPSHOT` with product identity, price, available quantity, and active-state facts. Do **not** put order eligibility, discount calculation, or approval/denial logic in the view.

Create a small embedded-SQL RPG demonstration that reads the view and translates database outcomes to a stable data-access status. Raw SQL diagnostics remain implementation detail.

### Prove

Submit the view, data-access source, tests, Git diff, and Data Service boundary explanation.

## Guided labs

1. **Map Native and SQL Data Concepts** — object and terminology map.
2. **Build the Coffee Company Schema** — DDL, keys, constraints, invalid-data tests.
3. **Query the Catalog** — filtering, expressions, functions, dates, `NULL`.
4. **Join and Summarize Orders** — relationships, cardinality, grouping, reconciliation.
5. **Change Data Safely** — controlled transaction, rollback, final commit.
6. **Create the Data Service Boundary** — `V_PRODUCT_SNAPSHOT` plus embedded-SQL demonstration.

## Independent challenge — Extend the Data Slice Without Moving the Domain

Requirement: Coffee Company wants products grouped by category for reporting and catalog navigation.

Without step-by-step AI or instructor workflow direction, the learner must:

1. define acceptance criteria and result grain;
2. add an appropriate category entity and integrity rules;
3. seed controlled training data;
4. write and test the required joins/queries;
5. modify or create a view only when it improves the stable data interface;
6. prove that order eligibility, discount, and approval logic did not move into SQL;
7. run invalid-data and regression tests;
8. review the Git diff and database-object impact;
9. ask Bob for review only after the independent implementation is complete;
10. explain the design and evidence without AI assistance.

## Assessment

- **Knowledge check — 20%**: Db2 for i model, terminology, DDL, `NULL`, keys, SELECT, joins, aggregation, DML, transactions, views/CTEs, performance awareness, Data Service boundaries.
- **Practical implementation — 60%**: independent category/data-interface change and evidence.
- **Explain-back/review — 20%**: relational design, result grain/cardinality, transaction safety, boundary design, and Module 3 handoff.

### Minimum completion standard

- 80% overall.
- No critical safety failure.
- Required SQL scripts execute in the approved training environment.
- Integrity/negative tests pass.
- Transaction lab proves rollback before controlled commit.
- Evidence identifies system/profile/schema, source revision, affected database objects, expected rows, actual rows, and observed results.
- Learner explains why `V_PRODUCT_SNAPSHOT` returns facts rather than order-eligibility decisions.

## Module 2 → Module 3 handoff

Module 3 may assume that the learner:

- understands relational data and SQL fundamentals;
- can identify Data Service responsibilities;
- can read `V_PRODUCT_SNAPSHOT` and explain every column;
- understands that raw SQL diagnostics are not domain results;
- can reason about transaction ownership at a basic level;
- can prove database behavior with tests and evidence.

Module 3 should therefore focus on procedure contracts, modules, service programs, binding, Domain Services, error contracts, state, and reusable capability design rather than reteaching SQL.

## IBM Bob rules

Bob may:

- explain unfamiliar schema/SQL;
- identify likely dependencies;
- review learner-authored DDL and queries;
- suggest `NULL`, join, grouping, transaction, and regression tests;
- review the Data Service boundary for persistence leakage;
- suggest performance questions and evidence to collect;
- draft documentation from verified facts.

Bob may not replace:

- context verification;
- schema inspection;
- acceptance criteria;
- expected row-count reasoning;
- transaction/recovery evidence;
- integrity testing;
- human review;
- the independent challenge.

## Production safety and governance

- Work only in assigned non-production schemas/libraries with synthetic Academy data.
- Verify host, profile, schema/library, table, branch, script, and expected row count before DDL/DML.
- Treat `DROP`, `ALTER`, `UPDATE`, `DELETE`, `MERGE`, and bulk inserts as elevated-risk operations.
- Never use production/client data, PHI, credentials, tokens, private keys, unrestricted logs, or confidential configuration in Git or AI prompts.
- Do not request broader authority merely to make a lab statement succeed.
- Do not assume `COMMIT`/`ROLLBACK` behavior; verify journaling and connection/transaction context.
- Do not weaken correctness, integrity, or security for a performance demonstration.

## Release status

The package is in development. Promotion to release candidate requires live IBM i execution of all SQL scripts, transaction/journaling validation, embedded-SQL compile/runtime validation, Db2 for IBM i extension workflow validation, current Bob behavior validation, independent technical review, learner pilot, and closure of Critical/High defects.

## Primary validation sources

- iBegin: Db2 for i.
- iBegin: Db2 for i Tooling.
- iBegin: Db2 for i Programming.
- COMMON SQL Bootcamp: The Power of SQL.
- COMMON SQL Bootcamp: SQL DDL — Create Table — Basic and associated script archive.
- COMMON SQL Bootcamp: SELECT Statement Basics.
- COMMON SQL Bootcamp: Scalar Functions and Date Calculation.
- COMMON SQL Bootcamp: Data Manipulation.
- COMMON SQL Bootcamp: Group By and Having Clause.
- COMMON SQL Bootcamp: Joining Tables.
- COMMON SQL Bootcamp: Next Steps — A Little Bit Beyond the Basics and associated script archive.
- Current IBM Db2 for i / SQL documentation for release-sensitive facts before publication.
- Current Code for IBM i and Db2 for IBM i extension documentation.
- Current IBM Bob documentation for version-sensitive behavior.
- Canonical RPG Blend Method and MVC Architecture.

Reference sources validate terminology, concepts, and technical behavior. Academy schema, explanations, examples, lesson progression, labs, tests, assessments, and Coffee Company artifacts remain original.