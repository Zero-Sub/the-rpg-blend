# Lesson 3.6 — Embedded SQL Cursors

## Metadata

- **Estimated time:** 100 minutes
- **Required source:** `06_sql_low_inventory.pgm.sqlrpgle`
- **Validation status:** source reviewed; execution pending

## Learning Objectives

The learner can:

1. Explain why a cursor is appropriate for a multi-row embedded query.
2. Describe DECLARE, OPEN, FETCH, and CLOSE responsibilities.
3. Move SQL row values into RPG host variables.
4. Terminate the fetch loop on no-data rather than process stale values.
5. Preserve deterministic result ordering when the exercise depends on it.
6. Compare cursor processing with native keyed loops.

## Cursor Lifecycle

```text
DECLARE cursor
      ↓
OPEN cursor
      ↓
FETCH row → process → FETCH row → ...
      ↓
no data
      ↓
CLOSE cursor
```

A declared cursor represents a query. Opening it prepares the result for fetching. Each fetch moves values into host variables. End-of-data is an expected condition, not a reason to keep processing the previous row.

## Low-Inventory Query

The Module 3 cursor uses the Module 2 model:

```sql
select P.PRODUCT_ID,
       P.PRODUCT_NAME,
       I.QTY_ON_HAND,
       I.REORDER_POINT
  from YOURSCHEMA.PRODUCT P
  join YOURSCHEMA.INVENTORY I
    on I.PRODUCT_ID = P.PRODUCT_ID
 where I.QTY_ON_HAND <= I.REORDER_POINT
 order by P.PRODUCT_ID
```

The deterministic Module 2 seed is expected to return two rows, but actual Module 3 runtime evidence must be reconciled against the validated prerequisite state.

## Loop Discipline

A good beginner loop makes the fetch/test order obvious:

1. OPEN
2. FETCH
3. while success, process current values
4. FETCH next
5. stop on no-data
6. handle other SQL errors distinctly
7. CLOSE

A loop that processes host variables before checking whether FETCH succeeded can duplicate or display stale data.

## Cursor vs Native Loop

A native `SETLL`/`READE` loop navigates a keyed access path and receives records. The SQL cursor defines a relational result set first and then fetches its rows. Both can be valid. The SQL query can combine/filter tables before RPG processes each returned row.

## Bob-Assisted Activity

Ask Bob to trace the fetch loop and identify:

- first fetch location
- condition checked after each fetch
- stale-value risk
- close path
- what the SQL query does before RPG sees a row

Verify all condition claims against actual SQLSTATE/SQLCODE behavior during validation.

## Independent Task

Without Bob, modify the query predicate in a disposable copy to select active coffee products and predict the ordered result count from the Module 2 seed data. Do not change stored data.

## Common Mistakes

- Using SELECT INTO for a many-row query.
- Forgetting the first FETCH.
- Processing host variables after a no-data FETCH.
- Forgetting CLOSE on the normal path.
- Assuming cursor order without ORDER BY.
- Hiding an SQL error by treating every nonzero status as end-of-data.

## Completion Criteria

The learner can compile and run a cursor example, explain each lifecycle step, and prove the loop stops correctly without stale-row processing.