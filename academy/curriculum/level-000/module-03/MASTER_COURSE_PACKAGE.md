# The RPG Blend Academy

## Module 3 — Data Access

**Layer:** 2 — IBM i / RPG Core  
**Status:** Initial canonical blueprint  
**Primary environment:** Visual Studio Code + Code for IBM i + Db2 for i extension  
**Reference application:** Coffee Company

## Purpose

Module 3 teaches an IBM i developer how to read, design, implement, test, and review application data access safely. The learner moves from SQL knowledge to disciplined use of data from RPG and other application boundaries without mixing business rules, orchestration, and persistence concerns.

Technology follows the problem. The module does not teach every possible IBM i data-access technique. It teaches how to choose and defend an appropriate access pattern, implement it safely, prove the result, and preserve enterprise supportability.

## Prerequisite contract

Module 3 depends on completion of:

- Engineering Foundations relevant to source control, specifications, testing, code review, AI-assisted engineering, security, and evidence;
- Module 0 — IBM i Orientation;
- Module 1 — RPG Foundations;
- **Module 2 — Db2 for i and SQL.**

Module 3 must not compensate for missing Module 2 SQL/data-modeling instruction by becoming a second SQL fundamentals course.

## Measurable learning outcomes

By completion, the learner can:

1. identify the data dependencies of an existing RPG program and distinguish business rules from data-access responsibilities;
2. choose between appropriate data-access patterns for a stated requirement and explain the tradeoffs;
3. implement parameterized embedded SQL in RPG for single-row retrieval and controlled multi-row processing;
4. handle SQL result status deliberately, including no-row and error paths, rather than assuming success;
5. preserve null semantics and avoid silent data-quality assumptions;
6. implement a small update inside an explicit transaction/commitment-control boundary when the requirement calls for atomicity;
7. test normal, no-data, boundary, duplicate/ambiguous, null, and failure cases with safe training data;
8. review data-access code for authorization, injection risk, locking/transaction implications, diagnostics, maintainability, and missed impacts;
9. use AI assistance to explain queries, identify dependencies, suggest tests, and review code while independently validating results;
10. explain and defend the selected access pattern, transaction boundary, evidence, and remaining risks.

## Concepts taught

- application data dependency mapping;
- embedded SQL in modern RPG;
- host variables and parameterization;
- single-row retrieval;
- multi-row/cursor processing at an introductory level;
- SQLCODE/SQLSTATE/result handling concepts;
- null handling and indicators or equivalent patterns;
- controlled INSERT/UPDATE/DELETE in training data;
- commitment control and atomicity concepts;
- locking/concurrency awareness;
- data-access procedures and separation of concerns;
- diagnostics and evidence;
- security and least privilege;
- legacy native-record-level-access recognition and interoperability;
- AI-assisted analysis/review.

## Explicitly deferred

To keep the module intentional, defer deeper material to later modules or advanced courses:

- advanced query optimization and indexing;
- advanced dynamic SQL;
- stored procedure design as a primary topic;
- service-program architecture depth;
- distributed transactions;
- APIs/HTTP/JSON;
- high-volume batch tuning;
- full native-record-level-access programming instruction;
- advanced commitment-control recovery design.

## RPG Blend Method alignment

- **PRIMARY:** Assess, Understand, Test, Validate, Govern
- **REINFORCED:** Stabilize, Modernize, Document, Repeat

The learner should assess the existing data contract and dependencies, understand the current access path, stabilize expectations with tests, make a controlled data-access change, validate both data and application behavior, document evidence, and govern the change.

## Blend MVC alignment

Module 3 is the first module where **Data Services** becomes an explicit assessed responsibility.

- **View:** recognition only
- **Controller:** reinforced as orchestration boundary
- **Model / Domain Services:** reinforced; business rules stay here
- **Data Services:** **PRIMARY**

The learner must not place business rules into SQL/data-access procedures merely because the database can express them.

## AI-assisted engineering

