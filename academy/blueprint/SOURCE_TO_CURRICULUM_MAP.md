# The RPG Blend Academy
## Source-to-Curriculum Map

**Prepared for:** George Van Eaton  
**Date:** July 31, 2026

## Purpose

This map aligns the Academy's IBM manuals, IBM Redbooks, and COMMON RPG Boot Camp materials to the curriculum. Current IBM documentation remains the final authority for release-sensitive behavior.

## Authority Order

1. Current IBM product documentation
2. IBM manuals
3. IBM Redbooks
4. COMMON training
5. Academy instructional standards

Several available IBM manuals are IBM i 7.1-era references. They remain useful for stable language, SQL, ILE, and database concepts, but they are not the final authority for 2026 tooling, supported features, command defaults, or release-specific behavior.

## Curriculum Map

| Area | Primary Sources | Main Use |
|---|---|---|
| Module 0 | RPG Programmer's Guide, RPG Language Reference, *Who Knew You Could Do That with RPG IV?*, COMMON Introducing RPG, *Modernizing IBM i Applications* | IBM i orientation, source and object model, VS Code-first compile/run workflow |
| Level 100 | RPG Language Reference, Programmer's Guide, COMMON declarations, workflow, functions, and screens | Modern free-form RPG, variables, control flow, native I/O, and basic 5250 |
| Level 200 | RPG Programmer's Guide, RPG Language Reference, COMMON ILE Concepts, SQL Programming | Procedures, prototypes, ILE, modules, service programs, and DDS-to-DDL transition |
| Level 300 | SQL Programming, Embedded SQL Programming, SQL Reference, SQL Messages and Codes, COMMON SQL sessions | SQL fundamentals, embedded SQL, diagnostics, transactions, and dynamic SQL |
| Level 400 | *Modernizing IBM i Applications*, *Who Knew You Could Do That with RPG IV?*, COMMON Subfiles, SQL references | Subfiles, modernization, Git, DevOps, testing, AI, database modernization, and performance |
| Level 500 | Modernization Redbook, RPG and SQL references | Architecture, standards, modernization roadmaps, leadership, and governance |

## Source Register

| Source | Category | Primary Curriculum Use | Rule |
|---|---|---|---|
| ILE RPG Language Reference | IBM official | Levels 100-200 | Use for RPG syntax, procedures, indicators, errors, files, and definitions; revalidate newer syntax |
| ILE RPG Programmer's Guide | IBM official | Module 0 and Levels 100-200 | Use for program creation, modules, service programs, debugging, and runtime concepts |
| SQL Programming | IBM official | Levels 100-400 | Use for relational concepts, DDL, DML, joins, constraints, views, and indexes |
| Embedded SQL Programming | IBM official | Level 300 | Use for host variables, indicator variables, SQLCA, diagnostics, and embedded SQL patterns |
| SQL Messages and Codes | IBM official | Levels 300-400 | Use for SQLCODE, SQLSTATE, diagnostics, QSQLMSG, and error interpretation |
| SQL Call Level Interface | IBM official | Levels 400-500 | Advanced and specialized reference; not a beginner dependency |
| DB2 for i SQL Reference | IBM official | Levels 300-500 | Formal syntax and behavior reference for the documented release |
| *Who Knew You Could Do That with RPG IV?* | IBM Redbooks | Levels 100-500 | Modern RPG, ILE, database features, and modernization direction |
| *Modernizing IBM i Applications* | IBM Redbooks work in progress | Module 0 and Levels 200-500 | Foundational modernization reference; retain work-in-progress designation until final publication |
| COMMON RPG Boot Camp series | Supplemental training | Module 0 through Level 400 | Use for sequence, examples, and labs; validate all code and replace RDi-first workflow with VS Code-first delivery |

## Detailed Source-to-Lesson Alignment

### Module 0 — Getting Started with RPG and IBM i

**Primary sources:** ILE RPG Programmer's Guide, ILE RPG Language Reference, *Who Knew You Could Do That with RPG IV?*, COMMON Introducing RPG, COMMON Program Structure, and *Modernizing IBM i Applications*.

**Supports:** IBM i and RPG terminology, libraries and objects, source organization, compile and run cycle, modern RPG direction, and modernization context.

**Academy adaptation:** Use VS Code and Code for IBM i as the primary workflow. ACS and 5250 remain supplemental operational tools.

### Level 100 — RPG Foundations

**Primary sources:** ILE RPG Language Reference, ILE RPG Programmer's Guide, COMMON Introducing RPG, COMMON Declarations and Data Structures, COMMON Workflow, COMMON Further RPG Operations, and COMMON Basic Screens.

