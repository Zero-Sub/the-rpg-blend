# Module 2 Status

## Db2 for i and SQL-Centered Development

**Current state:** In Development  
**Branch:** `academy/module-02-db2-sql-centered`

## Static curriculum scope

The planned package includes:

- master course package;
- student coursebook;
- student workbook;
- six guided labs;
- instructor guide;
- assessment and instructor key;
- quick reference;
- instructor deck outline;
- Coffee Company DDL, seed data, query, join/aggregate, transaction, and view/CTE scripts;
- embedded-SQL RPG Data Service demonstration;
- validation matrix;
- Data Service boundary decision;
- evidence checklist;
- START HERE and code-access instructions.

## Promotion rule

Do not label this module Release Candidate until all Critical/High issues are closed and the designated IBM i environment proves the documented behavior.

Required live validation includes:

- DDL execution and cleanup/re-run plan;
- key/check/foreign-key negative tests;
- expected SELECT/join/aggregate results;
- verified journaling/commitment-control context;
- rollback and controlled commit behavior;
- `V_PRODUCT_SNAPSHOT` behavior;
- embedded-SQL RPG precompile/compile/runtime behavior;
- current Db2 for IBM i extension workflow;
- current Code for IBM i integration;
- current IBM Bob activities;
- independent technical review;
- learner pilot.

## Curriculum handoff requirement

Module 2 is not complete as a learning design unless it hands Module 3 an explicit Data Service boundary. `V_PRODUCT_SNAPSHOT` must return product facts while leaving order eligibility and other business decisions to Module 3 Domain Services.