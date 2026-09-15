# Module 2 Assessment and Instructor Key

**Status:** Development. Final scoring requires live source validation and pilot review.

## Scoring model

- Knowledge assessment: 20%
- Practical independent challenge: 60%
- Explain-back/review: 20%

Minimum overall score: **80%** with no critical safety failure.

---

# Student Knowledge Assessment

## 1. Db2 for i platform model

Which statement best describes Db2 for i in the Academy mental model?

A. A separate database server product that must be installed and started after IBM i boots  
B. The relational database integrated with IBM i, used through SQL and other IBM i data interfaces  
C. A VS Code extension that stores application data  
D. A replacement for all native IBM i database interfaces

## 2. Terminology

Map each native term to the closest common SQL term:

- library
- physical file
- field
- record
- keyed logical file

## 3. Member context

Why is the sentence “change the member” ambiguous on IBM i?

## 4. NULL

Why is this predicate incorrect for finding missing email addresses?

```sql
WHERE EMAIL = NULL
```

What should be used instead?

## 5. Data integrity

Give one example of a rule that belongs naturally in a database constraint and one example of a rule that belongs in Module 3 Domain Services.

## 6. Primary and foreign keys

What different problems do a primary key and a foreign key solve?

## 7. SELECT reasoning

Why does the Academy ask you to predict a query result before executing the SQL?

## 8. Join cardinality

`CUSTOMER` has one row for customer 1001. `ORDER_HEADER` has two rows for customer 1001. If the tables are joined correctly on customer ID, how many rows should customer 1001 contribute to the joined result, and why?

## 9. DISTINCT

A join unexpectedly returns duplicate-looking rows. Why is adding `DISTINCT` not the first debugging step?

## 10. GROUP BY / HAVING

Explain the difference between `WHERE` and `HAVING` in an aggregate query.

## 11. Result grain

What does “result grain” mean? Give one example from the Coffee Company exercises.

## 12. Controlled UPDATE

List at least four things you should know or verify before executing an `UPDATE` in the Module 2 transaction lab.

## 13. ROLLBACK

Why is “we can always roll it back” an unsafe assumption?

## 14. Data Service boundary

Why does `V_PRODUCT_SNAPSHOT` expose `ACTIVE` but not `ORDER_ALLOWED`?

## 15. SQL diagnostics

Why should raw `SQLCOD` / `SQLSTATE` values normally stay inside the data-access implementation rather than becoming Module 3 business result codes?

## 16. IBM Bob

Bob generates a query that looks correct. What must the learner do before accepting it?

---

# Instructor Key

## 1

**B.** Db2 for i is the IBM i relational database. Applications may use SQL and native interfaces; the Academy does not treat SQL as proof that native interfaces no longer exist.

## 2

Expected mapping:

- library → schema
- physical file → table
- field → column
- record → row
- keyed logical file → index/access-path concept

Accept nuanced answers that note these are useful mappings rather than perfect historical equivalences.

## 3

“Member” may refer to a source member inside a source physical file or to a data member/partition context for a database physical file. The learner must identify the context before acting.

## 4

`NULL` represents absence/unknown and is not compared with ordinary equality. Use:

```sql
WHERE EMAIL IS NULL
```

## 5

Strong database example: product quantity may not be negative, foreign key must reference an existing parent, active flag must be in an allowed set.

Strong domain example: whether a product/order is eligible for purchase, discount eligibility, approval outcome, shipping classification based on broader business rules.

## 6

A primary key uniquely identifies a row in its table. A foreign key protects a relationship by requiring the referenced parent key to exist, subject to the defined referential action.

## 7

Prediction creates a testable expectation. It helps catch wrong predicates, wrong schema/data assumptions, join multiplication, and misunderstood requirements instead of treating any returned result as success.

## 8

Two rows. One customer row matches two order rows; the join grain is one row per order for that query.

## 9

`DISTINCT` can hide a wrong relationship or predicate. First inspect keys, cardinality, and the join condition to determine whether the repeated values are expected or erroneous.

## 10

`WHERE` filters input rows before grouping. `HAVING` filters grouped/aggregate results after grouping. Accept equivalent wording.

## 11

Result grain describes what one row in the result represents. Examples: one row per order, one row per customer, one row per product, one row per order line.

## 12

Any four of the following, with emphasis on context and recovery:

- host/system;
- profile/identity;
- schema/library;
- target table;
- exact qualifying predicate;
- current baseline value;
- expected affected-row count;
- journaling/commitment-control setup;
- client/autocommit behavior;
- recovery/rollback plan;
- Git/script revision.

## 13

Rollback depends on the actual transaction/commitment-control environment and object setup, including journaling requirements on IBM i. A connection may also be using autocommit or another setting that changes behavior. The developer must prove the specific environment.

## 14

`ACTIVE` is a stored product fact. `ORDER_ALLOWED` is a business decision derived from facts and application rules. Module 2 Data Services return facts; Module 3 Domain Services make the decision.

## 15

Raw SQL diagnostics are implementation/support details coupled to the database layer. A stable application/domain contract should communicate application meaning without forcing every caller to understand Db2 diagnostic semantics.

## 16

The learner must compare the query to the actual schema and requirement, verify object/column names, reason about expected results/cardinality, run it first in a safe/read-only form where appropriate, and validate actual results. Bob output is a proposal, not proof.

---

# Practical Challenge Rubric — 60 points

## Relational design — 15

- Category entity has clear purpose and key — 5
- Product/category relationship and referential integrity are correct — 5
- Data types/nullability/constraints are deliberate — 5

## Query/view behavior — 15

- Query returns required category/product information — 5
- Result grain/cardinality is explicitly correct — 5
- View/interface design exposes facts without domain decisions — 5

## Validation and safety — 15

- Negative/integrity tests — 5
- Regression tests of existing product queries/view — 5
- Correct environment/object evidence and no unsafe data handling — 5

## Git/evidence quality — 15

- Focused diff — 5
- Reproducible SQL/object evidence — 5
- Bob findings dispositioned after independent implementation — 5

### Critical safety failures

Examples that can fail the practical regardless of score:

- changing an unauthorized or production object;
- using protected/client/PHI data in Git or AI prompts;
- knowingly executing broad DML after an affected-row mismatch;
- bypassing authority/governance controls to make the exercise succeed;
- presenting fabricated rollback/test evidence.

---

# Explain-back Rubric — 20 points

- Explains relational design and keys — 5
- Explains result grain/cardinality — 5
- Explains transaction/data-change safety — 5
- Explains Data Service versus Domain Service boundary and Module 3 handoff — 5

The learner must explain in their own words without reading an AI-generated script.