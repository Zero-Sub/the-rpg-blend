# Lesson 2.5 — SELECT: Ask the Database a Precise Question

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.5
- **Estimated time:** 90 minutes
- **Prerequisites:** Lessons 2.1–2.4; catalog seeded
- **Required file:** `../code/sql/03_select_practice.sql`
- **Validation status:** source reviewed; execution validation pending

## Today's Coffee

“Give me coffee” is a request. “Give me a 12-ounce medium-roast coffee under $16” is a query. The more precisely you define the question, the more useful the answer becomes.

## Learning Objectives

The learner can:

1. Identify the SELECT list, FROM, WHERE, and ORDER BY parts of a query.
2. Return only required columns.
3. Filter rows with deliberate predicates.
4. Use expressions and aliases in a result set.
5. Test NULL correctly.
6. Request deterministic ordering when order matters.
7. Limit exploratory result size.
8. Predict the result before execution.

## Why This Matters

SQL is powerful because it describes the set of data you want instead of requiring the application to read every row and decide what to keep. But vague queries can return too much data, hide assumptions, or encourage developers to trust an accidental row order.

The Academy uses a read-first discipline: understand the target and result set before moving into data changes.

## Query Anatomy

```sql
select SKU, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT
where PRICE >= 15.00
order by PRICE desc, SKU;
```

| Clause | Purpose |
|---|---|
| `SELECT` | Defines the columns or expressions in the result |
| `FROM` | Identifies the source table or view |
| `WHERE` | Filters individual rows |
| `ORDER BY` | Requests result ordering |

## Explicit Columns

For learning and production readability, prefer explicit columns when you know what the consumer needs:

```sql
select PRODUCT_ID, SKU, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT;
```

`SELECT *` can be useful during controlled exploration, but it couples the result to every column in the source and can retrieve more data than needed.

## Predicates

A `WHERE` clause defines which rows belong to the result set.

```sql
where PRICE < 16.00
  and ACTIVE = 'Y'
```

Read the predicate as a business statement: “active products with a price lower than sixteen dollars.” If the sentence sounds wrong, inspect the SQL before running it.

## Expressions and Aliases

SQL can calculate values in the result without changing the stored row:

```sql
select SKU,
       PRICE,
       decimal(PRICE * 1.0925, 9, 2) as PRICE_WITH_SAMPLE_TAX
from YOURSCHEMA.PRODUCT;
```

The alias names the result expression. This example is training math, not a production tax rule.

## NULL Tests

Use `IS NULL` or `IS NOT NULL`:

```sql
select SKU, PRODUCT_NAME, ROAST_LEVEL
from YOURSCHEMA.PRODUCT
where ROAST_LEVEL is null;
```

NULL participates in three-valued logic. It is not equal to a normal value, blank, zero, or another NULL in the way beginners often expect.

## Ordering

Without `ORDER BY`, do not promise a result order.

```sql
order by PRICE desc, SKU
```

This requests highest price first, then SKU as a tie-breaker.

## Bounded Exploration

When exploring an unfamiliar or potentially large object, limit the result intentionally:

```sql
fetch first 20 rows only
```

A result limit is not a substitute for a correct predicate. It is an additional guardrail for exploration.

## Guided Practice

Open `03_select_practice.sql`. For each statement:

1. identify the target table
2. predict the selected columns
3. predict which rows should qualify
4. predict the order
5. execute the statement
6. compare expected and actual row counts

Do not skip the prediction step.

## IBM Bob-Assisted Activity

Give Bob one query and ask it to review:

- target ambiguity
- predicate correctness
- NULL handling
- result-size risk
- ordering assumptions
- readability

Then identify one thing Bob could not prove without seeing the actual schema or data.

## Independent Task

Without Bob, write a query that returns:

- `SKU`
- `PRODUCT_NAME`
- `PRICE`

for active products cheaper than `16.00`, ordered from lowest to highest price and then SKU.

Before running it, write the expected row count and product names.

## Common Mistakes

- Using `SELECT *` everywhere.
- Omitting schema qualification in a context where the target could resolve differently.
- Using `= NULL`.
- Assuming results are sorted because they appeared sorted once.
- Writing a predicate without considering operator precedence.
- Treating `FETCH FIRST` as a replacement for a safe WHERE clause.
- Reading the output without comparing it to the business question.

## Pro Tips

- Say the query in plain English before execution.
- Make result ordering explicit whenever downstream reasoning depends on it.
- During production investigation, record the exact query used to support a conclusion.
- Start with read-only SQL when learning an unfamiliar data model.

## Manager's Perspective

A useful SQL code review asks more than “does the query run?” Reviewers should ask whether the target is unambiguous, whether the predicate represents the business requirement, whether NULL is handled deliberately, and whether the result set is appropriately bounded.

## Knowledge Check

1. What part of a SELECT chooses result columns?
2. What part filters rows?
3. What guarantees result order?
4. Why can `SELECT *` be a maintenance problem?
5. How do you test for NULL?
6. Why should you predict a row count before running a learning query?
7. What does `FETCH FIRST` protect against, and what does it not protect against?
8. Does an expression in SELECT necessarily change the stored table value?

## Completion Criteria

The learner writes, executes, and explains schema-qualified SELECT statements with filtering, ordering, expressions, NULL handling, and bounded output, including the independent task without Bob.

## Final Sip

SQL rewards precise questions. If the question is vague, a fast answer can still be the wrong answer.

## References

See M2-SUP-05 and current IBM i SQL SELECT documentation identified through the module source-validation process.
