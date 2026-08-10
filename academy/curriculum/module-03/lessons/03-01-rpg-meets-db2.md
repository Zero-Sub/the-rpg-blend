# Lesson 3.1 — RPG Meets Db2 for i: Two Access Models

## Metadata

- **Estimated time:** 55 minutes
- **Prerequisites:** Modules 0–2
- **Tools:** VS Code, Code for IBM i, Db2 for IBM i
- **Validation status:** source reviewed; IBM i execution pending

## Learning Objectives

The learner can trace native RPG I/O and embedded SQL to the same Db2 for i data, explain record-oriented versus set-oriented access, identify target evidence before compile/run, avoid treating native I/O as an automatic modernization defect, and identify environment facts Bob cannot prove from source.

## Two Paths to the Same Data

```text
RPG source
   |
   +--> DCL-F + CHAIN/READE/UPDATE ------+
   |                                      |
   +--> EXEC SQL SELECT/UPDATE -----------+--> Db2 for i objects
```

Native I/O works with file definitions, externally described record formats, keys, and file operation status. Embedded SQL uses SQL statements, host variables, result sets, SQL conditions, and cursors. Neither style removes IBM i authority, constraints, target resolution, locks, or operational controls.

## Module 3 Application Increment

Module 2 created the Coffee Catalog. Module 3 adds:

| SQL name | System name | Record format |
|---|---|---|
| ORDER_HEADER | ORDHDR | OHDRR |
| ORDER_LINES | ORDLINE | OLINER |

This mapping is deliberate. SQL uses descriptive names; native RPG can use stable IBM i external names. The DDL must be validated before learners trust this bridge.

## Requirement Before Interface

“One order by primary key” can be a good direct keyed native lookup or a one-row SQL SELECT INTO. “All low-inventory products with category data” is naturally a relational set query. The course asks which shape best matches the requirement rather than declaring one interface universally correct.

## Safety Gate

Record host, profile, compile library, runtime file/schema, read/change intent, and expected cardinality before access.

## Bob Activity

Ask Bob to compare a keyed CHAIN with primary-key SELECT INTO, including assumptions and environment facts it cannot know. Classify each finding as supported, environment-dependent, or opinion.

## Independent Task

Choose an access approach for one-order lookup, low inventory list, one known status update, and total order value. Defend reasoning without Bob.

## Common Mistakes

- “Native is obsolete.”
- “SQL is automatically safe.”
- “Compile success proves the runtime target.”
- “A key explains the business relationship.”
- unsupported performance claims.

## Completion Criteria

Learner can trace both paths and defend a simple access decision with target/evidence requirements.