# Lesson 2.1 — Db2 for i Is Part of the Platform

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.1
- **Estimated time:** 45 minutes
- **Prerequisites:** Modules 0 and 1
- **Required tools:** VS Code, Code for IBM i, Db2 for IBM i extension
- **Training environment:** PUB400 learner profile and private library
- **Sample application:** RPG Blend Coffee Company catalog
- **Validation status:** source reviewed; hands-on execution validation pending
- **Source register:** `../sources/source-register.md`

## Today's Coffee

A coffee shop can have an espresso machine, grinder, beans, water system, and point-of-sale process that work as one operation. You can discuss each component separately, but the customer experiences one system. Db2 for i deserves the same mental model: it is not an unrelated database bolted onto IBM i.

## Learning Objectives

By the end of this lesson, the learner can:

1. Explain what Db2 for i is.
2. Explain why calling IBM i only a database or only an operating system is incomplete.
3. Distinguish SQL as a language/interface from Db2 for i as the database manager.
4. Identify the course safety boundary before exploring database objects.
5. Use Bob to check an explanation without outsourcing understanding.

## Why This Matters

A new developer who thinks the database is a separate product may misunderstand deployment, security, object ownership, naming, and application behavior. On IBM i, database objects participate directly in the platform's object model, authority model, backup/recovery practices, and application runtime.

The practical consequence is simple: database work is application work. A careless SQL statement can be just as operationally significant as a careless RPG change.

## Concepts

### Db2 for i

The relational database manager on IBM i is **Db2 for i**. It is integrated with the operating environment rather than installed and managed as an unrelated add-on database server.

### SQL

SQL is the standardized language used to define, query, manipulate, and control relational data. SQL is not the database itself. Think of SQL as one of the primary ways developers communicate with Db2 for i.

### Native and SQL coexistence

Real IBM i applications commonly contain both DDS-created and SQL-created database objects, and programs may use both native record-level access and SQL interfaces. Module 2 teaches the SQL model without pretending existing native terminology disappears.

## Architecture

```text
Developer in VS Code
        |
        | SQL statement
        v
Db2 for IBM i extension
        |
        v
IBM i job / database request
        |
        v
Db2 for i
        |
        +--> schema / library
               |
               +--> tables, views, indexes, constraints
```

The editor is only the client experience. IBM i authority and database rules still determine what the request is allowed to do.

## First Read-Only Look

Use the schema browser in the Db2 for IBM i extension to locate the learner's assigned private library. Do not create or change anything yet.

Then run a small catalog query after replacing `YOURSCHEMA`:

```sql
select TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
from QSYS2.SYSTABLES
where TABLE_SCHEMA = 'YOURSCHEMA'
order by TABLE_NAME
fetch first 20 rows only;
```

### What to notice

- `QSYS2.SYSTABLES` is metadata about database objects.
- `TABLE_SCHEMA` identifies the schema/library context.
- `TABLE_NAME` identifies the database object.
- `TABLE_TYPE` helps distinguish base tables, views, and related object types.
- `FETCH FIRST` keeps exploratory output bounded.

## Safety Gate

Before executing any SQL, answer:

1. Which IBM i am I connected to?
2. Which user profile am I using?
3. Which library/schema am I examining?
4. Is the statement read-only or data-changing?
5. What result do I expect?

A connection that succeeds only proves authentication succeeded. It does not prove the target is appropriate.

## IBM Bob-Assisted Activity

Use the Lesson 2.1 prompt in `../code/bob/module2_prompts.md`.

After Bob responds, mark each statement as:

- verified fact
- analogy
- assumption
- recommendation

Then explain Db2 for i again without looking at Bob's answer.

## Hands-On Practice

1. Connect to PUB400.
2. Open the Db2 for IBM i extension.
3. Locate the learner's private library/schema.
4. Run the read-only catalog query.
5. Record the target schema and number of rows returned.
6. Identify one object that belongs to the learner and one system object you must not modify.

## Independent Task

Without Bob, write a five-sentence explanation of the relationship among IBM i, Db2 for i, SQL, and a schema/library. A reviewer should be able to tell that you understand the database is integrated with the platform.

## Common Mistakes

- Saying “Db2 is SQL.” SQL is a language; Db2 for i is the database manager.
- Assuming a visible object is safe to change.
- Treating PUB400 as disposable enough that safety habits do not matter.
- Using broad queries against system catalogs without a reason or result limit.
- Assuming IBM i native terminology is obsolete.

## Pro Tips

- Build the habit of naming the target schema before discussing a query.
- Use the same evidence discipline in training that you would expect in production support.
- Learn both native and SQL vocabulary; enterprise IBM i systems often contain both.

## Manager's Perspective

A developer who can write SQL but cannot explain target context is not yet ready for unsupervised database changes. During onboarding, evaluate whether the learner verifies the environment, predicts results, and can explain why a statement is safe—not just whether it executes.

## Knowledge Check

1. What is the database manager on IBM i called?
2. Why is SQL not the same thing as Db2 for i?
3. What does a successful database connection fail to prove?
4. Why should a learner bound an exploratory query?
5. Why must an IBM i developer understand both native and SQL database terminology?
6. What evidence should you capture before moving from read-only exploration to DDL?

## Completion Criteria

The learner can locate the assigned schema, run a read-only catalog query, explain the platform/database relationship, and identify the safety boundary without Bob.

## Final Sip

The first database skill is not writing a clever query. It is knowing exactly which system you are talking to before you ask it to do anything.

## References

See `../sources/source-register.md`, especially M2-IBM-01, M2-IBM-06, M2-SUP-01, and M2-TOOL-01.
