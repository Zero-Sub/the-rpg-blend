# Lesson 2.2 — Libraries, Schemas, Files, Tables, Fields, Columns, Records, and Rows

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.2
- **Estimated time:** 60 minutes
- **Prerequisites:** Lesson 2.1
- **Required tools:** VS Code, Code for IBM i, Db2 for IBM i extension
- **Sample application:** Coffee Catalog
- **Validation status:** source/static validated; environment execution pending
- **Source register:** `../sources/source-register.md`

## Today's Coffee

A barista and a customer may use different words for the same part of a drink: “double shot,” “two espresso shots,” or a shop-specific recipe code. The important skill is translating accurately without assuming the terms are identical in every context.

## Learning Objectives

The learner can:

1. Translate common IBM i native database terms into SQL-oriented terminology.
2. Explain where those mappings are useful and where they become oversimplifications.
3. Identify table, view, and index objects in a learner schema.
4. Explain the difference between data and metadata.
5. Avoid treating SQL terminology as a reason to dismiss existing DDS/native objects.

## Why This Matters

IBM i developers routinely move among decades of application history. One program may refer to a physical file and record format while another uses a table and row vocabulary. A database design discussion may use SQL terminology even though the underlying object is visible to IBM i as a `*FILE` object.

A developer who knows only one vocabulary can misunderstand tickets, source, job logs, CL commands, SQL, or a senior developer's explanation.

## Practical Translation Table

| IBM i / native term | SQL-oriented term | Useful mental mapping | Important caution |
|---|---|---|---|
| Library | Schema | Namespace/container for database objects | An IBM i library can contain many object types beyond SQL objects |
| Physical file | Table | Stores records/rows | Physical files can have IBM i-specific attributes and members |
| Member | Partition | A useful bridge when an SQL table is viewed through the traditional IBM i file/member model | Do not treat every native physical-file member as an SQL table partition; SQL commonly uses an alias to address a specific member of a multimember file |
| Field | Column | Named data element | Source and external-description context can add nuance |
| Record | Row | One occurrence of data | Record formats matter in native I/O |
| Logical file | View | Derived access to data | A logical file is not automatically equivalent to an SQL view |
| Keyed logical file | Index | Keyed access-path concept | Keyed LFs can include selection/omission and other behavior beyond a simple index |

The mapping is a bridge, not a declaration that the object types are interchangeable in every detail.

### Member and partition nuance

The `member` ↔ `partition` mapping is worth learning because IBM material uses it and because an SQL table appears through the traditional IBM i interface as a physical file with a member. When an SQL table is partitioned, the traditional file representation becomes multimember, with the SQL partitions represented as members.

That does **not** mean every member in every existing multimember physical file should be described as an SQL partition. Db2 for i also supports `CREATE ALIAS` so SQL can refer to a specific database-file member. In support and modernization work, first identify what object you actually have before choosing the SQL vocabulary.

## Object Model

```text
IBM i library / SQL schema
          |
          +-- table / physical file
          |       |
          |       +-- columns / fields
          |       +-- rows / records
          |       +-- member/partition relationship depends on object design
          |
          +-- view / logical access object
          |
          +-- index / keyed access path
          |
          +-- non-database IBM i objects may also exist in the library
```

## Metadata vs Data

**Data** is the business content stored in the table: product names, prices, quantities, and dates.

**Metadata** describes the database objects: table names, column names, data types, keys, constraints, and ownership/context.

The Db2 for IBM i extension's Schema Browser and IBM i catalog views let developers inspect metadata without reading every business row.

## Guided Exploration

After replacing `YOURSCHEMA`, inspect the learner schema:

```sql
select TABLE_SCHEMA,
       TABLE_NAME,
       TABLE_TYPE
from QSYS2.SYSTABLES
where TABLE_SCHEMA = 'YOURSCHEMA'
order by TABLE_TYPE, TABLE_NAME;
```

After Lesson 2.3 creates the catalog tables, use the browser to compare what VS Code shows with the SQL catalog result.

A zero-row result before the tables are created does not by itself prove the library/schema is invalid. It can simply mean that no table/view rows match the catalog query yet. Verify the learner library through connection context and the Schema Browser before drawing a conclusion.

## Legacy Recognition

You may see CL or RPG references such as:

```text
MYLIB/MYFILE
```

and SQL such as:

```sql
select *
from MYLIB.MYTABLE;
```

Both forms identify an IBM i library/schema and an object, but the naming rules and execution context are not identical. Learn to recognize both instead of forcing one syntax onto the other.

A specific member of a multimember physical file can also be exposed to SQL through an alias. That is an important support technique to recognize, but Module 2 does not require learners to redesign multimember files.

## IBM Bob-Assisted Activity

Use the Lesson 2.2 prompt. Challenge Bob if it says, without qualification, that:

- a library is exactly the same as a schema in all respects
- every physical-file member is automatically an SQL partition in every sense
- every logical file is a view
- every keyed logical file is just an index

Require evidence or a narrower statement.

## Hands-On Lab

1. Browse the assigned learner library with Code for IBM i.
2. Browse the same schema with the Db2 for IBM i extension.
3. Record three database objects and their types after the Module 2 objects exist.
4. Record one non-database object type if one exists in the library.
5. Explain which tool view was more useful for the question you were asking.

## Independent Task

Without Bob, complete this table for five objects in your learner environment:

| Object | IBM i type/description | SQL description if applicable | Safe to change? Why? |
|---|---|---|---|
| | | | |

## Common Mistakes

- Assuming “schema” means a separate server or database instance.
- Calling every `*FILE` object a table without checking what it represents.
- Calling every member an SQL partition without checking the object's design.
- Treating an SQL view as stored duplicate data.
- Assuming an index changes business data.
- Dismissing native terms as wrong instead of understanding the operational context.

## Pro Tips

- In code review, ask which object is actually referenced, not which vocabulary the author used.
- When modernizing, preserve a translation map between old and new names so support teams can trace behavior.
- Use catalog metadata and object attributes as evidence rather than relying on memory about an object's definition.

## Manager's Perspective

Terminology gaps are a real onboarding cost. A new developer should be able to sit in a production-support call where one person says “physical file,” another says “table,” and a third references a `*FILE` object without losing the thread.

## Knowledge Check

1. What is the useful SQL counterpart to an IBM i library?
2. Why is the mapping not exact in every context?
3. What is the relationship between an SQL table partition and the traditional IBM i member model?
4. Why is an arbitrary member of a multimember physical file not automatically the same design concept as an SQL partition?
5. What is the difference between a row and metadata about the table?
6. Why is a logical file not always equivalent to an SQL view?
7. What does an index primarily provide?
8. Why should modernization documentation preserve both old and new vocabulary?

## Completion Criteria

The learner can translate the core terminology, inspect schema metadata, explain at least two places where a simplistic one-to-one mapping can mislead, and describe the member/partition relationship without overgeneralizing it.

## Final Sip

Good developers learn the vocabulary of the system they inherited and the vocabulary of the system they are building. Translation is part of engineering.

## References

See M2-SUP-01, M2-SUP-04, M2-IBM-01, M2-IBM-06, and M2-IBM-07 in the source register.
