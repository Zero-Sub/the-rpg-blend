# Module 2 Slide Source — Db2 for i + SQL

**Purpose:** canonical presentation outline for later branded PPTX generation  
**Source authority:** canonical Module 2 lessons; this file must not override lesson technical content  
**Status:** source/static validated presentation source; regenerate after target execution validation

Use The RPG Blend Academy branding and the current module roadmap. Keep code readable on screen; split long SQL across multiple slides rather than shrinking type.

## Slide 1 — Title

**Module 2 — Db2 for i + SQL**  
From RPG fluency to a reliable database mental model

## Slide 2 — Where we are

Roadmap:

- 0 Getting Started — Built
- 1 RPG Fundamentals — Built
- **2 Db2 for i + SQL — Current**
- 3 Files + Data Access — Next
- 4 Procedures + ILE
- 5 Debug + Test
- 6 Git + Team Delivery
- 7 Architecture + Capstone

## Slide 3 — Module promise

By the end, learners can:

- explain Db2 for i
- build safe training tables
- query, join, and summarize data
- make controlled training changes
- prove the result

## Slide 4 — Safety boundary

Allowed:

- PUB400 learner profile
- private learner library/schema
- fictional Academy data
- Module 2 objects

Not allowed:

- production
- customer/PHI data
- other users' libraries
- secrets in screenshots/prompts
- blind AI-generated SQL

## Slide 5 — Today's coffee

Coffee hook: define the system before changing the recipe.

Teaching point: database skill begins with target awareness.

---

# Lesson 2.1 — Db2 for i Is Part of the Platform

## Slide 6 — IBM i + Db2 for i

Visual:

```text
IBM Power
   ↓
IBM i
   ↓
Db2 for i + applications + services
```

Key point: Db2 for i is integrated with IBM i.

## Slide 7 — Db2 for i ≠ SQL

- Db2 for i: database manager
- SQL: language/interface
- RPG, SQL, services, and tools can all interact with the database

## Slide 8 — Developer path

```text
VS Code → Db2 for IBM i extension → IBM i job → Db2 for i → schema objects
```

## Slide 9 — Read-only first look

Show bounded `QSYS2.SYSTABLES` metadata query.

Teaching note: zero table rows before the catalog is created can be legitimate; verify schema/context separately.

## Slide 10 — Evidence gate

Ask before Run:

1. Which host?
2. Which profile?
3. Which schema?
4. Read or change?
5. Expected result?

---

# Lesson 2.2 — Two Vocabularies

## Slide 11 — Native and SQL terms

Two-column mapping:

- library ↔ schema
- physical file ↔ table
- member ↔ partition **in the appropriate table/partition context**
- field ↔ column
- record ↔ row
- logical file ↔ view
- keyed logical file ↔ index

Teaching warning: mappings are bridges, not universal object identity. A specific member of a native multimember database file can be addressed from SQL through an alias.

## Slide 12 — The warning label

**Useful mapping, not universal identity.**

Explain library, member/partition, and logical-file nuance.

## Slide 13 — Data vs metadata

- data: business rows
- metadata: object definitions, names, columns, types, keys

## Slide 14 — Tool comparison

Code for IBM i Object Browser vs Db2 for IBM i Schema Browser.

Question: which tool answers which question?

---

# Lesson 2.3 — DDL

## Slide 15 — DDL defines the structure

Focus actions:

- CREATE TABLE
- later CREATE VIEW / INDEX

## Slide 16 — Coffee Catalog model

```text
CATEGORY 1 ───< PRODUCT 1 ─── 0..1 INVENTORY
```

Teaching note:

- every INVENTORY row must reference a PRODUCT
- INVENTORY primary key allows at most one row per PRODUCT
- the DDL does not require every PRODUCT to have INVENTORY
- the seed data intentionally has one INVENTORY row for every PRODUCT

## Slide 17 — CATEGORY DDL

Show the short complete CATEGORY definition.

## Slide 18 — Read DDL as decisions

- identifier
- name length
- nullability
- default
- key
- unique rule
- check rule

## Slide 19 — Core data types

- INTEGER
- VARCHAR / CHAR
- DECIMAL
- DATE
- TIMESTAMP

## Slide 20 — Exact numbers matter

`DECIMAL(9,2)` example and business-limit question.

---

# Lesson 2.4 — Integrity

## Slide 21 — Keys

- primary
- unique
- foreign

## Slide 22 — Referential integrity

PRODUCT category must exist in CATEGORY.

## Slide 23 — NULL is absence

Not blank. Not zero. Not the word NULL.

Show `IS NULL`.

## Slide 24 — Default vs rule

`DEFAULT 'Y'` vs `CHECK (ACTIVE in ('Y','N'))`.

## Slide 25 — Negative testing