The durable competency is independent of product. AI may be used to:

- explain unfamiliar SQL/RPG data-access code;
- map tables, views, procedures, and calling dependencies;
- identify likely missed impacts;
- suggest test cases and failure paths;
- review parameterization, null handling, transaction boundaries, and diagnostics;
- draft documentation.

IBM Bob may be the Academy's primary IBM i implementation example where available. AI output is never accepted as proof. The learner remains responsible for source validation, data safety, testing, security, and final decisions.

## Coffee Company starting state

Module 3 begins from the Module 2 ending state: the Coffee Company repository has a known-good Db2 schema/data model, approved training data, tested SQL statements, and the Module 1 RPG pricing/application slice.

Module 3 connects the application to that data model without introducing unrelated application features.

## Coffee Company progression

The learner evolves the application through a controlled vertical slice such as:

1. retrieve one product/order/customer record by a supplied key;
2. handle not-found and null cases explicitly;
3. retrieve a bounded set of rows for a real application use case;
4. move data access behind a dedicated procedure/data-service responsibility;
5. perform one controlled write to training data;
6. add an atomic multi-statement change only if the Coffee Company requirement genuinely requires it;
7. prove runtime behavior and database state before/after;
8. document the access contract and evidence.

No arbitrary database feature is added merely to create an exercise.

## Proposed lesson sequence

### Lesson 3.1 — Map the Data Dependency

**Learn:** What data does this program read/change, and why?  
**Practice:** Trace Coffee Company RPG to its Db2 dependencies and identify business-rule vs data-service responsibilities.  
**Prove:** Produce a data-dependency map with evidence.  
**Review:** Label facts, assumptions, and unknowns.  
**Explain:** Defend the proposed data boundary.

### Lesson 3.2 — Retrieve One Row Safely

**Learn:** Embedded SQL structure, host variables, parameterization, result status, no-row handling.  
**Practice:** Retrieve one Coffee Company row using a supplied key.  
**Prove:** Normal + not-found + invalid-input evidence.  
**Review:** Check parameterization and assumptions.  
**Explain:** What did the SQL result prove?

### Lesson 3.3 — Preserve Data Meaning

**Learn:** Null semantics, defaults, conversion risks, duplicate/ambiguous expectations.  
**Practice:** Handle nullable Coffee Company data without silently replacing unknown with a business value.  
**Prove:** Null/non-null test evidence.  
**Review:** Check for accidental semantic changes.  
**Explain:** Distinguish null from empty/zero/default.

### Lesson 3.4 — Process Multiple Rows Deliberately

**Learn:** Cursor or appropriate bounded multi-row access pattern; ordering and termination.  
**Practice:** Retrieve a real bounded Coffee Company result set.  
**Prove:** Empty/one/many/boundary evidence.  
**Review:** Check ordering, termination, and volume assumptions.  
**Explain:** Why this pattern fits the requirement.

### Lesson 3.5 — Separate Data Services

**Learn:** Blend MVC responsibility separation.  
**Practice:** Move persistence logic behind a data-access procedure while preserving business rules in Model / Domain Services.  
**Prove:** Before/after dependency map + regression evidence.  
**Review:** Check that SQL did not absorb unrelated business policy.  
**Explain:** Defend the responsibility boundary.

### Lesson 3.6 — Change Data Safely

**Learn:** Controlled DML, row targeting, affected-row expectations, authorization, diagnostics.  
**Practice:** Perform one approved Coffee Company training-data change.  
**Prove:** Before/after state + affected-row/runtime evidence.  
**Review:** Check unintended-row risk and rollback/recovery plan.  
**Explain:** What evidence proves only the intended data changed?

### Lesson 3.7 — Atomic Work and Transaction Awareness

**Learn:** Commitment-control/transaction concepts, atomicity, commit/rollback, locking awareness.  
**Practice:** Implement a transaction only if the selected Coffee Company requirement needs multiple changes to succeed/fail together.  
**Prove:** Success and controlled-failure evidence.  
**Review:** Check transaction boundary and side effects.  
**Explain:** Why these operations belong in one unit of work.

