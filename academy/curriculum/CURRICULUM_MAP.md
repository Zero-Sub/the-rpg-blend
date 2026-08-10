# The RPG Blend Academy Curriculum Map

**Status:** Canonical module sequence  
**Owner:** George Van Eaton  
**Last aligned:** August 10, 2026

This file is the authoritative high-level sequence for the Academy's primary developer learning path. Detailed lesson plans live inside each module and must not redefine the module order.

## Primary Learning Path

| Module | Title | Status | Primary focus |
|---:|---|---|---|
| 0 | Getting Started | Built | IBM i mental model, tools, and the first safe development loop |
| 1 | RPG Fundamentals | Built | Read, declare, calculate, decide, loop, and test modern RPG |
| 2 | Db2 for i + SQL | Next | Schemas, tables, queries, data quality, and safe updates |
| 3 | Files + Data Access | Planned | Native I/O, embedded SQL, transactions, and errors |
| 4 | Procedures + ILE | Planned | Prototypes, procedures, modules, service programs, and binding |
| 5 | Debug + Test | Planned | Diagnostics, job logs, debugging, boundary tests, and regression tests |
| 6 | Git + Team Delivery | Planned | Branches, reviews, build evidence, and controlled promotion |
| 7 | Architecture + Capstone | Planned | APIs, SQL services, modernization patterns, and the final application |

## Progression

```text
Module 0 — Getting Started
        ↓
Module 1 — RPG Fundamentals
        ↓
Module 2 — Db2 for i + SQL
        ↓
Module 3 — Files + Data Access
        ↓
Module 4 — Procedures + ILE
        ↓
Module 5 — Debug + Test
        ↓
Module 6 — Git + Team Delivery
        ↓
Module 7 — Architecture + Capstone
```

The sequence moves the learner from individual RPG fluency toward safe enterprise application delivery and modernization.

## Curriculum Design Rules

Every module must:

1. Define prerequisites.
2. State measurable learning objectives.
3. Explain why the topic matters in real IBM i development.
4. Demonstrate the work primarily in Visual Studio Code using Code for IBM i and the Db2 for i extension where appropriate.
5. Include original Academy examples and hands-on labs.
6. Integrate IBM Bob into the learning workflow without allowing Bob to replace learner understanding.
7. Include knowledge checks and an independent task.
8. Include production-safety, security, troubleshooting, and support considerations.
9. Define completion criteria and evidence of skill.
10. Record the sources used to validate the module.

## Tooling Direction

The primary Academy environment is:

- Visual Studio Code
- Code for IBM i
- Db2 for i extension
- Git and GitHub
- IBM i Access Client Solutions when it remains the appropriate tool
- IBM Bob as an integrated AI-assisted learning and development companion

SEU, PDM, RDi, and green-screen workflows may be taught for recognition, support, or comparison, but they are not the Academy's default development experience.

## Module 2 Transition

Module 2 is **Db2 for i + SQL**. It follows RPG Fundamentals and introduces the database as a first-class part of IBM i application development before learners begin mixed RPG/database access in Module 3.

The Module 2 build should cover, at minimum:

- what Db2 for i is and how it is integrated with IBM i
- native IBM i database terminology compared with SQL terminology
- schemas, tables, columns, rows, keys, constraints, views, and indexes at an introductory level
- SQL DDL for creating safe training objects
- SELECT fundamentals, filtering, sorting, expressions, and NULL awareness
- joins and basic aggregation
- INSERT, UPDATE, and DELETE with explicit safe-update discipline
- using the Db2 for i extension in VS Code
- when ACS Run SQL Scripts remains useful
- IBM Bob-assisted SQL explanation, review, and test suggestion with human validation
- production-safety habits before moving into RPG data access

## Change Control

Material changes to this module order require an explicit Academy curriculum decision and updates to the Blueprint, module plans, learner-facing roadmap, and publication backlog. Do not silently fall back to older level-based or lesson-numbering schemes that conflict with this map.
