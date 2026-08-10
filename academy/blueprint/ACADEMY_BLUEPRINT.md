# The RPG Blend Academy Blueprint

**Status:** Canonical Academy blueprint  
**Owner:** George Van Eaton  
**Repository:** `Zero-Sub/the-rpg-blend`  
**Curriculum map:** [`../curriculum/CURRICULUM_MAP.md`](../curriculum/CURRICULUM_MAP.md)  
**Last aligned:** August 10, 2026

---

## 1. Mission

The RPG Blend Academy prepares developers to contribute safely and effectively to a modern IBM i development team.

The Academy teaches IBM i, RPG, Db2 for i, SQL, ILE, Git-based delivery, production support, modernization, and responsible AI-assisted development as one connected engineering discipline rather than as disconnected product topics.

The Academy does not republish IBM, COMMON, vendor, book, or community training. Those materials are reference sources used to validate terminology, technical accuracy, coverage, and progression. Academy explanations, examples, code, labs, diagrams, quizzes, assessments, and capstones are original.

## 2. Vision

Build a practical developer learning path that can serve:

- new Associate RPG Developers
- developers transferring from another language or platform
- experienced RPG developers modernizing their skills
- technical mentors and team leads
- engineering managers and architects building sustainable IBM i capability

The Academy should support public education, internal onboarding, workshops, conference sessions, downloadable guides, books, and future certification-style evidence of skill.

## 3. Founder and Lead Instructor

The RPG Blend Academy was created by **George Van Eaton**, an IBM i engineering leader with more than 30 years of experience in RPG, Db2 for i, SQL, software architecture, modernization, production support, technical standards, hiring, and developer development.

George is the author of *The RPG Blend* and a contributing author to the IBM Redbooks work-in-progress publication *Modernizing IBM i Applications*. The **work-in-progress** designation must remain until IBM publishes a final edition.

## 4. Academy Promise

Every Academy module must be:

- technically accurate
- practical and production-aware
- approachable for a developer who is new to IBM i
- explicit about legacy recognition versus preferred modern practice
- built around observable skills rather than passive completion
- validated against authoritative sources
- demonstrated in modern tooling whenever practical
- integrated with responsible IBM Bob use

Learners should understand not only how syntax works, but why it exists, where it is used, what can fail, how to troubleshoot it, and how to prove a change is safe.

## 5. Target Learner

The primary learner already understands basic programming concepts but may be new to IBM i and RPG. The learner may be a recent graduate, career changer, or developer transferring from another platform.

The target outcome is not merely RPG familiarity. The learner must be able to work safely inside an enterprise IBM i development team with normal review and mentoring.

## 6. Learning Progression

```text
IBM i newcomer
      ↓
Platform-aware developer
      ↓
RPG-fluent developer
      ↓
Database-aware developer
      ↓
Safe application developer
      ↓
Team delivery contributor
      ↓
Modernization-capable engineer
```

Progression is based on demonstrated capability, not simply reading lessons or watching videos.

## 7. Canonical Curriculum Map

The following eight-module sequence is authoritative. Detailed lesson plans may evolve inside a module, but they must not silently change the module order or purpose.

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

### Why this order

The path deliberately moves from language fluency to data fluency before mixing RPG and database-access techniques. Learners then modularize the application, learn to diagnose and test it, deliver changes through a team workflow, and finally integrate the pieces into an architecture and capstone.

This prevents the curriculum from teaching isolated RPG syntax for too long before showing the database-centric nature of real IBM i applications.

## 8. Module Outcomes

### Module 0 — Getting Started

Learners establish the IBM i mental model, connect from Visual Studio Code, navigate the platform safely, compile and run a small program, understand the basic source-to-object loop, and begin using Git and IBM Bob responsibly.

### Module 1 — RPG Fundamentals

Learners read and write fully free-form RPG, work with declarations and common data types, build expressions, make decisions, loop safely, use selected built-in functions, and prove behavior through simple tests and review.

### Module 2 — Db2 for i + SQL

Learners understand Db2 for i as an integrated part of IBM i and build database fluency before writing RPG data-access logic.

Expected coverage includes:

- Db2 for i and its relationship to IBM i
- native IBM i database terminology compared with SQL terminology
- schemas and libraries
- tables, physical files, columns, fields, rows, records, keys, and members
- SQL DDL fundamentals
- primary keys, foreign keys, constraints, views, and indexes at an introductory level
- SELECT, WHERE, ORDER BY, expressions, aliases, and NULL awareness
- joins and basic aggregation
- INSERT, UPDATE, and DELETE
- explicit safe-update habits
- data-quality and integrity concepts
- Db2 for i tooling in Visual Studio Code
- ACS Run SQL Scripts when its capabilities make it the better tool
- Bob-assisted SQL explanation, review, and test suggestions with human validation

