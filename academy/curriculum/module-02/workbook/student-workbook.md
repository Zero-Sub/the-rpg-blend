# The RPG Blend Academy — Module 2 Learner Workbook

## Db2 for i + SQL

**Roadmap position:** Module 2 of 8  
**Prerequisites:** Module 0 — Getting Started; Module 1 — RPG Fundamentals  
**Primary tools:** Visual Studio Code, Code for IBM i, Db2 for IBM i extension  
**Training system:** PUB400 learner-owned schema/library  
**Status:** author-review build; execution validation pending

This workbook is the learner's evidence record. Complete it while working through the lesson manuscripts and SQL assets. Do not record passwords, tokens, private keys, customer data, PHI, or production data.

## Module Outcomes

By the end of the module, I can:

- [ ] Explain Db2 for i and its relationship to IBM i and SQL.
- [ ] Translate common native IBM i and SQL database terminology.
- [ ] Verify a safe learner schema before running SQL.
- [ ] Create tables with intentional data types, keys, defaults, and constraints.
- [ ] Query data with SELECT, WHERE, ORDER BY, expressions, and NULL handling.
- [ ] Join related tables and explain expected cardinality.
- [ ] Aggregate rows with GROUP BY and HAVING.
- [ ] Perform controlled INSERT, UPDATE, and DELETE work in a learner schema.
- [ ] Explain views and indexes at an introductory level.
- [ ] Use IBM Bob for explanation/review while independently validating its output.
- [ ] Complete the Coffee Catalog capstone without relying on Bob for the solution.

---

# Environment Record

| Item | My value |
|---|---|
| Connection nickname | |
| PUB400 user profile | |
| Learner library/schema | |
| Code for IBM i version | |
| Db2 for IBM i extension version | |
| Date verified | |

### Safety statement

In one sentence, explain why this schema is appropriate for Module 2:

> 

---

# Lesson 2.1 — Db2 for i Is Part of the Platform

## I can

- [ ] Explain Db2 for i.
- [ ] Distinguish the database manager from SQL.
- [ ] Explain why the database is part of the IBM i application environment.
- [ ] Run a read-only metadata query.

## Evidence

Read-only query used:

```sql

```

Rows returned: __________

What did the result prove?

> 

What did it **not** prove?

> 

## Bob review

Prompt:

> 

Verified fact:

> 

Assumption:

> 

Suggestion accepted/corrected/rejected:

> 

Evidence:

> 

Risk Bob missed:

> 

## Independent check

Without Bob, explain IBM i, Db2 for i, SQL, and a schema/library in five sentences or fewer:

> 

---

# Lesson 2.2 — Native and SQL Terminology

Complete the translation table in your own words.

| IBM i / native | SQL-oriented | Where the comparison can mislead |
|---|---|---|
| Library | | |
| Physical file | | |
| Member | | |
| Field | | |
| Record | | |
| Logical file | | |
| Keyed logical file | | |

## Environment observation

| Object | What the tool shows | SQL description if applicable | Safe for me to change? |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

What is the difference between **data** and **metadata**?

> 

---

# Lesson 2.3 — Build the Coffee Catalog Schema

## Before execution

My schema is: ____________________

Objects I expect to create:

- [ ] CATEGORY
- [ ] PRODUCT
- [ ] INVENTORY

## DDL review

Choose one table and explain these choices:

| Decision | My explanation |
|---|---|
| Primary key | |
| Character lengths | |
| Decimal precision | |
| Nullable column(s) | |
| Default(s) | |
| CHECK rule(s) | |
| Foreign key(s) | |

## Execution evidence

| Table | CREATE succeeded? | Metadata verification |
|---|---|---|
| CATEGORY | | |
| PRODUCT | | |
| INVENTORY | | |

## Independent definition task

Propose one new column for a scratch copy of the model.

Column name: ____________________  
Data type: ____________________  
Nullable? ____________________  
Default? ____________________

Business justification:

> 

---

# Lesson 2.4 — Keys, Constraints, Defaults, and NULL

## Base data counts

| Table | Expected | Actual |
|---|---:|---:|
| CATEGORY | 3 | |
| PRODUCT | 5 | |
| INVENTORY | 5 | |

Do not continue until expected and actual counts are reconciled.

## Constraint tests

| Test | Rule tested | Expected result | Actual result | Evidence/message |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| Independent | | | | |

## NULL check

In your own words, NULL means:

> 

Why is blank different?

> 

Correct NULL predicate:

```sql

```

---

# Lesson 2.5 — SELECT: Ask a Precise Question

