# Module 2 Instructor Guide

## Db2 for i and SQL-Centered Development

This guide supports delivery of Module 2 as part of the connected Academy path. The purpose is not to reproduce COMMON/iBegin training. Those materials validate terminology and coverage. Academy demonstrations, examples, scripts, labs, assessments, and sequencing are original.

## Instructor objective

By the end of the module, learners should be ready to enter Module 3 with a reliable Data Service mental model and enough SQL/Db2 fluency to avoid coupling domain logic directly to database rows.

## Recommended pacing

| Segment | Approx. time |
|---|---:|
| Lesson 1 + Lab 1 | 60–75 min |
| Lesson 2 | 45 min |
| Lesson 3 + Lab 2 | 90 min |
| Lesson 4 + Lab 3 | 75 min |
| Lesson 5 + Lab 4 | 75 min |
| Lesson 6 | 45–60 min |
| Lesson 7 + Lab 5 | 90 min |
| Lesson 8 + Lab 6 | 90 min |
| Independent challenge + explain-back | 90–120 min |

Adjust pacing for the learner cohort. Do not remove the transaction or Data Service boundary proof merely to shorten delivery.

## Delivery principles

### Teach both vocabularies

Learners need to work with SQL terminology without becoming unable to support native IBM i terminology. Present library/schema and physical file/table as useful mappings, then point out that object history and attributes still matter.

### Treat member as a context word

This has already confused pilot learners in earlier Academy work. Explicitly separate:

- source physical file → source members;
- database physical file → data members;
- SQL partition/member language.

A spreadsheet-tab analogy can help introduce the idea that multiple members share a file-level definition while containing different rows, but label it as an analogy, not an exact database model.

### VS Code first, ACS when appropriate

Use the Db2 for IBM i extension for the main learner workflow. Use ACS Run SQL Scripts when it materially improves schema inspection, database administration, or performance demonstration. Do not make tool loyalty the lesson.

### Make learners predict results

Before every important query or DML operation, ask the learner to predict the set or affected rows. This turns execution into evidence.

### Keep Module 3 out of Module 2

Do not teach service programs or full domain architecture here. The handoff is intentional:

- Module 2 creates a Data Service seam;
- Module 3 turns business behavior into reusable Domain Services.

## Lesson 1 coaching notes

Watch for these learner assumptions:

- Db2 is a separate server process they need to install/start.
- every logical file is just a view;
- every keyed logical file is just an index;
- member always means source member.

Correct the mental model without dismissing legacy/native techniques. The Academy goal is recognition plus modern workflow translation.

## Lesson 2 coaching notes

Before any learner SQL, ask them to point to the host/profile/schema context.

If the extension makes schema qualification easy, still teach why qualification matters. “The tool selected the right schema for me” is not a durable engineering model.

## Lesson 3 coaching notes

Use the Coffee Company tables to discuss data integrity rather than syntax memorization.

Key distinction to reinforce:

- database constraint: impossible persistence state in this model;
- domain rule: application decision requiring broader meaning.

Do not let learners move “can this order be placed?” into a check constraint just because SQL can express part of the condition.

### Negative tests

Run failures deliberately in disposable/rollback-safe conditions. Failure evidence is valuable because it proves the constraint exists.

## Lesson 4 coaching notes

Teach result prediction. Ask learners to name expected product IDs before they run the query.

For mixed `AND`/`OR`, require parentheses even if precedence already produces the intended answer. The teaching goal is readable intent.

For `NULL`, avoid the oversimplification “NULL is nothing” as the complete explanation. Teach it as absence/unknown in SQL semantics and demonstrate `IS NULL` / `IS NOT NULL`.

## Lesson 5 coaching notes

Ask two questions before every join:

1. What is the relationship?
2. What should one result row represent?

If a learner gets duplicate-looking rows, do not immediately add `DISTINCT`. First diagnose keys, cardinality, and join predicates.

### Break-it exercise

Use a disposable query and deliberately remove a join predicate. Have the learner predict the multiplication before execution.

## Lesson 6 coaching notes

The phrase to reinforce is **result grain**.

A learner who can type `GROUP BY` but cannot say what one row represents has not demonstrated the competency.

Require one reconciliation from aggregate back to detail.

## Lesson 7 coaching notes

This is the highest-risk lab in Module 2.

### Instructor preconditions

Before learners start:

- verify the training objects are journaled as required for the chosen commitment-control setup;
- verify connection/autocommit behavior;
- verify `ROLLBACK` actually restores the lab change;
- verify the reset procedure;
- verify learners cannot accidentally reach production schemas through the exercise.

If any of these are uncertain, do not improvise a transaction lab live.

### Stop conditions

Stop the learner if affected rows differ from prediction. Do not teach “just fix it with another update.”

## Lesson 8 coaching notes

This lesson is the bridge to Module 3.

Draw the boundary:

```text
Domain (Module 3)
      ↓
Data contract / Data Service
      ↓
Db2 for i
```

Then challenge learners with examples:

- `UNIT_PRICE` → fact, appropriate in snapshot.
- `QUANTITY_AVAILABLE` → fact, appropriate in snapshot.
- `ACTIVE` → fact, appropriate in snapshot.
- `ORDER_ALLOWED` → domain decision, keep out.
- `DISCOUNT_PERCENT` based on order thresholds → domain decision, keep out.
- `SQLCOD` → technical implementation detail, keep out.

## IBM Bob facilitation

Use Bob after learner-first reasoning where specified.

Good prompts ask Bob to:

- explain a schema relationship;
- identify likely integrity gaps;
- inspect a join for accidental multiplication;
- suggest negative tests;
- identify persistence details leaking into a contract;
- suggest what evidence would be needed to validate a performance claim.

Bad delivery pattern: instructor asks Bob to generate the final schema/query and has learners copy it.

Require learners to disposition material findings as Accept, Reject, Investigate, or Defer.

## Common failure modes

### Schema already exists

Do not add a casual `DROP SCHEMA ... CASCADE` to learner startup instructions. Use the approved reset process or learner-specific schema strategy.

### Foreign-key insert failure

Check parent seed data and schema qualification before weakening the constraint.

### Query returns too many rows

Check cardinality and join predicates before adding `DISTINCT`.

### Aggregate is wrong but plausible

Reconcile to detail and inspect upstream joins.

### Rollback does nothing

Stop. Verify commitment-control, journaling, and connection settings. Do not claim rollback safety until the environment proves it.

### Embedded SQL example fails to compile

Check the SQL RPG precompile command, source path, target object, include/options, and current IBM i release behavior. Record the exact correction in validation evidence before updating course text.

### Bob suggests production data or broad authority

Reject the suggestion and use the incident as a safety teaching point.

## Independent challenge evaluation

Do not give step-by-step implementation hints unless the learner is blocked by an environment defect rather than a design problem.

Evaluate:

- relational integrity;
- result grain;
- join correctness;
- regression protection;
- Data Service boundary;
- focused Git diff;
- evidence quality;
- explain-back quality.

## Completion conversation

Before marking Module 2 complete, ask the learner:

1. What does one row of `V_PRODUCT_SNAPSHOT` represent?
2. Why is `ACTIVE` okay in the view but `ORDER_ALLOWED` is not?
3. What would you need to verify before trusting rollback in a new environment?
4. Why can a correct join still produce multiple rows per customer?
5. What information does Module 3 no longer need to reteach?

If those answers are weak, the learner is not ready for Module 3 even if every SQL statement ran.