Module 2 does **not** become the embedded-SQL-in-RPG module. That integration belongs in Module 3.

### Module 3 — Files + Data Access

Learners connect RPG to business data using both the native record-level model they will encounter in existing applications and modern SQL-based access.

Expected coverage includes native I/O, file declarations, keyed access, sequential reads, writes and updates, locking, embedded SQL, host variables, result handling, cursors at the appropriate introductory depth, transactions, commitment control, diagnostics, and data-access error handling.

### Module 4 — Procedures + ILE

Learners move from single-program thinking toward reusable application components using data structures, prototypes, subprocedures, procedure interfaces, parameters, modules, service programs, binding, activation groups, and clear contracts.

### Module 5 — Debug + Test

Learners diagnose compile and runtime failures using Problems, compiler diagnostics, job logs, call stacks, debugging tools, SQL diagnostics, and repeatable tests. Boundary, negative, and regression testing become normal development behavior rather than an afterthought.

### Module 6 — Git + Team Delivery

Learners work through a realistic team change: branch, edit, review, test, record build evidence, resolve feedback, and prepare controlled promotion. The focus is source control as an engineering workflow rather than Git as a backup utility.

### Module 7 — Architecture + Capstone

Learners integrate the course into a small but credible IBM i application. The module introduces APIs, SQL services, application boundaries, modernization patterns, and architectural tradeoffs, then requires a final independent application change with evidence, review, testing, and explanation.

## 9. Primary Development Environment

The Academy teaches primarily through:

- Visual Studio Code
- Code for IBM i
- Db2 for i extension
- Git and GitHub workflows
- IBM i Access Client Solutions when it remains the appropriate tool
- IBM Bob for AI-assisted IBM i development and learning

SEU, PDM, RDi, and green-screen techniques are taught when learners need to recognize, support, or translate existing workflows. They are not the Academy default development experience.

A modern editor changes the experience, not the accountability. The learner remains responsible for host, identity, target, command, source, result, evidence, and production safety.

## 10. IBM Bob Integration

IBM Bob is integrated throughout the learning path rather than isolated in an optional AI module.

Learners use Bob to:

- explain unfamiliar RPG, CL, SQL, DDS, and application logic
- analyze program and data flow
- identify dependencies and possible missed impacts
- generate and refine documentation
- assist with modernization
- review code
- diagnose errors
- suggest tests
- support learning without replacing understanding

Each meaningful Bob activity should teach a validation step. Learners remain accountable for correctness, security, licensing, testing, and code quality.

Every module also includes an independent task that cannot be completed merely by accepting Bob output.

## 11. Standard Lesson Design

Each lesson must include:

- prerequisites
- measurable learning objectives
- why the topic matters in real IBM i development
- concepts and terminology before syntax
- original Academy examples
- VS Code demonstration whenever practical
- a Bob-assisted activity
- a knowledge check
- deliberate practice or a lab increment
- an independent learner task
- production-safety and security considerations
- common mistakes and troubleshooting
- completion criteria
- source validation notes

Legacy examples should be clearly marked as legacy, transitional, or still-valid practice. Modern recommendations should not erase operational knowledge needed to support existing systems.

## 12. Lab Standard

Labs use the **RPG Blend Coffee Company** sample application and must be executable, reviewable, and resettable.

Each lab identifies:

- business scenario
- objective
- repository path and starting state
- required library, schema, and objects
- ordered tasks
- expected result
- repeatable validation
- likely failures and troubleshooting
- reflection questions
- cleanup or reset steps
- instructor solution and scoring guidance

Labs may use public IBM i environments such as PUB400 where appropriate, but instructions must account for shared-system limits, learner-specific libraries, permissions, and cleanup.

No Academy lab requires production access or real customer data.

## 13. Assessment Model

Assessment verifies skill, not trivia.

Each module should combine:

- knowledge and terminology
- code or SQL reading
- hands-on implementation
- troubleshooting
- professional judgment

Passing requires more than a quiz score. A learner must complete required practical work safely and explain the solution.

Critical failures include exposing credentials or sensitive data, destructive work outside the approved training boundary, unresolved data-integrity defects, ignoring required error handling, or submitting AI-generated work the learner cannot explain.

## 14. Sample Application

The curriculum uses one connected business application: **The RPG Blend Coffee Company Order Management System**.

Core areas include:

- Customer Master
- Product Catalog
- Inventory
- Pricing
- Order Entry
- Billing
- Shipping
- Reporting
- APIs and Integration
- Audit and Operational Logging

The application grows with the curriculum rather than being replaced by disconnected examples.

```text
User / Client
      ↓
Application Entry Point
      ↓
RPG Procedures / Services
      ↓
Validation and Business Rules
      ↓
Data Access
      ↓
Db2 for i
      ↓
Logging, Evidence, Support
```

