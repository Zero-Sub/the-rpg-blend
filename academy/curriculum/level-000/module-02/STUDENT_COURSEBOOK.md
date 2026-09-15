# Module 2 Student Coursebook

## Db2 for i and SQL-Centered Development

### What this module changes

Module 1 taught you how to make a controlled RPG change. Module 2 adds the database layer to that skill set.

By the end of the module you should be comfortable answering questions such as:

- Where does this application data live?
- How do IBM i object names relate to SQL names?
- What guarantees does the database enforce?
- What set of rows should this query return?
- Why did this join multiply rows?
- What exactly will this update change?
- Can this change be rolled back?
- Which database details should later application layers be allowed to see?

The goal is not memorizing SQL syntax. The goal is safe, explainable data engineering on IBM i.

---

# 1. Db2 for i and the IBM i data model

Db2 for i is the relational database integrated with IBM i. In real application estates you will encounter both SQL-created objects and traditional/native objects, and code may use SQL interfaces, native record-level access, or a mixture.

You need both vocabularies.

| Native IBM i term | Common SQL term | Important note |
|---|---|---|
| Library | Schema | Often the same organizational boundary from two viewpoints |
| Physical file | Table | Mapping is useful, but object history/attributes still matter |
| Field | Column | Data definition still controls type and meaning |
| Record | Row | SQL reasoning focuses on sets of rows |
| Logical file | View or access path concept | Do not assume every LF maps one-to-one to one SQL construct |
| Keyed logical file | Index/access-path concept | Recognize historical design before modernizing |
| Member | Partition/member context | Do not confuse with a source member |

## The member problem

IBM i uses the word **member** in more than one context.

A source physical file can contain source members: separate source units inside the same source physical file. A database physical file can also have data members. They share a word but play different roles.

When someone says “the member,” ask: **source member or data member?**

For new Academy relational examples, you normally work with SQL-defined tables and do not design around multiple data members. You still need to recognize multi-member files because enterprise IBM i applications may use them.

---

# 2. Tooling and context before SQL

The Academy SQL workflow starts in Visual Studio Code with the Db2 for IBM i extension and Code for IBM i connection context.

ACS Run SQL Scripts remains useful. It has strong database exploration and administration capabilities and may be the right supporting tool for a specific task. The Academy does not turn “VS Code first” into “ACS is wrong.”

## Before executing SQL

Verify:

1. IBM i host.
2. User/profile.
3. Git branch and script.
4. Schema/library.
5. Target table/view/object.
6. Whether the statement is read-only or changing something.
7. Expected affected rows for a data change.
8. Transaction/recovery plan.

A perfectly written update against the wrong schema is still a failure.

---

# 3. DDL: make invalid data harder to store

Data Definition Language defines database objects and their rules.

Module 2 focuses on tables and the integrity rules that application developers should understand:

- data types;
- `NULL` / `NOT NULL`;
- defaults;
- identity behavior;
- primary keys;
- foreign keys;
- unique constraints;
- check constraints;
- labels/comments.

## Data type decisions are design decisions

Use a type that represents the data you mean to store. Avoid “make everything VARCHAR” design. For money-like stored values in these examples, use fixed decimal types. For dates and timestamps, use date/time types rather than custom character encodings when you control the new design.

## NULL means absent

`NULL` does not mean zero. It does not mean blank. It does not compare like an ordinary value.

If a customer does not have an email address, `NULL` can represent “no value is present.” You test it with `IS NULL` or `IS NOT NULL`.

## Keys and constraints

A primary key identifies a row. A foreign key protects a relationship. Check constraints keep invalid state from being stored when the rule is truly a data-integrity rule.

Example distinction:

- `QUANTITY_AVAILABLE >= 0` is a strong persistence rule for this training model.
- “May the customer place this order?” depends on more application meaning and belongs later in Domain Services.

---

# 4. SELECT: ask for sets, not hidden loops

A SQL query describes the result you want.

Start by stating the set in plain language. Then write the query.

Typical pieces:

```sql
SELECT ...
  FROM ...
 WHERE ...
 ORDER BY ...
```

## Predict before you run

Before executing a learning query, write down the expected rows or at least the expected shape/count.

