# The RPG Blend Academy — Module 2 Learner Workbook

## Db2 for i + SQL

**Roadmap position:** Module 2 of 8  
**Prerequisites:** Module 0 — Getting Started; Module 1 — RPG Fundamentals  
**Primary tools:** Visual Studio Code, Code for IBM i, Db2 for IBM i extension  
**Training system:** PUB400 learner-owned schema/library  
**Status:** author-review build; execution validation pending

Use this workbook as your evidence record while completing the canonical Module 2 lessons. Never record passwords, tokens, private keys, customer data, PHI, or production data.

## Module Outcomes

- [ ] Explain Db2 for i and its relationship to IBM i and SQL.
- [ ] Translate native IBM i and SQL database terminology.
- [ ] Verify the correct schema before running SQL.
- [ ] Create tables with intentional data types, keys, defaults, and constraints.
- [ ] Query with SELECT, WHERE, ORDER BY, expressions, and NULL handling.
- [ ] Join related tables and explain expected cardinality.
- [ ] Aggregate with GROUP BY and HAVING.
- [ ] Perform controlled INSERT, UPDATE, and DELETE work.
- [ ] Explain views and indexes at an introductory level.
- [ ] Use IBM Bob for review while independently validating its output.
- [ ] Complete the Coffee Catalog capstone independently.

## Environment Record

| Item | My value |
|---|---|
| Connection nickname | |
| PUB400 user profile | |
| Learner library/schema | |
| Code for IBM i version | |
| Db2 for IBM i extension version | |
| Date verified | |

**Why is this schema appropriate for Module 2?**

>

---

# Lesson 2.1 — Db2 for i Is Part of the Platform

## Evidence

Read-only metadata query:

```sql

```

Rows returned: __________

What did the result prove?

>

What did it fail to prove?

>

## Bob Review

| Item | My record |
|---|---|
| Prompt | |
| Verified fact | |
| Assumption | |
| Suggestion accepted/corrected/rejected | |
| Evidence for decision | |
| Risk Bob missed | |

## Independent Check

Explain IBM i, Db2 for i, SQL, and a schema/library in five sentences or fewer without Bob.

>

---

# Lesson 2.2 — Native and SQL Terminology

| IBM i / native | SQL-oriented | Where the comparison can mislead |
|---|---|---|
| Library | | |
| Physical file | | |
| Member | | |
| Field | | |
| Record | | |
| Logical file | | |
| Keyed logical file | | |

## Environment Observation

| Object | What the tool shows | SQL description if applicable | Safe for me to change? |
|---|---|---|---|
| | | | |
| | | | |
| | | | |

What is the difference between **data** and **metadata**?

>

---

# Lesson 2.3 — Build the Coffee Catalog Schema

My schema: ____________________

Expected objects:

- [ ] CATEGORY
- [ ] PRODUCT
- [ ] INVENTORY

Choose one table and explain its design.

| Decision | My explanation |
|---|---|
| Primary key | |
| Character lengths | |
| Decimal precision | |
| Nullable column(s) | |
| Default(s) | |
| CHECK rule(s) | |
| Foreign key(s) | |

## Execution Evidence

| Table | CREATE succeeded? | Metadata verification |
|---|---|---|
| CATEGORY | | |
| PRODUCT | | |
| INVENTORY | | |

## Independent Definition Task

Column name: ____________________  
Data type: ____________________  
Nullable? ____________________  
Default? ____________________

Business justification:

>

---

# Lesson 2.4 — Keys, Constraints, Defaults, and NULL

## Base Counts

| Table | Expected | Actual |
|---|---:|---:|
| CATEGORY | 3 | |
| PRODUCT | 5 | |
| INVENTORY | 5 | |

Do not continue until expected and actual counts are reconciled.

## Constraint Tests

| Test | Rule tested | Expected | Actual | Evidence/message |
|---|---|---|---|---|
| 1 | | | | |
| 2 | | | | |
| 3 | | | | |
| Independent | | | | |

In your own words, NULL means:

>

Why is blank different?

>

Correct NULL predicate:

```sql

```

---

# Lesson 2.5 — SELECT: Ask a Precise Question

## Query Record

| Query | Business question | Expected rows | Actual rows |
|---|---|---:|---:|
| Explicit columns | | | |
| Price filter | | | |
| Expression | | | |
| NULL test | | | |
| Bounded result | | | |

What does `ORDER BY` guarantee?

>

Does a SELECT expression automatically modify stored data? Explain.

>

## Independent Task

Return active products below 16.00 using only SKU, product name, and price.

Predicted products:

>

```sql

```

Actual result:

>

Bob used on independent task? **No:** ________

---

# Lesson 2.6 — Joins

Complete the relationship map.

```text
CATEGORY.____________  1 ---- many PRODUCT.____________
PRODUCT.____________   1 ---- 1    INVENTORY.____________
```

| Join | Expected rows | Actual rows | Relationship evidence |
|---|---:|---:|---|
| PRODUCT + CATEGORY | | | |
| PRODUCT + INVENTORY | | | |
| Three-table join | | | |

If expected and actual row counts differ, what should you inspect first?

>

## Independent Reorder Query

Predicted products:

>

```sql

```

Actual rows: __________

Why is `DISTINCT` the wrong first response to unexplained row multiplication?

>

---

# Lesson 2.7 — Aggregation

| Query | One result row represents... | Expected rows | Actual rows |
|---|---|---:|---:|
| Whole-table metrics | | | |
| Products by category | | | |
| HAVING example | | | |
| Inventory totals | | | |

`WHERE` filters:

>

`HAVING` filters:

>

## Independent Inventory-Pressure Query

| Category | Manual total quantity |
|---|---:|
| Coffee | |
| Equipment | |
| Merchandise | |

```sql

```

Actual result:

>

---

# Lesson 2.8 — Safe Data Changes

## Change Gate

| Question | My answer |
|---|---|
| Which host? | |
| Which profile? | |
| Which schema? | |
| Which table? | |
| Disposable key/SKU? | |
| Expected rows to change? | |
| Preview query? | |
| Verification query? | |
| Cleanup plan? | |

## Disposable-Row Evidence

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

What should happen if the UPDATE preview returns two rows?

>

Why is `ROLLBACK` not taught as a universal rescue button here?

>

---

# Lesson 2.9 — Views and Indexes

## View

View name: ____________________

What logic does it centralize?

>

Where is the base data stored?

>

What does the view not guarantee?

>

## Index

Index name: ____________________  
Column(s): ____________________

What access pattern might it support?

>

Why is a five-row lab not proof of performance improvement?

>

What stronger evidence would you want?

>

---

# Lesson 2.10 — Capstone Evidence

Complete `../lab/module-02-lab.md` and attach or link the SQL source used.

| Question | My summary |
|---|---|
| What did I create? | |
| What did I query? | |
| What did I change? | |
| What did I verify? | |
| What did Bob review? | |
| What did I complete independently? | |

## Independent Defense

- [ ] I can explain the three-table relationship.
- [ ] I can explain one integrity constraint.
- [ ] I can explain a join and expected cardinality.
- [ ] I can explain the grain of a grouped query.
- [ ] I can explain the preview → change → verify workflow.
- [ ] I can explain a view.
- [ ] I can explain an index without making an unsupported performance claim.

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
