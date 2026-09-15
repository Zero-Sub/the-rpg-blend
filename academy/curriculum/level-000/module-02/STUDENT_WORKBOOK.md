# Module 2 Student Workbook

Use this workbook to capture reasoning and evidence. Do not paste only final SQL. The Academy is evaluating whether you can explain and prove your work.

## Preflight

Record:

- IBM i host:
- User/profile:
- Git branch:
- Commit before work:
- Training schema/library:
- Db2 for IBM i extension version:
- Code for IBM i version:
- ACS version if used:
- Bob mode/version if used:

### Context check

What evidence tells you that this is a non-production environment?

Answer:

### Safety stop

Name two reasons you would stop before executing a DDL or DML statement.

Answer:

---

# Lesson 1 — Data model and terminology

## Native ↔ SQL map

Complete the table.

| Object/concept observed | Native IBM i term | SQL term | Notes / ambiguity |
|---|---|---|---|
| | | | |
| | | | |
| | | | |
| | | | |

### Member question

Explain the difference between a source physical-file member and a database physical-file member in your own words.

Answer:

What would you ask if someone said, “The bug is in the member”?

Answer:

### Bob review

Your analysis first:

Bob prompt used:

Useful finding:

Disposition: Accept / Reject / Investigate / Defer

Evidence:

---

# Lesson 2 — Tooling and safe SQL context

Record the exact context used for your first query.

- Host:
- Profile:
- Schema/library:
- Query file:
- Query purpose:
- Read-only? Yes / No

What would change if the current schema were wrong?

Answer:

Save one reproducible read-only query and record:

- Expected rows/result:
- Actual rows/result:
- Difference, if any:

---

# Lesson 3 — DDL and integrity

## Table design worksheet

For each Coffee Company table, state the purpose and key.

| Table | Purpose | Primary key | Important foreign keys / constraints |
|---|---|---|---|
| CUSTOMER | | | |
| PRODUCT | | | |
| ORDER_HEADER | | | |
| ORDER_ITEM | | | |

## Type choices

Pick three columns and explain why their type/size/nullability fits the data.

1.
2.
3.

## Negative tests

| Invalid case | Expected database protection | Actual result | Pass? |
|---|---|---|---|
| Invalid active flag | | | |
| Negative price | | | |
| Unknown customer | | | |
| Unknown product | | | |
| Zero order-item quantity | | | |

What is one business rule you deliberately did **not** implement as a database constraint? Why?

Answer:

---

# Lesson 4 — SELECT and set reasoning

For each query, write the expected set before execution.

## Active products

Expected:

Actual:

Why correct:

## Price-range query

Expected:

Actual:

Why correct:

## NULL query

Why is `EMAIL = NULL` not the correct test?

Answer:

## Boolean grouping

Write the requirement in plain language:

Write the condition with explicit parentheses:

Expected product IDs:

Actual product IDs:

---

# Lesson 5 — Joins and cardinality

## Relationship map

| Parent | Child | Key relationship | Cardinality |
|---|---|---|---|
| CUSTOMER | ORDER_HEADER | | |
| ORDER_HEADER | ORDER_ITEM | | |
| PRODUCT | ORDER_ITEM | | |

## Join prediction

For orders joined to customers:

- Expected result grain:
- Expected row count:
- Actual row count:
- Reason:

For order items joined to products:

- Expected result grain:
- Expected row count:
- Actual row count:
- Reason:

## Broken join

Describe the deliberately broken predicate:

Predicted effect:

Observed effect:

Correction:

---

# Lesson 6 — Aggregation and grain

Complete this sentence for each query.

> One row represents ______________________________.

### Customer order count

Grain:

Expected rows:

Actual rows:

### Units by product

Grain:

Reconcile one product to detail rows:

### HAVING

Explain the difference between filtering rows with `WHERE` and filtering groups with `HAVING`.

Answer:

---

# Lesson 7 — DML and transaction evidence

Do not continue until transaction prerequisites are confirmed.

## Verified setup

- Journaling verified by:
- Commitment-control behavior verified by:
- Client/autocommit setting verified by:
- Instructor approval / lab condition:

## Inventory correction

Pre-change query:

Expected matching rows:

Expected current quantity:

Expected affected rows for UPDATE:

Actual affected rows:

Changed quantity observed:

### Rollback proof

Quantity after rollback:

Was baseline restored? Yes / No

Evidence:

### Controlled commit

Second update affected rows:

Final committed value:

Recovery/reset plan for next learner:

---

# Lesson 8 — Data Service boundary

## `V_PRODUCT_SNAPSHOT`

Record the columns:

1.
2.
3.
4.

What does the view expose?

Answer:

What does it deliberately not decide?

Answer:

## Embedded-SQL demo

| Case | Expected status | Actual status | Pass? |
|---|---|---|---|
| Existing product | FOUND | | |
| Missing product | NOT_FOUND | | |
| Forced technical failure | DATA_ERROR | | |

Where are raw SQL diagnostics allowed to exist?

Answer:

Why should Module 3 not depend on them?

Answer:

---

# Independent challenge — Category data slice

Complete this portion without step-by-step Bob/instructor workflow direction.

## Acceptance criteria

1.
2.
3.

## Intended result grain

One row represents:

## Relational design

New table/object(s):

Primary/foreign keys:

Integrity rules:

## Query/view design

What facts are exposed?

What domain decisions remain excluded?

## Tests

| Test | Expected | Actual | Pass? |
|---|---|---|---|
| Normal relationship | | | |
| Unknown category | | | |
| Regression of existing product queries | | | |
| View/result grain | | | |

## Git review

- `git status` result:
- `git diff` reviewed? Yes / No
- Unrelated changes removed? Yes / No
- Database-object impact:

## Bob after implementation

Prompt:

Finding 1 / disposition / evidence:

Finding 2 / disposition / evidence:

## Explain-back

Explain why this is a Data Services change and not a Domain Services change.

Answer:

---

# Final learner evidence packet

- [ ] Preflight/context evidence
- [ ] Native/SQL terminology map
- [ ] DDL and constraint evidence
- [ ] SELECT predictions/results
- [ ] Join cardinality evidence
- [ ] Aggregate reconciliation
- [ ] Transaction rollback/commit proof
- [ ] `V_PRODUCT_SNAPSHOT` contract
- [ ] Embedded-SQL result evidence
- [ ] Independent challenge
- [ ] Focused Git diff
- [ ] Bob finding dispositions
- [ ] Independent explain-back