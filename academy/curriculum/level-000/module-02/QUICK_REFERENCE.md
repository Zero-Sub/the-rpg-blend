# Module 2 Quick Reference

## Context before SQL

Before DDL/DML verify:

```text
host → profile → branch/script → schema/library → object/table
     → expected rows → transaction/recovery plan
```

## Native and SQL terminology

| IBM i / native | SQL |
|---|---|
| Library | Schema |
| Physical file | Table |
| Field | Column |
| Record | Row |
| Logical file | View/access-path concept |
| Keyed logical file | Index/access-path concept |
| Member | Data member / partition context; do not confuse with source member |

## DDL essentials

```sql
CREATE TABLE schema.table_name (
    id        INTEGER NOT NULL,
    name      VARCHAR(80) NOT NULL,
    amount    DECIMAL(9,2) NOT NULL,
    active    CHAR(1) NOT NULL DEFAULT 'Y',
    CONSTRAINT pk_name PRIMARY KEY (id),
    CONSTRAINT ck_name CHECK (active IN ('Y', 'N'))
);
```

Common integrity tools:

- `NOT NULL`
- `DEFAULT`
- primary key
- foreign key
- unique constraint
- check constraint

## NULL

Use:

```sql
WHERE EMAIL IS NULL
WHERE EMAIL IS NOT NULL
```

Do not treat `NULL` as zero, blank, or an ordinary equality value.

## SELECT skeleton

```sql
SELECT column_a,
       expression AS alias
  FROM schema.table_name
 WHERE predicate
 ORDER BY column_a;
```

Mixed Boolean logic: use parentheses deliberately.

## Join skeleton

```sql
SELECT ...
  FROM parent P
  JOIN child C
    ON C.parent_id = P.parent_id;
```

Before running, answer:

1. What is the key relationship?
2. What should one result row represent?
3. What row count/cardinality do I expect?

Do not use `DISTINCT` as the first repair for unexpected duplicate-looking rows.

## Aggregation

```sql
SELECT customer_id,
       COUNT(*) AS order_count
  FROM orders
 GROUP BY customer_id
HAVING COUNT(*) >= 2;
```

- `WHERE` filters input rows.
- `GROUP BY` defines groups.
- Aggregate functions summarize groups.
- `HAVING` filters grouped results.

Always state the **result grain**.

## Safe DML pattern

```text
1. SELECT target rows
2. Predict affected rows
3. UPDATE/DELETE/INSERT
4. Verify changed state
5. ROLLBACK when the proof step requires it
6. Verify restoration
7. Repeat only when appropriate
8. COMMIT only when authorized
```

Rollback must be proven in the actual journaling/commitment-control/client context.

## Views and CTEs

View:

```sql
CREATE VIEW schema.v_name AS
SELECT ...
  FROM ...;
```

CTE:

```sql
WITH X AS (
    SELECT ...
      FROM ...
)
SELECT ...
  FROM X;
```

## Module 2 Data Service boundary

`V_PRODUCT_SNAPSHOT` exposes facts:

- product ID
- unit price
- quantity available
- active state

It does **not** expose decisions such as:

- order allowed/denied
- discount eligibility
- shipping classification
- domain approval code

## Data-access statuses

Training example:

```text
FOUND
NOT_FOUND
DATA_ERROR
```

Raw SQL diagnostics remain inside the data-access implementation/support path.

## Bob review checklist

Before accepting Bob output:

- Does the referenced schema/object actually exist?
- Are column names/types correct?
- Is result grain/cardinality correct?
- Are `NULL` cases covered?
- Could the statement change more data than intended?
- Are transaction assumptions verified?
- Did business logic leak into the Data Service?
- What evidence proves the answer?

## Module 3 handoff

Module 3 should receive **facts through a stable data boundary**, then make business decisions in Domain Services.