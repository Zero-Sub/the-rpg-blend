# Lesson 2.6 — Joins: Put Related Business Data Back Together

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.6
- **Estimated time:** 90 minutes
- **Prerequisites:** Lesson 2.5; CATEGORY, PRODUCT, INVENTORY loaded
- **Required file:** `../code/sql/04_join_practice.sql`
- **Validation status:** source/static validated; execution validation pending

## Today's Coffee

A product label might tell you the coffee name, an inventory sheet might tell you quantity, and a category list might tell you what family it belongs to. A join combines those related facts without stuffing all of them into one repeated record.

## Learning Objectives

The learner can:

1. Explain why related data is stored in separate tables.
2. Identify the parent/child key relationship used in a join.
3. Write an explicit inner join.
4. Predict join cardinality before execution.
5. Distinguish schema-enforced cardinality from cardinality observed in the current data.
6. Recognize a missing or incorrect join predicate.
7. Join three tables without losing track of row meaning.
8. Explain why duplicate-looking results may reflect data relationships rather than an SQL defect.

## Why This Matters

Relational design separates different business entities so each fact has a stable home. Applications then combine those facts when a business question crosses entity boundaries.

A bad join can be dangerous even when it is read-only. It can multiply rows, distort counts and totals, and lead a developer to make the wrong operational decision.

## Relationship First, Syntax Second

Before writing a join, state the relationship supported by the DDL:

```text
CATEGORY.CATEGORY_ID  1 ---- many PRODUCT.CATEGORY_ID
PRODUCT.PRODUCT_ID     1 ---- 0..1 INVENTORY.PRODUCT_ID
```

The PRODUCT/INVENTORY relationship deserves care. `INVENTORY.PRODUCT_ID` is both a primary key and a foreign key. That means:

- an INVENTORY row must reference one existing PRODUCT
- one PRODUCT can have at most one INVENTORY row
- the schema does not require every PRODUCT to have an INVENTORY row

The Module 2 seed data supplies one INVENTORY row for each of the five PRODUCT rows, so the **current seeded data** behaves one-to-one even though the schema permits zero-or-one on the inventory side.

Now write the SQL:

```sql
select P.PRODUCT_NAME,
       C.CATEGORY_NAME
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID;
```

## Aliases

Aliases reduce repetition and make relationships easier to read:

- `P` = PRODUCT
- `C` = CATEGORY
- `I` = INVENTORY

Use aliases consistently. Short aliases should still be obvious in a small query.

## Inner Join

An inner join returns rows that satisfy the join condition on both sides.

```sql
select P.SKU,
       P.PRODUCT_NAME,
       I.QTY_ON_HAND
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID;
```

With the base Module 2 seed data, every product currently has an inventory row, so the expected result is five rows. If a valid PRODUCT row existed without INVENTORY, this inner join would not return that product.

## Three-Table Join

```sql
select C.CATEGORY_NAME,
       P.SKU,
       P.PRODUCT_NAME,
       I.QTY_ON_HAND
from YOURSCHEMA.CATEGORY C
join YOURSCHEMA.PRODUCT P
  on P.CATEGORY_ID = C.CATEGORY_ID
join YOURSCHEMA.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID
order by C.CATEGORY_NAME, P.SKU;
```

Read it as two relationships, not as a wall of SQL:

1. category to product
2. product to inventory

## Cardinality

Before execution, estimate how many result rows the relationship and **current data** should produce.

If you expect 5 and get 15, do not immediately add `DISTINCT`. First inspect:

- missing join predicates
- non-unique relationship keys
- optional relationships
- many-to-many relationships
- duplicate source data
- an incorrect assumption about the model

`DISTINCT` can hide a modeling or join defect without fixing it.

## A Missing Predicate

This is intentionally incomplete and must not be used as a solution:

```sql
select P.PRODUCT_NAME, C.CATEGORY_NAME
from YOURSCHEMA.PRODUCT P,
     YOURSCHEMA.CATEGORY C;
```

Without a relationship predicate, every product can pair with every category. Five products times three categories yields fifteen combinations in the base dataset.

The problem is not “SQL made duplicates.” The problem is that the query did not define the business relationship.

## Guided Practice

Run `04_join_practice.sql` one statement at a time.

For each join:

1. name each table
2. identify the key on each side
3. describe the schema-enforced relationship
4. describe any additional assumption coming from the current seed data
5. predict the row count
6. execute
7. compare expected and actual results

## IBM Bob-Assisted Activity

Ask Bob to explain one join relationship at a time and predict cardinality. Reject any answer that invents uniqueness, mandatory relationships, or source rows not present in the DDL/data.

Ask Bob: **What evidence in the DDL supports your cardinality assumption, and what part depends only on the current data?**

## Independent Task

Without Bob, write a query that shows:

- product name
- category name
- quantity on hand
- reorder point

only for products whose quantity on hand is less than or equal to the reorder point.

Predict the matching products before running the query.

## Common Mistakes

- Joining on similarly named columns without confirming the relationship.
- Forgetting a join predicate.
- Using `DISTINCT` to suppress unexpected row multiplication.
- Losing track of which table a column came from.
- Assuming all relationships are one-to-one.
- Treating “the seed data currently has one matching row” as proof the schema requires one matching row.
- Adding more joins before validating the first relationship.

## Pro Tips

- Draw the relationship before debugging a complicated join.
- Separate **constraint-enforced cardinality** from **observed data cardinality** in design reviews.
- Validate each join incrementally when adding multiple tables.
- Compare row counts before and after each added relationship.
- Use qualified column references in joins even when the column name is currently unambiguous.

## Manager's Perspective

Join mistakes create plausible-looking reports, which makes them more dangerous than obvious syntax errors. Code review should include a business relationship check: “Why are these two tables related, what does the schema enforce, and what cardinality do we expect from today's data?”

## Knowledge Check

1. What does an inner join return?
2. Why should you identify keys before writing join syntax?
3. What is cardinality?
4. What does the Module 2 DDL actually enforce between PRODUCT and INVENTORY?
5. Why do the seeded PRODUCT/INVENTORY rows currently produce five matches?
6. Why is `DISTINCT` a poor first response to unexpected duplicates?
7. What would five products joined to three categories with no predicate produce?
8. Why should a three-table join be validated relationship by relationship?
9. What evidence can prove that a join key is unique?

## Completion Criteria

The learner writes and explains two- and three-table joins, distinguishes schema-enforced from observed cardinality, predicts result counts, diagnoses a missing-predicate example, and completes the independent low-inventory join without Bob.

## Final Sip

A join is not “put these tables together.” It is “combine these facts because this relationship is true.” That difference is where reliable SQL starts.

## References

See M2-SUP-09 and M2-IBM-03 in the source register.