**Supports:** Fully free-form RPG, variables, constants, data types, expressions, control flow, built-in functions, native file I/O, CRUD processing, and basic 5250 interaction.

**Academy adaptation:** Teach modern free-form first. Show fixed-format syntax only for maintenance literacy. Pair native I/O with SQL comparisons and production-locking guidance.

### Level 200 — Professional RPG Development

**Primary sources:** ILE RPG Language Reference, ILE RPG Programmer's Guide, COMMON ILE Concepts, SQL Programming, COMMON Static SQL, and *Who Knew You Could Do That with RPG IV?*.

**Supports:** Procedures, prototypes, procedure interfaces, qualified data structures, modules, binding, service programs, activation groups, and DDS-to-SQL DDL transition.

**Academy adaptation:** Introduce procedures early to establish testable, maintainable design. Include architecture diagrams and deployment consequences.

### Level 300 — Db2 for i and SQL

**Primary sources:** SQL Programming, Embedded SQL Programming, DB2 for i SQL Reference, SQL Messages and Codes, SQL Call Level Interface, COMMON Static SQL, and COMMON Additional SQL Topics.

**Supports:** SELECT, joins, DDL, DML, host variables, indicators, cursors, SQLCA, SQLSTATE, GET DIAGNOSTICS, transactions, isolation, commitment control, static SQL, and dynamic SQL.

**Academy adaptation:** Make diagnostic handling part of every example. Teach dynamic SQL only when static SQL cannot satisfy the requirement.

### Level 400 — Applications and Modernization

**Primary sources:** COMMON Subfiles, COMMON Basic Screens, *Modernizing IBM i Applications*, *Who Knew You Could Do That with RPG IV?*, SQL Programming, and DB2 for i SQL Reference.

**Supports:** Subfiles, interactive applications, Git, DevOps, automated testing, AI-assisted development, database modernization, performance, integration, and security.

**Academy adaptation:** Maintain subfiles as a dedicated 5250 specialization. Update modernization content frequently and validate current tooling against current IBM documentation.

### Level 500 — Architecture and Leadership

**Primary sources:** *Modernizing IBM i Applications*, *Who Knew You Could Do That with RPG IV?*, ILE RPG Programmer's Guide, and the SQL references.

**Supports:** Architecture reviews, modernization roadmaps, technical standards, technical debt, code reviews, production support, mentoring, platform governance, and AI adoption.

**Academy adaptation:** Convert technical guidance into decision records, team standards, manager playbooks, and measurable modernization plans.

## Sample Application Alignment

The RPG Blend Coffee Company Order Management System provides the common business context for the curriculum.

| Application Area | Curriculum Connections |
|---|---|
| Customer Master | Variables, validation, keyed I/O, SQL SELECT and UPDATE, procedures, and display files |
| Coffee Product Catalog | DDS versus DDL, data types, pricing, descriptions, indexes, and constraints |
| Inventory | Transactions, locking, quantities, reorder logic, and commitment control |
| Order Entry | Multi-table processing, procedures, service programs, subfiles, and validation |
| Pricing and Discounts | Expressions, built-in functions, business rules, and unit testing |
| Billing | Decimal precision, dates, transactions, error handling, and auditability |
| Shipping Status | State transitions, timestamps, APIs, and integration |
| Reporting and APIs | SQL views, joins, JSON, services, modernization, and external access |

## Maintenance and Revalidation Rules

- Record the source title, release, chapter or section, and verification date for every lesson.
- Check current IBM documentation for release-sensitive commands, syntax, tooling, security guidance, and product requirements.
- Use COMMON materials for teaching sequence and lab inspiration, but validate and compile-test all code before publication.
- Translate RDi-specific workflows into a VS Code-first workflow unless the lesson explicitly teaches RDi.
- Label legacy syntax as maintenance literacy rather than the preferred new-development standard.
- Retain the work-in-progress designation for *Modernizing IBM i Applications* until IBM publishes the final Redbook.
- When sources conflict, document the conflict and follow the newest applicable IBM authority.
- Include a source register and release-sensitive checklist with each completed module.

## Immediate Build Queue

1. Module 1 — Reading and Writing Modern RPG
2. Level 100 source pack — variables, control flow, built-in functions, and native I/O
3. SQL foundation map — DDS versus DDL and basic SELECT
4. ILE module map — procedures, modules, service programs, and binding
5. Modernization track — Git, DevOps, testing, AI, and architecture

## Final Sip

A strong curriculum needs the same discipline as a reliable production system: one source of truth, clear ownership, controlled change, and regular validation. The manuals provide the beans, the Redbooks provide the blend, and the Academy turns them into a repeatable learning experience.