That habit turns query execution into a test rather than a guessing game.

## Boolean conditions

When `AND` and `OR` are mixed, use parentheses to make the intended logic obvious.

Do not rely on “I think SQL will read this left to right.”

## Functions and dates

Use selected scalar functions when they improve clarity: case conversion, trimming, conversion, `COALESCE`, numeric expressions, and date/time expressions.

Avoid turning every query into a function showcase. The function should serve the requirement.

---

# 5. Joins: relationships and cardinality

A join combines related rows. The difficult part is rarely typing `JOIN`. The difficult part is knowing what relationship you are creating.

Before running a join, ask:

- What is the key on each side?
- Is this one-to-one, one-to-many, or many-to-many?
- What should one result row represent?
- How many rows do I expect?

A one-to-many join is supposed to repeat data from the “one” side across multiple result rows. That is not automatically duplication. Accidental multiplication happens when the relationship or predicate is wrong.

## Outer joins

A left join is useful when you want rows from the left side even when no related row exists.

That makes it useful for questions such as “which customers have no orders?”

---

# 6. Aggregation: state the grain

Aggregation summarizes multiple rows.

Common functions include:

- `COUNT`
- `SUM`
- `AVG`
- `MIN`
- `MAX`

`GROUP BY` defines how rows are grouped. `HAVING` filters grouped results; `WHERE` filters input rows before grouping.

## Result grain

Before trusting an aggregate query, finish this sentence:

> One row in this result represents ______.

Examples:

- one customer;
- one product;
- one order;
- one customer/month pair.

If you cannot state the grain, the query is not ready for review.

## Reconcile to detail

For at least one group, compare the aggregate to the underlying detail rows. This catches join multiplication and grouping mistakes that still produce plausible numbers.

---

# 7. DML and transactions: syntax is the easy part

`INSERT`, `UPDATE`, and `DELETE` change data.

The Academy safety pattern is:

1. Verify context.
2. Write a read-only query identifying the intended rows.
3. Predict affected-row count.
4. Execute the change under the verified transaction setup.
5. Re-query the changed rows.
6. Roll back during the proof step when the lab requires it.
7. Verify restoration.
8. Repeat and commit only when the exercise explicitly requires persistence.

## Why rollback is not magic

Rollback behavior depends on the actual transaction/commitment-control context and database object configuration. On IBM i, journaling is part of that story.

Do not say “we can always roll it back.” Prove that the training setup supports the behavior you are relying on.

---

# 8. Views, CTEs, and the Data Service boundary

A view can provide a stable relational interface over underlying data. A CTE can make a complex query easier to understand in named steps.

These are useful tools, but architecture still matters.

## The Coffee Company boundary

Module 2 creates:

```text
RPGBA_CC.V_PRODUCT_SNAPSHOT
```

The snapshot exposes:

- product ID;
- unit price;
- quantity available;
- active-state fact.

Those are facts.

It does **not** answer:

- Is this order allowed?
- What discount applies?
- What business result code should be returned?

Those questions belong to Module 3 Domain Services.

## Embedded SQL demonstration

The training RPG example reads the snapshot and translates database outcomes:

- row found → `FOUND`;
- no row → `NOT_FOUND`;
- technical database failure → `DATA_ERROR`.

The caller does not receive raw `SQLCOD` as its contract.

That is the key architectural handoff from Module 2 to Module 3: **database mechanics stay behind the Data Service boundary; business behavior can now be built above it.**

---

# Independent challenge

Add product categories for reporting/catalog navigation.

Your solution must include relational integrity, a tested query, and a clear result grain. You may extend the Data Service interface if doing so creates a useful stable fact contract.

You may not move order eligibility, discounts, or approval logic into SQL to make the exercise easier.

Complete the implementation before asking Bob for review.

---

# Completion check

You are ready for Module 3 when you can explain, without Bob open:

- how the Coffee Company tables relate;
- how constraints protect the data;
- what `NULL` means in your examples;
- the grain/cardinality of your important queries;
- how you controlled and proved a data change;
- what `V_PRODUCT_SNAPSHOT` exposes;
- what it deliberately hides;
- why SQL/database diagnostics are not the Domain Service contract.