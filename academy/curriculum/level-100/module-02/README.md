# RPGBA-101 Module 2 — Data Structures and Procedures

**Status:** Development Draft  
**Curriculum level:** 100 — Associate Foundations  
**Canonical module ID:** 100-02  
**Working learner title:** Structure the Data, Define the Contract — and Coffee  
**Primary environment:** Visual Studio Code, Code for IBM i, Git/GitHub, IBM Bob  

## Purpose

Module 2 moves the learner from individual variables and introductory internal procedures into deliberate data modeling and procedure contracts. The learner will use modern fully free-form RPG to group related business data, model repeating business entities, reuse definitions safely, and pass data through clear interfaces.

The goal is not to memorize every data-structure or parameter keyword. The goal is to make a supervised associate developer safer when reading, changing, reviewing, and testing real RPG application code.

## Module Rule

A data structure and a procedure interface are executable design decisions. A successful compile proves that the compiler accepted the declarations and calls; it does not prove that the data model represents the business correctly, that a parameter is safe to modify, that optional input was handled, or that callers were not broken.

## Prerequisites

The learner should have completed Module 1 or demonstrate equivalent supervised capability:

- read and map a small fully free-form RPG program;
- declare common scalar values and arrays;
- trace assignments, conditions, and bounded loops;
- create and call a small internal procedure;
- compile through an approved Code for IBM i action and verify the target object;
- test normal, boundary, and invalid cases;
- inspect `git status` and `git diff` before committing;
- use IBM Bob as a reviewed assistant rather than an authority.

## Measurable Learning Outcomes

By the end of Module 2, the learner will be able to:

1. Explain when a data structure is safer and clearer than unrelated standalone fields.
2. Define and use qualified and nested data structures.
3. Process arrays and data-structure arrays with explicit bounds and meaningful indexes.
4. Reuse definitions with `TEMPLATE`, `LIKEDS`, and `LIKE` without creating hidden coupling.
5. Recognize subroutine-based legacy code and explain why a subprocedure often provides a clearer modern boundary.
6. Define matching procedure prototypes and procedure interfaces with deliberate parameter and return-value types.
7. Choose `CONST` or `VALUE` deliberately and explain the risks introduced by optional or variable-size parameter options.
8. Build and test an original customer-validation component that uses data structures and procedures without relying on production data.
9. Review the final Git diff and explain every intentional source change.
10. Use IBM Bob to explain structures, trace contracts, identify possible missed impacts, and suggest tests while independently validating every accepted finding.

## Canonical Lesson Map

| Lesson ID | Lesson | Draft time | Primary skill |
|---|---|---:|---|
| 100-02-01 | Why Data Structures Matter | 50 min | Group business data deliberately |
| 100-02-02 | Qualified and Nested Data Structures | 60 min | Model ownership and hierarchy explicitly |
| 100-02-03 | Arrays and Data Structure Arrays | 70 min | Process repeated business entities safely |
| 100-02-04 | Templates, LIKEDS, LIKE, and POS | 65 min | Reuse definitions without copy/paste drift |
| 100-02-05 | Subroutines Versus Subprocedures | 55 min | Recognize legacy flow and choose clearer boundaries |
| 100-02-06 | Procedure Interfaces, Parameters, and Return Values | 75 min | Define and verify procedure contracts |
| 100-02-07 | CONST, VALUE, OPTIONS, and Parameter Safety | 75 min | Make parameter behavior explicit and safe |
| 100-02-08 | Module Lab — Customer Validation Procedures | 120 min | Integrate the module skills independently |

Estimated complete learner experience: **8–10 hours**, including labs, review, troubleshooting, assessment, and capstone evidence.

## Sample Application Increment

Module 2 extends the Academy Coffee Company sample application with an original **Customer Validation** component. The learner will model customer and address data, validate required fields through procedures, collect validation results, and prove that read-only input data is not unintentionally changed.

This module intentionally does **not** require Db2 persistence, native file I/O, service programs, binder source, or embedded SQL. Those capabilities belong in later modules.

## Tooling Baseline

- Visual Studio Code
- Code for IBM i
- RPGLE language support approved by the Academy environment
- Git and GitHub workflow
- IBM Bob integrated into explanation, review, missed-impact analysis, documentation, and test suggestion activities
- IBM i Access Client Solutions only when a supporting IBM i function is better demonstrated there; it is not the primary authoring environment

## Safety Baseline

- Nonproduction Academy environment only
- Learner-specific or isolated training library and IFS path
- No credentials, tokens, private keys, PHI, client data, or production records in source, prompts, screenshots, evidence, or Git history
- Verify host, profile, branch, source path, build library, program object, and resolved compile action before execution
- No destructive or broad commands copied from AI output without human review
- Compile success is not business, interface, regression, or deployment proof

## Build Status

- [x] Canonical module scope identified
- [x] Development branch created
- [x] Module blueprint started
- [x] Source-validation register started
- [x] Technical validation backlog started
- [x] Capstone blueprint started
- [ ] Lesson source drafts complete
- [ ] Starter and solution RPG source complete
- [ ] Lab workbook complete
- [ ] Instructor guide complete
- [ ] Assessment and answer key complete
- [ ] Slide deck complete
- [ ] IBM i compile/runtime validation complete
- [ ] Independent technical review complete
- [ ] Learner pilot complete
- [ ] Release candidate package approved

## Open Curriculum Decision

The canonical Academy blueprint defines Module 2 as **Data Structures and Procedures**. A Module 1 learner-facing deck currently points next to Db2 access, externally described data, and file-processing fundamentals. Until that sequencing conflict is explicitly resolved, this branch follows the canonical blueprint and records the conflict rather than silently changing the curriculum.
