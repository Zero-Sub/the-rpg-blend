# The RPG Blend Academy — Module 2 Instructor Guide

## Db2 for i + SQL

**Status:** source/static validated build; end-to-end technical validation pending  
**Roadmap position:** Module 2 of 8  
**Prerequisites:** Module 0 and Module 1  
**Recommended delivery:** 8–10 instructional hours plus capstone/assessment, adaptable to shorter sessions  
**Primary environment:** VS Code + Code for IBM i + Db2 for IBM i extension  
**Supplementary tool:** ACS Run SQL Scripts when deeper database tooling is useful  
**Training target:** PUB400 learner-owned private library/schema

## Instructor Purpose

Module 2 establishes the database mental model before Module 3 combines RPG with data access. Do not rush into embedded SQL. Learners should first understand what the tables mean, how relationships are protected, how SQL result sets behave, and how to make controlled changes.

The course is not a SQL syntax dump. The instructional pattern is:

```text
Target → Predict → Execute → Verify → Explain
```

For DML:

```text
Target → Preview → Predict row count → Change → Verify → Cleanup
```

The preview-before-change rule applies to both UPDATE and DELETE.

## Instructor Preflight

Before delivery:

- [ ] Confirm PUB400 availability, current IBM i release, and current SSH port.
- [ ] Confirm each learner has a working profile and private library/schema.
- [ ] Record the delivery versions of Code for IBM i and Db2 for IBM i.
- [ ] Confirm Code for IBM i connection using the current PUB400 SSH setting.
- [ ] Confirm Db2 for IBM i extension connection, SQL job, Schema Browser, current UI labels, and expected per-user server-component prompt.
- [ ] Run every Module 2 SQL script from a clean learner-equivalent schema.
- [ ] Record actual base row counts and expected query results.
- [ ] Run `99_reset.sql` from both a full and partial Module 2 object state, then rebuild from scratch.
- [ ] Confirm no course instruction depends on authority outside the learner schema.
- [ ] Review Bob access/approval and remind learners not to share secrets or sensitive data.
- [ ] Recheck version-sensitive claims against target-release IBM and current project/service documentation.

Do not deliver the lab as “validated” until the execution evidence is recorded.

## Suggested Run of Show

| Lesson | Topic | Suggested time |
|---|---|---:|
| 2.1 | Db2 for i platform mental model | 45 min |
| 2.2 | Native and SQL terminology | 60 min |
| 2.3 | Build the schema | 90 min |
| 2.4 | Keys, constraints, defaults, NULL | 75 min |
| 2.5 | SELECT fundamentals | 90 min |
| 2.6 | Joins | 90 min |
| 2.7 | Aggregation | 75 min |
| 2.8 | Safe data changes | 90 min |
| 2.9 | Views and indexes | 60 min |
| 2.10 | Capstone lab | 120–150 min |
| Assessment/defense | Written + practical review | 60–90 min |

Adjust for prior SQL experience, but preserve the capstone and safety gates.

---

# Lesson 2.1 — Db2 for i Is Part of the Platform

## Instructor objective

Replace the “separate database server” assumption with the IBM i integrated-platform mental model.

## Demonstration

1. Connect to PUB400.
2. Show the Code for IBM i server context.
3. Open Db2 for IBM i.
4. Show the learner schema.
5. Run a bounded read-only catalog/current-context query.
6. Ask what the successful connection proves and does not prove.

## Teaching points

- Db2 for i is the IBM i database manager.
- SQL is a language/interface, not the database itself.
- Native and SQL interfaces coexist.
- Database work is governed by IBM i authority and operational controls.
- A zero-row table catalog result in a new schema can simply mean the learner has not created the Module 2 objects yet.

## Watch for

Learners saying “the SQL database” as if it is unrelated to IBM i. Correct the mental model without overloading them with internals.

## Bob checkpoint

Ask learners to label Bob statements as fact, analogy, assumption, or recommendation.

---

# Lesson 2.2 — Native and SQL Terminology

## Instructor objective

Give learners both vocabularies early enough to follow real enterprise conversations.

## Teaching move

Use the translation table but repeatedly say: **useful mapping, not universal identity**.

Key cautions:

- a library can contain many non-database objects
- member ↔ partition is contextual: an SQL partitioned table maps to members through the traditional interface, while SQL can use an alias to address a specific member of a native multimember file
- a logical file can represent behavior not captured by the simplistic “view” mapping
- a keyed logical file is not automatically equivalent to a simple SQL index

## Demonstration

Show the same learner schema through:

- Code for IBM i Object Browser
- Db2 for IBM i Schema Browser

