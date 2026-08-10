# Lesson 2.7 — Aggregation: Turn Rows into Information

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.7
- **Estimated time:** 75 minutes
- **Prerequisites:** Lessons 2.5–2.6
- **Required file:** `../code/sql/05_aggregation_practice.sql`
- **Validation status:** source reviewed; execution validation pending

## Today's Coffee

Individual receipts tell you what each customer bought. A daily summary tells you how many drinks sold, average ticket size, and which category mattered most. Aggregation changes the level of the question.

## Learning Objectives

The learner can:

1. Use `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`.
2. Explain the difference between row-level detail and grouped results.
3. Use `GROUP BY` to define the grouping level.
4. Use `HAVING` to filter groups.
5. Distinguish `WHERE` from `HAVING`.
6. Combine joins and aggregation without losing track of row meaning.
7. Predict grouped results before execution.

## Why This Matters

Business applications rarely stop at individual rows. Teams need counts, totals, averages, exceptions, and summaries. Aggregation is one of SQL's biggest advantages over manually looping through rows in application code.

It is also easy to produce misleading summaries if the join or grouping level is wrong.

## Aggregate Functions

### COUNT

```sql
select count(*) as PRODUCT_COUNT
from YOURSCHEMA.PRODUCT;
```

Counts rows in the result set.

### MIN and MAX

```sql
select min(PRICE) as LOWEST_PRICE,
       max(PRICE) as HIGHEST_PRICE
from YOURSCHEMA.PRODUCT;
```

### AVG

```sql
select decimal(avg(PRICE), 9, 2) as AVERAGE_PRICE
from YOURSCHEMA.PRODUCT;
```

The `DECIMAL` expression makes the displayed precision intentional for the lesson.

### SUM

```sql
select sum(QTY_ON_HAND) as TOTAL_ON_HAND
from YOURSCHEMA.INVENTORY;
```

## Grouping

To summarize by category, define the grouping level:

```sql
select C.CATEGORY_NAME,
       count(*) as PRODUCT_COUNT
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID
group by C.CATEGORY_NAME
order by C.CATEGORY_NAME;
```

The result has one row per category represented by the joined product data, not one row per product.

## WHERE vs HAVING

`WHERE` filters rows before grouping.

`HAVING` filters groups after aggregation.

```sql
select C.CATEGORY_NAME,
       count(*) as PRODUCT_COUNT
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID
where P.ACTIVE = 'Y'
group by C.CATEGORY_NAME
having count(*) >= 2;
```

Plain-language reading:

1. start with active product rows
2. group them by category
3. keep only groups containing at least two products

## Grouping Rule

When a SELECT mixes aggregates with detail expressions, the non-aggregate expressions generally need to represent the grouping level.

A beginner warning sign is a query that asks for individual product names and a category-level count in the same SELECT without a clear plan for the result grain.

## Grain

**Grain** means what one result row represents.

Examples:

- product query: one row per product
- category summary: one row per category
- whole-table summary: one row for the entire selected set

Before writing aggregation, finish this sentence: **One result row represents _____.**

## Joined Aggregation

`05_aggregation_practice.sql` includes inventory totals by category:

```sql
select C.CATEGORY_NAME,
       sum(I.QTY_ON_HAND) as TOTAL_ON_HAND,
       sum(I.REORDER_POINT) as TOTAL_REORDER_POINT
from YOURSCHEMA.CATEGORY C
join YOURSCHEMA.PRODUCT P
  on P.CATEGORY_ID = C.CATEGORY_ID
join YOURSCHEMA.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID
group by C.CATEGORY_NAME;
```

Validate the underlying join before trusting the totals.

## IBM Bob-Assisted Activity

Ask Bob to identify:

- the result grain
- row filters
- grouping expressions
- aggregate functions
- group filters

Then ask Bob what could make the total wrong even if the SQL syntax is valid. A good answer should consider join multiplication and incorrect grouping assumptions.

## Guided Practice

For each statement in `05_aggregation_practice.sql`:

1. state the result grain
2. predict number of result rows
3. identify each aggregate
4. execute
5. compare expected and actual results

## Independent Task

Without Bob, write a query returning category name and total quantity on hand only for categories whose total quantity on hand is below 30.

Before execution, calculate the expected result manually from the five-row training data.

## Common Mistakes

- Confusing `WHERE` and `HAVING`.
- Grouping at the wrong grain.
- Trusting totals from a join that already multiplied rows.
- Selecting detail columns that do not match the grouping level.
- Assuming `COUNT(column)` and `COUNT(*)` always mean the same thing when NULL is possible.
- Rounding or converting results without understanding the business precision needed.

## Pro Tips

- Validate detail rows before validating totals.
- State result grain in code review for complex reporting SQL.
- Use aliases that describe the metric, not generic names such as `TOTAL1`.
- Keep business calculations separate from display formatting when the distinction matters.

## Manager's Perspective

Summary SQL often drives dashboards, billing checks, capacity decisions, and operational reporting. A wrong total can have more business impact than a failed program because it may look believable. Review the join, grain, filters, and NULL behavior—not only the arithmetic function.

## Knowledge Check

1. What does `GROUP BY` define?
2. What does `HAVING` filter?
3. When does `WHERE` apply relative to grouping?
4. What is result grain?
5. Why should you inspect joined detail rows before trusting a SUM?
6. What is the difference between a one-row whole-table aggregate and a grouped aggregate?
7. Why can `COUNT(column)` differ from `COUNT(*)`?

## Completion Criteria

The learner produces correct whole-set and grouped aggregates, explains WHERE versus HAVING, validates result grain, and completes the independent inventory summary without Bob.

## Final Sip

A summary is only as trustworthy as the rows underneath it. Count carefully before you celebrate the total.

## References

See M2-SUP-08 and M2-SUP-09 in the source register, with current Db2 for i SQL behavior governed by IBM documentation.
