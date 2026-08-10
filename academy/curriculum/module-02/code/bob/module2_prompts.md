# Module 2 IBM Bob Prompts

IBM Bob is used as an engineering assistant throughout Module 2. The learner remains responsible for target verification, SQL correctness, security, data integrity, test evidence, and explanation.

Do not paste passwords, tokens, private keys, client data, PHI, production data, or unapproved proprietary source into Bob.

## Standard evidence record

For every Bob activity, record:

- Prompt used
- Fact Bob stated that you verified
- Assumption Bob made
- Suggestion accepted, corrected, or rejected
- Evidence used for that decision
- Risk or edge case Bob missed

## Lesson 2.1 — Database mental model

> Explain the relationship among IBM i, Db2 for i, SQL, libraries, and database objects for a developer who already knows basic programming. Separate platform facts from analogies. List anything I should verify in current IBM documentation.

Independent requirement: explain the relationship again without Bob in no more than five sentences.

## Lesson 2.2 — Terminology translation

> Compare these IBM i and SQL terms: library/schema, physical file/table, field/column, record/row, logical file/view, keyed logical file/index. Identify where the comparison is useful but not perfectly interchangeable. Do not claim that a logical file and SQL view/index are always identical.

Independent requirement: classify five objects from the learner's own training library without Bob.

## Lesson 2.3 — DDL review

> Review this CREATE TABLE statement for naming, data types, nullability, keys, defaults, and beginner-visible risks. Do not rewrite it yet. For every recommendation, explain the business rule it is trying to protect.

Independent requirement: make one justified DDL change and explain it before asking Bob to review it.

## Lesson 2.4 — Constraint test design

> Given this table definition, propose tests that should succeed and tests that should be rejected by primary-key, foreign-key, NOT NULL, UNIQUE, DEFAULT, and CHECK rules. Do not execute SQL. Include expected outcomes.

Independent requirement: create one new negative test without Bob and predict the SQL behavior.

## Lesson 2.5 — SELECT review

> Review this SELECT for target ambiguity, missing predicates, NULL mistakes, result-size risk, ordering assumptions, and readability. Do not turn it into a data-changing statement.

Independent requirement: write the assigned query from scratch with Bob closed.

## Lesson 2.6 — Join review

> Explain this JOIN one relationship at a time. Identify the join keys, predicted cardinality, and what could cause duplicate or multiplied rows. Do not add tables or predicates that are not supported by the schema.

Independent requirement: predict the result row count before executing the final join.

## Lesson 2.7 — Aggregation review

> Explain the difference between WHERE and HAVING in this query, identify the grouping level, and verify whether every selected non-aggregate expression is compatible with the GROUP BY. Suggest test cases but do not rewrite the answer for me.

Independent requirement: write one grouped query and one HAVING condition without Bob.

## Lesson 2.8 — Data-change safety review

> Review this INSERT, UPDATE, or DELETE as if it were a production change request. Identify the exact target object, target rows, predicate risk, constraints that may reject it, verification query, and rollback/cleanup concern. Do not execute or broaden the statement.

Independent requirement: prove the target row set with SELECT before using Bob.

## Lesson 2.9 — View and index review

> Explain what business logic this view centralizes and what it does not guarantee. Then explain what evidence would be required before claiming this index improves a query. Do not claim that creating an index automatically improves performance.

Independent requirement: explain why the view is not a copied table.

## Module capstone

Bob mode: **reference and review only**.

Bob may help explain a diagnostic, review a completed statement, or suggest tests. Bob may not generate the learner's complete capstone solution. The learner must be able to recreate the core DDL and queries, explain every clause, and demonstrate the expected results without reading a Bob-generated answer.