Expected rejection is evidence when the statement reaches the intended constraint.

---

# Lesson 2.5 — SELECT

## Slide 26 — Ask a precise question

SELECT / FROM / WHERE / ORDER BY.

## Slide 27 — Explicit columns

Prefer known required columns over habitual `SELECT *`.

## Slide 28 — Predicates in plain English

Translate WHERE into a business sentence.

## Slide 29 — Expressions and aliases

Calculated result ≠ stored update.

## Slide 30 — Ordering and limits

- ORDER BY for deterministic requested ordering
- FETCH FIRST for bounded exploration

---

# Lesson 2.6 — Joins

## Slide 31 — Relationship first

Draw keys before writing JOIN.

Distinguish:

- cardinality enforced by constraints
- cardinality observed in the current seed data

## Slide 32 — Inner join

Show PRODUCT → CATEGORY SQL.

## Slide 33 — Cardinality

Predict rows before execution.

For PRODUCT → INVENTORY, explain why the schema permits 0..1 INVENTORY row per product even though the seed data currently has one for each.

## Slide 34 — Missing predicate

5 products × 3 categories = 15 unrelated combinations in base dataset.

## Slide 35 — DISTINCT is not a repair kit

Investigate relationship, uniqueness, optionality, and source data first.

---

# Lesson 2.7 — Aggregation

## Slide 36 — From rows to metrics

COUNT / SUM / AVG / MIN / MAX.

## Slide 37 — Result grain

“One result row represents ______.”

## Slide 38 — GROUP BY

One result row per category example.

## Slide 39 — WHERE vs HAVING

Rows first; groups later.

## Slide 40 — Validate detail before totals

Wrong joins create believable wrong totals.

---

# Lesson 2.8 — Safe Changes

## Slide 41 — Risk changes here

SELECT is read-only for the Module 2 examples. INSERT/UPDATE/DELETE change database state.

Teaching note: do not turn that sentence into a universal claim about every possible SQL statement or function. The point is the risk boundary in this course.

## Slide 42 — Safe DML loop

```text
Verify → Preview → Predict → Change → Verify → Cleanup
```

Apply preview-before-change to both UPDATE and DELETE.

## Slide 43 — Disposable row

Use product 2999 / lab SKU example or learner equivalent.

## Slide 44 — Preview the exact predicate

Expected row count = 1 before UPDATE **and** before DELETE.

## Slide 45 — Valid SQL can be unsafe

Show commented no-WHERE UPDATE as **DO NOT RUN**.

## Slide 46 — Transactions are next

Module 3 adds:

- native I/O
- embedded SQL
- locking
- journaling
- commitment control
- COMMIT / ROLLBACK
- application error handling

---

# Lesson 2.9 — Views and Indexes

## Slide 47 — View = named relational interface

Show `ACTIVE_PRODUCT_SUMMARY` architecture.

## Slide 48 — What the view centralizes

- joins
- active filter
- selected columns

Not a separate duplicate table by default.

## Slide 49 — Index = access path tool

Training index on PRODUCT(CATEGORY_ID).

## Slide 50 — No fake benchmark

Five rows cannot prove production performance value.

Need workload + volume + access-plan/measurement evidence.

---

# Capstone

## Slide 51 — Build and prove

Learner must:

- verify environment
- build schema
- seed data
- query
- join
- aggregate
- negative-test constraints
- perform disposable DML
- create view/index
- clean up

## Slide 52 — Bob rules

Allowed:

- explain
- review
- diagnose
- suggest tests

Not allowed:

- full capstone solution
- blind execution
- unverified claims

## Slide 53 — Evidence record

Expected vs actual:

- target
- row count
- diagnostics
- changes
- cleanup
- Bob disposition

## Slide 54 — Independent defense

Explain without Bob:

- relationships
- constraint
- schema-enforced vs observed cardinality
- join cardinality
- aggregate grain
- DML safety
- view/index distinction

## Slide 55 — Completion gate

- assessment ≥ 80%
- capstone works
- cleanup works
- no critical safety failure
- learner explains the solution

## Slide 56 — Where we go next

**Module 3 — Files + Data Access**

Native I/O, embedded SQL, transactions, locking, errors.

## Slide 57 — Final Sip

A fast query is useful. A correct, controlled, explainable query is professional.

## Presentation Production Notes

- Use original Academy diagrams, never screenshots copied from COMMON/IBM decks.
- Current tool screenshots must be captured from the validated extension version.
- Record the actual PUB400 connection settings used by the delivery; current validation documentation shows SSH port 2222 but that must be rechecked before release.
- Keep SQL at readable presentation size; use progressive reveals rather than dense code walls.
- Add speaker notes from `instructor-notes/instructor-guide.md` during PPTX generation.
- Regenerate slides after technical validation if query output, environment facts, or UI labels change.
