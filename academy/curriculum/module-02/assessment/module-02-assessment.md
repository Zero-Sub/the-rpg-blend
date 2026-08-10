# Module 2 Assessment — Db2 for i + SQL

## Assessment Metadata

- **Module:** 2 — Db2 for i + SQL
- **Estimated time:** 60–90 minutes plus required capstone lab
- **Passing standard:** 80% plus successful lab and no critical safety failure
- **AI mode:** reference only for Part D after the learner has produced an answer; no complete-solution generation
- **Required evidence:** submitted answers, SQL source, practical output, learner explanation

## Objective Map

| Part | Skills assessed |
|---|---|
| A | Db2 for i mental model, terminology, NULL, constraints |
| B | SQL reading and reasoning |
| C | Troubleshooting and safety judgment |
| D | Practical SQL implementation and explanation |
| Capstone | Integrated database skill and production discipline |

## Part A — Knowledge and Terminology — 20 points

### 1. Multiple choice — 2 points

Which statement is most accurate?

A. Db2 for i is a separate optional database server installed on IBM i.  
B. SQL and Db2 for i are two names for the same thing.  
C. Db2 for i is the database manager integrated with IBM i; SQL is a primary language/interface used to work with it.  
D. Db2 for i can be used only from RPG.

### 2. Short answer — 3 points

Explain why **library → schema** is a useful translation for a new learner but not a perfect statement that the two concepts are identical in every IBM i context.

### 3. Multiple choice — 2 points

Which predicate correctly finds rows where `ROAST_LEVEL` has no value?

A. `ROAST_LEVEL = ''`  
B. `ROAST_LEVEL = NULL`  
C. `ROAST_LEVEL is null`  
D. `ROAST_LEVEL = 0`

### 4. Short answer — 3 points

What invalid state does a foreign key from `PRODUCT.CATEGORY_ID` to `CATEGORY.CATEGORY_ID` prevent?

### 5. Multiple choice — 2 points

What is the primary purpose of `ORDER BY`?

A. Remove duplicate rows  
B. Request a result ordering  
C. Restrict the number of rows  
D. Group rows before aggregation

### 6. Short answer — 4 points

Distinguish `DEFAULT`, `NOT NULL`, and `CHECK` using the training `ACTIVE` column as an example.

### 7. Short answer — 4 points

What does one row represent in a query's **result grain**, and why should a developer state the grain before trusting an aggregate result?

## Part B — SQL Reading — 20 points

Use this query:

```sql
select C.CATEGORY_NAME,
       count(*) as PRODUCT_COUNT
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID
where P.ACTIVE = 'Y'
group by C.CATEGORY_NAME
having count(*) >= 2
order by PRODUCT_COUNT desc, C.CATEGORY_NAME;
```

### 8. Interpretation — 4 points

Describe the result in plain business language.

### 9. Interpretation — 4 points

What does the `WHERE` clause filter, and what does the `HAVING` clause filter?

### 10. Interpretation — 4 points

What is the result grain?

### 11. Troubleshooting — 4 points

If the join predicate were accidentally removed, what kind of result problem could occur and why?

### 12. Judgment — 4 points

A reviewer sees unexpected duplicate-looking rows and proposes adding `DISTINCT`. What should be checked before accepting that change?

## Part C — Safety and Troubleshooting — 20 points

### 13. Scenario — 5 points

You intend to update one disposable training product. Your preview SELECT using the planned WHERE clause returns two rows. What do you do next, and why?

### 14. Scenario — 5 points

An INSERT fails because the product references a category that does not exist. A learner proposes removing the foreign key. Explain the correct response.

### 15. Scenario — 5 points

A query against five training rows becomes faster after an index is created. Is that sufficient evidence that the same index will improve an enterprise workload? Explain what evidence is missing.

### 16. Scenario — 5 points

Bob says an UPDATE is “safe” because it includes a WHERE clause. List at least four facts you must independently verify before accepting that conclusion.

## Part D — Practical SQL — 40 points

Use only the learner-owned Module 2 schema.

### 17. SELECT task — 8 points

Write a schema-qualified query that returns `SKU`, `PRODUCT_NAME`, and `PRICE` for active products priced below `16.00`, sorted lowest price first and then SKU.

Before execution, write the expected row count.

### 18. JOIN task — 8 points

Write a query returning product name, category name, quantity on hand, and reorder point only for products at or below the reorder point.

State the two relationships involved and the expected row count before execution.

### 19. Aggregation task — 8 points

Write a query returning category name and total quantity on hand only for categories whose total quantity is below `30`.

State the result grain.

### 20. Constraint reasoning task — 6 points

Write one safe negative INSERT test that should fail because of a defined database constraint. Do not rely on a syntax error. Predict which constraint/rule rejects it.

### 21. Controlled DML task — 10 points

For one disposable row, submit:

1. preview SELECT proving the key is unused
2. INSERT
3. verification SELECT
4. preview SELECT for a one-row UPDATE
5. UPDATE
6. verification SELECT
7. cleanup DELETE
8. final SELECT proving cleanup

The instructor may stop the assessment immediately if the learner runs an unbounded data-changing statement against non-disposable rows.

## Required Capstone

The separate Module 2 Coffee Catalog lab remains required. Quiz performance alone cannot pass the module.

## Critical Failure Conditions

Correction is required regardless of numeric score if the learner:

- exposes credentials, tokens, PHI, customer data, or production data
- changes objects outside the approved learner schema
- runs destructive SQL without target verification
- removes integrity rules simply to bypass a failed statement
- submits AI-generated SQL they cannot explain
- cannot identify the target schema/table of a DML statement

## Learner Attestation

I can explain the SQL I submitted, the data it reads or changes, the evidence I used, and any Bob assistance I accepted or rejected.

Learner: ____________________  Date: ____________________