### Lesson 3.8 — Prove, Review, and Explain

**Learn:** No major new syntax.  
**Practice:** Assemble full data-access evidence.  
**Prove:** Independent Coffee Company change.  
**Review:** Self, compiler/SQL diagnostics, tests, Git, AI-assisted review, human-ready review.  
**Explain:** Defend the access pattern, transaction boundary, tests, and evidence without AI assistance.

## Guided-lab standard

Every lab uses:

1. Before you start
2. Your goal
3. Do this
4. Expect to see
5. If you do not see it
6. Prove it
7. Explain it

## Independent challenge

Given an existing Coffee Company RPG data-access requirement, the learner independently:

1. maps the current data dependencies;
2. identifies the required data contract;
3. selects an access pattern;
4. writes acceptance criteria;
5. implements the smallest safe change;
6. handles not-found/null/error paths;
7. tests the required cases;
8. proves target database/application state;
9. reviews Git and AI findings;
10. documents the result;
11. explains and defends the decision without AI assistance.

Course references are allowed. AI may help after the first independent attempt. Step-by-step instructor or AI workflow direction is not independent completion.

## Self-led intervention scale

- 0 — Independent
- 1 — Clarification only
- 2 — Hint
- 3 — Step-by-step guidance
- 4 — Instructor performed an action

Target for independent challenge: Level 0–1. Repeated Level 2–4 intervention is curriculum evidence requiring remediation.

## Enterprise safety requirements

- approved nonproduction/training data only;
- least privilege;
- parameterized input rather than concatenating untrusted values into SQL;
- explicit target schema/table/view and row-selection expectations;
- no PHI/customer data/secrets in evidence or AI prompts;
- deliberate null/no-row/error handling;
- transaction/locking implications considered before writes;
- before/after evidence for DML;
- rollback/recovery path understood before destructive work;
- no production DDL/DML as a classroom shortcut;
- Git and human review boundaries preserved;
- legacy access patterns recognized without declaring them universally wrong.

## Required evidence

- requirement and acceptance criteria;
- dependency map;
- source/diff;
- SQL/data-access code;
- compile/diagnostic evidence;
- target-object evidence;
- normal/no-row/null/boundary/failure test results as applicable;
- database before/after evidence for writes;
- transaction evidence when applicable;
- AI finding disposition;
- Git evidence;
- explain-back result.

## Technical claims requiring verification

Before publication/delivery, verify against current primary IBM documentation and the actual training environment:

- current IBM i embedded SQL RPG syntax and precompiler/compiler workflow;
- SQL communication area / SQLSTATE / SQLCODE guidance taught in the course;
- null-handling implementation details used in examples;
- commitment-control requirements and behavior for the chosen table/object types;
- cursor/multi-row behavior used in labs;
- Db2 for i extension workflow and labels;
- Code for IBM i build/action workflow;
- IBM Bob capabilities and labels where shown;
- public training-system restrictions, especially DML and commitment control.

## Source basis for architecture

Reference sources used to establish technical coverage include:

- IBM i 7.6 ILE RPG Programmer's Guide and ILE RPG Reference (primary RPG validation sources);
- COMMON/iBegin Db2 for i, Db2 for i Tooling, and Db2 for i Programming materials (reference coverage/terminology only);
- COMMON SQL Bootcamp materials (reference coverage/terminology only);
- Academy source/manual register.

Third-party structure, examples, exercises, diagrams, and wording are not reused as Academy content. Academy examples and labs remain original.

## Current decision

**STARTED — ARCHITECTURE DRAFT**

Do not generate final learner/instructor publication artifacts until the Module 2 ending-state contract and the Module 3 Coffee Company data model/access requirements are reconciled. This prevents prerequisite drift and duplicate SQL instruction.
