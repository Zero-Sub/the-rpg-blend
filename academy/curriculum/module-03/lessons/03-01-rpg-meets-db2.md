# Lesson 3.1 — RPG Meets Db2 for i: Two Access Models

## Metadata

- **Estimated time:** 55 minutes
- **Prerequisites:** Modules 0–2
- **Tools:** VS Code, Code for IBM i, Db2 for IBM i
- **Validation status:** source reviewed; IBM i execution pending

## Learning Objectives

The learner can:

1. Trace native RPG I/O and embedded SQL from source to the same Db2 for i data.
2. Explain the difference between record-oriented and set-oriented access at an introductory level.
3. Identify which target facts must be known before compiling or running either style.
4. Explain why existing native I/O is not automatically a modernization defect.
5. Identify one question Bob cannot answer without environment evidence.

## Why This Matters

Real IBM i applications rarely use only one access style. A mature application may contain native RPG file operations, embedded SQL, stored procedures, views, and newer API-oriented services. A developer who treats one style as “real IBM i” and the other as “modern” will miss the engineering question: what behavior does the application need, and what evidence proves the chosen access is safe and maintainable?

## Two Paths to the Same Data

```text
RPG source
   |
   +--> DCL-F + CHAIN/READE/UPDATE ------+
   |                                      |
   +--> EXEC SQL SELECT/UPDATE -----------+--> Db2 for i objects
```

Native I/O names an RPG file, works with externally described record formats, and uses operations such as `CHAIN`, `READE`, `WRITE`, `UPDATE`, and `DELETE`.

Embedded SQL uses SQL statements, host variables, result sets, SQL conditions, and cursors. SQL is usually stronger when the business question naturally describes a set of rows rather than a record-by-record navigation path.

Neither diagram removes IBM i authority, object resolution, constraints, or production controls.

## Module 3 Application Increment

Module 2 created the Coffee Catalog. Module 3 adds order data. The course intentionally gives each SQL order table an explicit IBM i system name and record-format name so learners can see how descriptive SQL names coexist with names used by native RPG.

```text
SQL name      System name / record format
ORDER_HEADER  ORDHDR / ORDHDR
ORDER_LINE    ORDLINE / ORDLINE
```

## Read the Requirement Before the Interface

Example requirement:

> Retrieve one order by order ID and show its status.

A keyed native `CHAIN` can express that directly when the key and file definition support it. A single-row SQL `SELECT INTO` can also express it directly.

Different requirement:

> Return every active product at or below its reorder point with category information.

That is naturally a multi-table set question. SQL can express the join/filter as one query. A record-level implementation is possible, but it may require more navigation logic.

The lesson is not “SQL wins.” The lesson is to recognize the shape of the problem.

## Safety Gate

Before data access, record:

- host
- profile
- compile library
- runtime library/file or SQL schema/table
- read/change intent
- expected result cardinality

For native I/O, compile-time external description and runtime opened file can be separate concerns. For SQL, naming mode, schema qualification, and compile/run environment can affect resolution. Module 3 makes target resolution visible instead of relying on luck.

## Bob-Assisted Activity

Ask Bob:

> Compare a keyed RPG CHAIN with a single-row SQL SELECT INTO. Describe what each one proves, what it assumes about the data model, and what environment facts you cannot know from source alone. Do not recommend a rewrite.

Mark each response item as source-supported, environment-dependent, or opinion.

## Hands-On Practice

1. Inspect `10_create_order_access.sql` without running it.
2. Identify SQL table names, system names, record-format names, and primary keys.
3. Draw the two access paths that future RPG examples will use.
4. Predict which objects must exist before native RPG can compile with external descriptions.
5. Predict which Module 2 object is referenced by an order-line foreign key.

## Independent Task

Without Bob, write a short design note choosing an access style for each:

- fetch one order by primary key
- list all low-inventory products by category
- update one known order status
- calculate total order value across many lines

Multiple answers can be defensible. Explain the reasoning rather than naming a favorite technology.

## Common Mistakes

- Calling native I/O obsolete without analyzing the application.
- Calling embedded SQL automatically safer merely because it is SQL.
- Ignoring object resolution because the source compiled once.
- Confusing record navigation with relational business relationships.
- Assuming a tool can prove production authority or data distribution from source alone.

## Completion Criteria

The learner can trace both access paths, state their target/evidence requirements, and make a reasoned interface choice for a simple business question.