Module 2 establishes the database foundation that later modules consume.

## 15. Technical Direction

Preferred new Academy development emphasizes:

- fully free-form RPG
- meaningful names
- qualified data structures
- procedures with explicit interfaces
- SQL DDL for new relational database objects
- SQL where it improves clarity, integrity, and set-based processing
- native I/O literacy for real-world support
- Git-based source control
- repeatable builds
- explicit error handling
- appropriate tests
- least privilege
- evidence-based review

The Academy does not declare every legacy technique wrong. It teaches learners to distinguish historical constraints, still-valid platform capabilities, transitional approaches, and preferred modern design.

## 16. Source Governance

Source authority follows this order:

1. Current IBM product documentation for release-sensitive behavior
2. Current IBM manuals and references
3. IBM Redbooks for architecture and modernization strategy
4. COMMON and reputable vendor/community training for instructional perspective
5. Academy experience and recommendations

Every lesson records the source used to validate material claims. Version-sensitive information must be rechecked before publication.

Uploaded materials are references. Do not copy substantial passages, slide structures, diagrams, labs, scripts, or exercises into Academy content.

When sources conflict, document the conflict and resolve it against the newest applicable primary source. Do not silently blend incompatible guidance.

## 17. Canonical Academy Artifacts

Maintain one current version of each:

- Academy curriculum map
- Course catalog
- Learning-path architecture
- Competency matrix
- Course design standard
- Lesson template
- Lab template
- Assessment standard
- Source and manual register
- Terminology guide
- Code-example repository structure
- Publication backlog
- Version and review history

When a decision changes the curriculum, update the canonical artifacts instead of creating a competing roadmap.

## 18. Module Deliverables

A release-ready module should be capable of producing:

- canonical Markdown lessons
- source code and SQL
- learner workbook
- course book
- instructor guide
- facilitator or pilot guide
- labs and starter assets
- instructor solutions
- knowledge checks and module assessment
- answer key and rubric
- branded presentation deck
- setup and environment guide
- source validation register
- publication or release manifest
- GitHub learner package

The canonical written source should drive derivative formats to reduce drift.

## 19. Internal Associate Developer Adaptation

The public Academy teaches transferable IBM i development skills. An internal onboarding overlay may add organization-specific architecture, security, environments, naming standards, source control, deployment, ticketing, incident response, and domain knowledge without changing the public technical core.

A new associate should move from supervised execution toward independent contribution as evidence accumulates across the modules.

## 20. Quality Review

Every lesson and module passes:

1. technical review
2. instructional review
3. source review
4. code and SQL validation
5. tooling validation
6. lab validation
7. editorial review
8. production-safety review
9. Bob/AI accountability review
10. pilot learner review before final publication when practical

## 21. Definition of Done

### Lesson Done

- objectives are measurable
- examples are original and technically validated
- learner practice exists
- Bob activity includes validation
- independent work exists
- common mistakes and troubleshooting are covered
- safety considerations are explicit
- sources are recorded

### Module Done

- all lessons complete
- module lab or project complete
- code and SQL validated on the documented environment
- assessments and answer keys complete
- learner and instructor materials complete
- source register complete
- branded presentation complete
- completion criteria defined
- release package reviewed

### Learning Path Done

- all eight modules complete
- final capstone complete
- competency evidence defined
- learner progression criteria defined
- feedback incorporated

## 22. Governance and Change Control

George Van Eaton owns the Academy curriculum structure, technical direction, brand voice, and release approval.

Material changes to module order, learning outcomes, tooling direction, sample-application architecture, or production-safety expectations require an explicit curriculum decision and updates to the canonical Curriculum Map and this Blueprint.

The eight-module roadmap in Section 7 supersedes the older level-based module catalog previously stored in this Blueprint.

## 23. Current Build Plan

1. Maintain Module 0 — Getting Started as the completed onboarding foundation.
2. Maintain Module 1 — RPG Fundamentals as the completed language foundation.
3. Build **Module 2 — Db2 for i + SQL** next.
4. Validate Module 2 in Visual Studio Code with the Db2 for i extension and ACS where appropriate.
5. Build Module 3 — Files + Data Access after the learner has database fluency.
6. Continue through Procedures + ILE, Debug + Test, Git + Team Delivery, and Architecture + Capstone.
7. Update learner-facing roadmap visuals and release packages from this sequence.

## 24. Final Sip

A useful IBM i curriculum should work like a dependable software system: one architecture, clear interfaces, validated components, controlled changes, and evidence that the whole thing works together. The Academy's job is not to create developers who can repeat syntax. It is to develop engineers who can understand the platform, protect the data, make a safe change, prove it, and explain it to the next person.
