# START HERE — Module 2

## Db2 for i and SQL-Centered Development

Welcome to Module 2 of The RPG Blend Academy.

This module assumes you can already work safely in VS Code/Code for IBM i, compile and test a small RPG change, use Git, and explain what you changed. You will now build the database skills needed for productive IBM i application work.

## Before you begin

Confirm that you have:

- an approved non-production IBM i account;
- a private learner schema/library you are authorized to change;
- Visual Studio Code;
- Code for IBM i;
- the Db2 for IBM i extension;
- Git access to the Academy repository;
- IBM Bob if it is approved for your environment;
- IBM i Access Client Solutions if your instructor uses it for supporting database demonstrations.

Do not use production data, production libraries, client data, PHI, credentials, tokens, or unrestricted logs for Academy exercises.

## Course sequence

Work through the lessons in this order:

1. Db2 for i platform and terminology
2. Modern SQL tooling and safe context
3. SQL DDL and relational integrity
4. SELECT and set-oriented thinking
5. Joins and cardinality
6. Aggregation and result grain
7. DML and transaction safety
8. Views, CTEs, performance evidence, and the Data Service boundary

Then complete the independent challenge and explain-back.

## The Coffee Company outcome

By the end of the module you will have built and tested a small Coffee Company relational model plus `V_PRODUCT_SNAPSHOT`.

That view returns product facts needed by later application logic. It does **not** decide whether an order is allowed. Module 3 will use those facts to teach Domain Services and reusable RPG capability design.

## Working rule

Before any SQL that can change objects or data, verify:

**host → profile → branch → script → schema/library → table/object → expected affected rows → transaction/recovery plan**

If any part of that chain is unclear, stop before executing the change.

## Evidence

Keep the evidence checklist open as you work. Compiler/database success messages alone are not enough. You are expected to show what you ran, where you ran it, what you expected, what happened, and why the result is correct.