Ask: Which view answers which question better?

---

# Lesson 2.3 — Build the Coffee Catalog Schema

## Instructor objective

Make learners read DDL as a set of business decisions.

## Demonstration sequence

1. Open `01_create_catalog.sql`.
2. Replace `YOURSCHEMA` visibly.
3. Ask learners to name every object before execution.
4. For CATEGORY, explain each column and constraint.
5. Predict dependency order for PRODUCT and INVENTORY.
6. Run one CREATE at a time.
7. Run metadata verification.
8. Browse the resulting objects.
9. Ask what the PRODUCT/INVENTORY keys enforce and what they do not enforce.

## Questions to ask

- Why is `PRICE` decimal rather than character?
- Why can `ROAST_LEVEL` be NULL?
- Why is SKU unique separately from product ID?
- Why does INVENTORY reference PRODUCT?
- Why can a PRODUCT legally exist without an INVENTORY row in this schema?
- Why can there be at most one INVENTORY row for one PRODUCT?
- Which rule belongs in the database because it is universally true?

## Safety note

A learner who has not replaced `YOURSCHEMA` or cannot state the target schema does not run DDL yet.

---

# Lesson 2.4 — Keys, Constraints, Defaults, and NULL

## Instructor objective

Teach data integrity through predicted success and predicted rejection.

## Demonstration

1. Seed valid data.
2. Confirm 3 / 5 / 5 counts.
3. Run one duplicate-key test.
4. Read the diagnostic.
5. Run one invalid foreign-key test.
6. Run one CHECK test.
7. Run a valid nullable-roast example and clean it up.

## Important distinction

A syntax failure does not prove a business constraint. The statement must be syntactically valid enough to reach the intended integrity rule.

## Coaching trigger

If a learner proposes dropping a constraint because an insert fails, ask: **What invalid state is the database preventing?**

---

# Lesson 2.5 — SELECT

## Instructor objective

Teach precise, set-oriented questions with result prediction.

## Demonstration pattern

For every query:

1. say the business question
2. identify columns
3. identify source
4. read predicate in English
5. predict result
6. execute
7. compare result to prediction

Use `03_select_practice.sql`.

## Emphasize

- explicit columns
- schema qualification
- `IS NULL`
- deterministic `ORDER BY`
- bounded exploration
- expressions do not automatically update stored data

## Common coaching question

“What assumption are you making about the order of these rows?”

---

# Lesson 2.6 — Joins

## Instructor objective

Make relationship reasoning precede syntax and separate constraint-enforced cardinality from what the current rows happen to show.

## Whiteboard/diagram

```text
CATEGORY 1 ───< PRODUCT 1 ─── 0..1 INVENTORY
```

Then write the key columns under the lines.

Explain explicitly:

- `PRODUCT.CATEGORY_ID` must reference CATEGORY.
- `INVENTORY.PRODUCT_ID` must reference PRODUCT.
- `INVENTORY.PRODUCT_ID` is a primary key, so one PRODUCT can have at most one INVENTORY row.
- No constraint in Module 2 requires every PRODUCT to have INVENTORY.
- The seed data currently has one INVENTORY row for every PRODUCT, so the base inner join returns five rows.

## Demonstration

Build the three-table join one relationship at a time. Show row counts after each step.

Discuss the no-predicate example conceptually. Do not normalize comma-join/cartesian syntax as the preferred style.

## Critical misconception

`DISTINCT` is not a join-debugging strategy. If rows unexpectedly multiply, investigate relationships, optionality, uniqueness, and source data first.

---

# Lesson 2.7 — Aggregation

## Instructor objective

Teach **grain** as the organizing concept for grouping.

Before every grouped query ask learners to complete:

> One result row represents ________.

## Demonstration

Use `05_aggregation_practice.sql`.

Validate the joined detail rows before showing the grouped total. This creates a habit that will matter in reporting and production investigation.

## Explain WHERE vs HAVING

Use process language:

- WHERE filters candidate rows
- GROUP BY forms groups
- aggregates calculate group metrics
- HAVING filters groups

Avoid presenting this as a complete internal optimizer execution model; it is the learner's logical reasoning model.

---

# Lesson 2.8 — Safe Data Changes

## Instructor objective

Behavior matters more than DML speed.

## Mandatory live pattern

Do not batch-run `06_safe_data_changes.sql` on the first demonstration.

For UPDATE and DELETE:

1. preview using the exact planned predicate
2. state expected row count
3. stop if actual preview count differs
4. run the change
5. verify

INSERT also requires an unused-key/SKU check and post-insert verification. Use only a disposable row.

