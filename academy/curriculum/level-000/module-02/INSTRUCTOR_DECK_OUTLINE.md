# Module 2 Instructor Deck Outline

This is the content outline for a future branded instructor deck. It is not the finished presentation.

## Slide 1 — Module 2

**Db2 for i and SQL-Centered Development**

Subtitle: From RPG changes to safe data engineering.

## Slide 2 — Where Module 2 fits

Visual progression:

```text
Module 0 — IBM i orientation
        ↓
Module 1 — Modern RPG fundamentals
        ↓
Module 2 — Db2 for i + Data Services
        ↓
Module 3 — Domain Services + ILE reuse
```

Speaker point: Module 2 exists to make Module 3 possible without teaching business logic directly against raw database rows.

## Slide 3 — The three questions

1. What does the data mean and where does it live?
2. How do we query/change it safely?
3. What database detail should the rest of the application depend on?

## Slide 4 — Db2 for i mental model

Key points:

- integrated with IBM i;
- SQL and native interfaces coexist;
- SQL-centered does not mean legacy/native recognition disappears.

## Slide 5 — Native ↔ SQL terminology

Use a two-column mapping visual:

library/schema; physical file/table; field/column; record/row; logical file/view/access path; keyed logical file/index/access path.

## Slide 6 — “Member” needs context

Contrast:

- source physical file member;
- database physical-file member/partition context.

Use the spreadsheet-tab analogy only as a teaching aid and label it an analogy.

## Slide 7 — Modern SQL workflow

VS Code + Db2 for IBM i extension as primary workflow.

ACS Run SQL Scripts as supporting tool where appropriate.

## Slide 8 — Context before SQL

Large visual:

```text
host → profile → branch → script → schema → object → rows → recovery
```

## Slide 9 — Coffee Company relational model

Show CUSTOMER, PRODUCT, ORDER_HEADER, ORDER_ITEM and the key relationships.

## Slide 10 — DDL is application design

Data types, nullability, defaults, keys, foreign keys, check constraints.

Message: make invalid states harder to store.

## Slide 11 — Database integrity vs domain rules

Two columns:

**Database integrity**: nonnegative stored quantity, valid foreign key, allowed status values.

**Domain behavior**: can order, discount, approval, shipping classification.

## Slide 12 — NULL is not blank or zero

Show `IS NULL` / `IS NOT NULL` and a missing-email example.

## Slide 13 — Think in sets

Show requirement → expected set → SQL → actual set → explanation.

## Slide 14 — Boolean grouping

Use a simple `AND`/`OR` example with parentheses.

## Slide 15 — Joins are about relationships

Key questions:

- what are the keys?
- what is the cardinality?
- what does one result row mean?

## Slide 16 — Don’t fix joins with DISTINCT first

Show wrong join → multiplied rows → diagnosis → correct predicate.

## Slide 17 — Aggregation and result grain

Phrase on screen:

> One row represents __________.

## Slide 18 — WHERE vs HAVING

Input-row filtering versus grouped-result filtering.

## Slide 19 — DML safety loop

SELECT → predict → change → verify → rollback → prove restoration → controlled commit.

## Slide 20 — Rollback is not magic

Journaling + commitment-control context + client settings must be known.

## Slide 21 — Views and CTEs

Use them to shape data and organize queries; do not hide domain logic in SQL.

## Slide 22 — `V_PRODUCT_SNAPSHOT`

Show columns:

- PRODUCT_ID
- UNIT_PRICE
- QUANTITY_AVAILABLE
- ACTIVE

Label: **facts only**.

## Slide 23 — What the view does NOT decide

Cross out:

- ORDER_ALLOWED
- DISCOUNT
- SHIPPING_CLASS
- APPROVAL_CODE

## Slide 24 — Data Service boundary

```text
Module 3 Domain Services
          ↓
Application-facing data contract
          ↓
Data Service / Db2 for i
```

## Slide 25 — Embedded SQL result translation

`FOUND` / `NOT_FOUND` / `DATA_ERROR`

Raw SQL diagnostics stay behind the boundary.

## Slide 26 — IBM Bob in Module 2

Good uses:

- explain schema/query;
- identify dependencies;
- review DDL/query risks;
- suggest tests;
- review data-boundary leakage.

## Slide 27 — What Bob cannot prove

Context, actual schema, row counts, transaction behavior, runtime results, human architecture decision.

## Slide 28 — Independent challenge

Add product categories without moving order logic into SQL.

## Slide 29 — Evidence packet

Environment, DDL, queries, cardinality, aggregate reconciliation, transaction proof, data contract, Git diff, Bob dispositions.

## Slide 30 — Ready for Module 3

Final message:

> Module 2 gives us reliable product facts. Module 3 turns those facts into reusable business behavior.