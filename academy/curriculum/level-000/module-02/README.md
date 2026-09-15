# The RPG Blend Academy

## Module 2: Db2 for i and SQL-Centered Development

**Status:** In Development  
**Estimated time:** 10–12 hours including labs and independent challenge  
**Prerequisite:** Modules 0–1 or equivalent demonstrated capability  
**Primary environment:** Visual Studio Code, Code for IBM i, Db2 for IBM i extension, Git, IBM Bob  
**Supporting tool:** IBM i Access Client Solutions where its database features are appropriate  
**Application:** The RPG Blend Coffee Company

Module 2 builds the data foundation for the rest of the Academy path. The learner moves from making controlled RPG changes to understanding Db2 for i, relational data, SQL querying and data change, transaction safety, and explicit Data Services boundaries.

The target is not a generic SQL class. The learner must finish Module 2 ready for Module 3, where reusable Domain Services will consume stable product data without depending directly on database rows or SQL diagnostics.

## Learning loop

**Learn → Practice → Prove → Review → Explain**

Core promise: **Understand the data. Make a controlled change. Prove the result. Repeat.**

## Module outcomes

The learner will be able to:

- explain Db2 for i in the IBM i platform context;
- translate common native IBM i data terms to SQL terms;
- distinguish source members from database-file member/partition context;
- work safely in the Db2 for IBM i extension and use ACS when appropriate;
- create SQL-defined tables with deliberate data types, keys, constraints, defaults, and nullability;
- write and validate `SELECT` statements, joins, aggregates, and date/scalar expressions;
- perform controlled `INSERT`, `UPDATE`, and `DELETE` work with transaction evidence;
- explain practical commitment-control and journaling dependencies;
- use views, CTEs, and selected subqueries to shape stable data interfaces;
- recognize basic SQL performance evidence without confusing speed with correctness;
- build the Coffee Company `V_PRODUCT_SNAPSHOT` Data Service interface;
- keep raw SQL diagnostics and persistence details behind the Data Service boundary;
- use IBM Bob for explanation and review while independently validating outputs;
- complete a new relational/data-interface change without step-by-step AI guidance.

## Lesson sequence

1. Db2 for i: The Data Platform You Already Have
2. Modern SQL Tooling and Safe Context
3. Define Data with SQL DDL
4. SELECT: Think in Sets
5. Relationships, Joins, and Cardinality
6. Aggregation: Result Grain Matters
7. DML, Transactions, and Safe Data Change
8. Views, CTEs, Performance Evidence, and the Data Service Boundary

## Coffee Company target

Module 2 creates a small relational slice containing customers, products, order headers, and order items. The learner then creates `V_PRODUCT_SNAPSHOT`, which exposes facts required by later application logic: product identity, unit price, available quantity, and active state.

The view deliberately does **not** decide whether an order is allowed, apply discounts, or return domain approval/denial outcomes. Those responsibilities belong in Module 3 Domain Services.

## Repository layout

```text
module-02/
├── 00_START_HERE.md
├── README.md
├── MASTER_COURSE_PACKAGE.md
├── STUDENT_COURSEBOOK.md
├── STUDENT_WORKBOOK.md
├── LAB_GUIDE.md
├── INSTRUCTOR_GUIDE.md
├── ASSESSMENT_AND_KEY.md
├── QUICK_REFERENCE.md
├── INSTRUCTOR_DECK_OUTLINE.md
├── GETTING_THE_CODE.md
├── VALIDATION_RUNBOOK.md
├── STATUS.md
├── docs/
├── src/
│   ├── sql/
│   └── rpg/
└── tests/
```

## Release rule

This branch contains development material. Promotion to release candidate requires live IBM i SQL/transaction validation, embedded-SQL compile/runtime validation, current Db2 for IBM i/Code for IBM i workflow validation, technical review, learner pilot, and closure of Critical/High defects.

IBM, COMMON, vendor, and community sources are reference material used to validate terminology and coverage. Academy explanations, sequencing, Coffee Company schema, queries, labs, assessments, and code are original.