## Stop conditions

Stop the learner if:

- target schema is uncertain
- preview count differs from expectation
- learner wants to remove a WHERE clause for convenience
- learner wants broader authority to bypass the training boundary
- learner assumes ROLLBACK is available without knowing commitment-control context

## Module boundary

Commitment control, journaling, locking, COMMIT/ROLLBACK, and embedded SQL move into Module 3 where they can be taught with application access semantics.

---

# Lesson 2.9 — Views and Indexes

## Instructor objective

Separate logical interface from access-path/performance concepts.

## Demonstration

1. Create `ACTIVE_PRODUCT_SUMMARY`.
2. Query it like a table-shaped interface.
3. Ask which joins/filter the consumer no longer has to repeat.
4. Create `IX_PRODUCT_CATEGORY`.
5. Explicitly refuse to call the five-row query a performance benchmark.

## ACS opportunity

If time permits, show ACS Run SQL Scripts or Visual Explain as a preview of richer database analysis tooling. Do not turn Module 2 into a performance-tuning course.

---

# Lesson 2.10 — Capstone

## Facilitation

The learner should work from `../lab/module-02-lab.md` rather than the instructor solution.

Provide help in this order:

1. ask what the learner expected
2. ask what evidence they have
3. ask which object/relationship/rule applies
4. point to documentation or lesson material
5. only then provide a narrower hint

Do not rescue the learner by pasting the final SQL.

## Instructor defense

Require the learner to explain at least:

- environment/schema
- relationship model
- schema-enforced versus observed cardinality
- integrity rule
- join cardinality
- aggregate grain
- DML safety sequence for UPDATE and DELETE
- view/index distinction
- Bob contribution and one independently verified correction/decision

---

# Assessment Guidance

Use:

- `../assessment/module-02-assessment.md`
- `../assessment/module-02-answer-key.md`
- `../lab/instructor-solution.md`

Recommended overall weighting:

- Assessment: 40%
- Capstone: 50%
- Instructor defense: 10%

A numeric score cannot override a critical safety failure.

## Scoring vocabulary

- **Not Yet Demonstrated:** substantial intervention required
- **Developing:** frequent guidance required
- **Proficient:** safe completion with normal review
- **Advanced:** independent completion with clear tradeoff reasoning

---

# Troubleshooting Guide

## Object already exists

Determine whether the learner is continuing a prior run. Do not immediately run DROP. Verify all target names, then use the documented reset only if rebuilding is intended. `99_reset.sql` uses `IF EXISTS`, but that protects only against absent Academy objects—not a wrong schema substitution.

## SQL syntax error

Read the first meaningful diagnostic. Confirm the statement being executed and the exact source selected in the editor.

## Constraint error

Identify the named constraint/rule. Ask whether the data is invalid or the model is wrong before changing either.

## Unexpected query rows

Compare expected grain, predicates, NULL logic, joins, cardinality assumptions, and source row counts.

## Unexpected aggregate

Inspect the unaggregated joined detail set before changing GROUP BY/HAVING.

## Authority failure

Confirm learner library ownership, expected Db2 extension setup, and intended operation. Do not teach “get more authority” as the default fix.

## Tool/UI mismatch

The Db2 for IBM i extension evolves independently. Recheck current project documentation and update screenshots/labels rather than forcing old steps onto a new UI.

---

# Production-Safety Themes to Reinforce

- A successful sign-on is not proof of a correct target.
- A successful SQL statement is not proof of correct business behavior.
- Schema qualification reduces target ambiguity.
- Preview row sets before UPDATE and DELETE.
- Constraints are safety mechanisms, not obstacles.
- Query result order is not promised without ORDER BY.
- Correct totals require correct underlying relationships.
- Constraint-enforced cardinality and observed data cardinality are different evidence.
- Performance claims require evidence.
- AI assistance does not transfer accountability.

---

# Pilot Feedback Record

Capture after each delivery:

| Item | Notes |
|---|---|
| Actual total duration | |
| Setup friction | |
| PUB400 connection/permission issues | |
| Db2 extension UI/server-component drift | |
| SQL statement failures | |
| Confusing terminology | |
| Lab steps requiring hints | |
| Bob misconceptions | |
| Assessment ambiguity | |
| Recommended revision | |

Do not silently alter expected behavior after a pilot. Update the source, validation register, and version history.

## Instructor Completion Gate

Module 2 is ready for release only after a reviewer other than the author can start with the setup guide, rebuild the schema, reproduce every expected result, run the capstone, complete full and partial reset/rebuild, and verify that the learner-facing material matches actual IBM i behavior.
