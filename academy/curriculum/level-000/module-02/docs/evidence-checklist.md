# Module 2 Evidence Checklist

Use this checklist for guided labs, independent work, peer review, and release validation.

## Environment

- [ ] IBM i host identified.
- [ ] User/profile identified.
- [ ] Git branch/commit identified.
- [ ] Training schema/library identified.
- [ ] Target table/view/program identified.
- [ ] Db2 for IBM i extension / Code for IBM i versions recorded when required.
- [ ] Journaling/transaction assumptions recorded before DML transaction work.

## DDL

- [ ] Source-controlled DDL shown.
- [ ] Created objects verified.
- [ ] Column types/nullability/defaults reviewed.
- [ ] Primary keys verified.
- [ ] Foreign keys verified.
- [ ] Check/unique constraints verified.
- [ ] Invalid-data tests performed.
- [ ] No unauthorized schema/object changed.

## Queries

- [ ] Requirement stated in plain language.
- [ ] Expected result grain stated.
- [ ] Expected row count or key rows predicted where practical.
- [ ] Actual result captured.
- [ ] `NULL` behavior checked where relevant.
- [ ] Join cardinality explained.
- [ ] Aggregate reconciled to detail rows where required.

## DML / transaction

- [ ] Pre-change SELECT identifies the intended rows.
- [ ] Expected affected-row count written before execution.
- [ ] Actual affected-row count recorded.
- [ ] Changed state verified.
- [ ] Rollback behavior proven where required.
- [ ] Final commit executed only when authorized by the lab.
- [ ] Recovery/reset path documented.

## Data Service boundary

- [ ] `V_PRODUCT_SNAPSHOT` columns verified.
- [ ] View returns facts, not order-approval decisions.
- [ ] Embedded-SQL implementation keeps raw SQL diagnostics internal.
- [ ] Caller-facing statuses are stable and documented.
- [ ] No display/transport/presentation detail introduced.
- [ ] Module 3 dependency is clear.

## Git

- [ ] `git status` reviewed.
- [ ] `git diff` reviewed.
- [ ] `git diff --check` reviewed where appropriate.
- [ ] No credentials, client data, generated junk, or unrelated changes included.
- [ ] Every intentional change can be explained.

## IBM Bob

- [ ] Learner-first reasoning completed where required.
- [ ] Prompt/context contained only approved sanitized information.
- [ ] Material Bob findings dispositioned as Accept, Reject, Investigate, or Defer.
- [ ] Each accepted finding has source/query/runtime evidence.
- [ ] Independent challenge was completed without step-by-step Bob direction.

## Explain-back

The learner can explain:

- what changed;
- why the relational design is appropriate;
- what one row in each important result represents;
- how data integrity is enforced;
- how transaction risk was controlled;
- what the Data Service exposes and hides;
- what Module 3 is allowed to depend on;
- how the learner knows the result is correct.