For every exercise, predict first.

## Query A — explicit columns

Business question:

> 

Expected rows: __________

Actual rows: __________

What did `ORDER BY` guarantee?

> 

## Query B — filter

WHERE predicate:

```sql

```

Plain-language meaning:

> 

## Query C — expression

Expression:

```sql

```

Does it modify stored PRICE values? Why or why not?

> 

## Query D — independent task

Return active products below 16.00 using only SKU, product name, and price.

Predicted products:

> 

My SQL:

```sql

```

Actual result:

> 

Bob used on independent task? **No**: ________

---

# Lesson 2.6 — Joins

## Relationship map

Fill in the keys:

```text
CATEGORY.____________  1 ---- many PRODUCT.____________
PRODUCT.____________   1 ---- 1    INVENTORY.____________
```

## Join prediction record

| Query | Relationship | Expected rows | Actual rows |
|---|---|---:|---:|
| PRODUCT + CATEGORY | | | |
| PRODUCT + INVENTORY | | | |
| CATEGORY + PRODUCT + INVENTORY | | | |

If expected and actual differ, what did you inspect first?

> 

## Independent reorder query

Expected matching products:

> 

My SQL:

```sql

```

Actual rows: __________

Why would adding `DISTINCT` be the wrong first response to unexplained row multiplication?

> 

---

# Lesson 2.7 — Aggregation

Complete before running each query:

| Query | One result row represents... | Expected result rows | Actual |
|---|---|---:|---:|
| Whole-table metrics | | | |
| Products by category | | | |
| HAVING example | | | |
| Inventory totals by category | | | |

## WHERE vs HAVING

`WHERE` filters:

> 

`HAVING` filters:

> 

## Independent inventory-pressure query

Manual expected totals:

| Category | Total quantity |
|---|---:|
| Coffee | |
| Equipment | |
| Merchandise | |

My SQL returning only categories below 30:

```sql

```

Actual result:

> 

---

# Lesson 2.8 — Safe Data Changes

## Change Gate

Before running DML, fill this out:

| Question | My answer |
|---|---|
| Which host? | |
| Which profile? | |
| Which schema? | |
| Which table? | |
| Which disposable key/SKU? | |
| Expected rows to change? | |
| Preview query? | |
| Verification query? | |
| Cleanup plan? | |

## Disposable-row evidence

| Step | Expected | Actual/evidence |
|---|---|---|
| Key unused | 0 rows | |
| INSERT | 1 row created | |
| Post-insert verification | 1 row | |
| UPDATE preview | 1 row | |
| UPDATE | intended row only | |
| Post-update verification | intended values | |
| DELETE preview | 1 row | |
| DELETE | intended row only | |
| Final verification | 0 rows | |

What should you do if the UPDATE preview returns two rows?

> 

Why is `ROLLBACK` not taught as a universal rescue button in this lesson?

> 

---

# Lesson 2.9 — Views and Indexes

## View

View name: ____________________

What logic does it centralize?

> 

Where is the base data stored?

> 

What does the view **not** guarantee?

> 

## Index

Index name: ____________________

Column(s): ____________________

What access pattern might it support?

> 

Why is the five-row lab not proof of a performance improvement?

> 

What evidence would be stronger?

> 

---

# Lesson 2.10 — Capstone Evidence

Complete `../lab/module-02-lab.md` and attach or link the SQL source used.

## Capstone summary

What did you create?

> 

What did you query?

> 

What did you change?

> 

What did you verify?

> 

What did Bob help review?

> 

What did you complete independently?

> 

## Independent defense checklist

- [ ] I can explain the three-table relationship.
- [ ] I can explain one integrity constraint.
- [ ] I can explain a join and expected cardinality.
- [ ] I can explain the grain of a grouped query.
- [ ] I can explain the preview → change → verify workflow.
- [ ] I can explain a view.
- [ ] I can explain what an index does without claiming unsupported performance improvement.

---

# Module Reflection

1. What changed most in your mental model of IBM i databases?

> 

2. Which SQL mistake now seems most dangerous?

> 

3. Which safety habit will you carry into Module 3?

> 

4. What Bob suggestion did you reject or correct, and why?

> 

5. What do you still need to practice before working with application data?

> 

## Completion Signoff

Learner: ______________________________  
Facilitator/reviewer: ______________________________  
Date: ______________________________

- [ ] Assessment ≥ 80%
- [ ] Capstone complete
- [ ] Cleanup verified
- [ ] No critical safety failure
- [ ] Independent explanation demonstrated
