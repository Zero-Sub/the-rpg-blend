# The RPG Blend Academy — Module 3

## Procedures, Service Programs, and Domain Design

**Status:** Content Complete — IBM i Validation Pending  
**Estimated time:** 8–10 hours including labs and independent challenge  
**Prerequisite:** Modules 0–2 or equivalent demonstrated capability  
**Primary environment:** Visual Studio Code, Code for IBM i, Db2 for IBM i extension, Git, IBM Bob  
**Application:** The RPG Blend Coffee Company

Module 3 moves the learner from useful RPG procedures inside one program to reusable IBM i application capabilities with explicit contracts, modules, service programs, controlled exports, and clear domain ownership.

The learner continues the Coffee Company application rather than starting a disconnected sample. Business behavior is moved into **Model / Domain Services** while presentation and data-access details remain outside the domain contract.

## Learning loop

**Learn → Practice → Prove → Review → Explain**

Core promise: **Understand the system. Make a controlled change. Prove the result. Repeat.**

## Module outcomes

The learner will be able to:

- distinguish programs, modules, procedures, and service programs;
- design `DCL-PR` / `DCL-PI` contracts with deliberate parameter semantics;
- build a `NOMAIN` module with exported procedures;
- create a service program and explain binding by reference;
- control the public interface with binder language and signatures;
- use binding directories deliberately rather than as an unowned dependency bucket;
- evaluate service boundaries using cohesion, coupling, state, and change risk;
- keep SQL, display-file, record-format, and transport details out of domain contracts;
- distinguish business outcomes from technical failures;
- recognize activation-group, static-storage, job-state, library-list, and other hidden-state dependencies;
- prove preserved behavior with compile/object evidence, tests, and Git review;
- use IBM Bob to analyze and review without outsourcing judgment;
- complete an independent domain-service change without step-by-step AI guidance.

## Lesson sequence

1. From Procedure to Capability
2. Procedure Contracts That Mean Something
3. Modules, `NOMAIN`, Exports, and Build Evidence
4. Service Programs and Binding by Reference
5. Binder Language, Export Control, and Signature Stability
6. Domain Design: Put Business Behavior Where It Belongs
7. Error Contracts, State, and Activation-Group Awareness
8. Prove the Refactor and Explain the Design

## Coffee Company target

Module 3 extracts order-pricing and order-validation behavior into an `ORDERDOM` domain service. The public contract uses business-facing request/snapshot/decision structures instead of database rows, display-file fields, or transport payloads.

This is an incremental modernization slice. Module 3 does **not** require a new web UI, API, or a rewrite of the surrounding application.

## Content-complete package

```text
module-03/
├── 00_START_HERE.md
├── STATUS.md
├── README.md
├── MASTER_COURSE_PACKAGE.md
├── STUDENT_COURSEBOOK.md
├── STUDENT_WORKBOOK.md
├── LAB_GUIDE.md
├── INSTRUCTOR_GUIDE.md
├── QUICK_REFERENCE.md
├── ASSESSMENT_AND_KEY.md
├── INSTRUCTOR_DECK_OUTLINE.md
├── GETTING_THE_CODE.md
├── VALIDATION_RUNBOOK.md
├── docs/
│   ├── architecture-decision.md
│   └── evidence-checklist.md
├── src/
│   └── coffee-company/
│       ├── order_domain_contracts.rpgleinc
│       ├── order_domain.rpgle
│       ├── order_domain.bnd
│       └── order_domain_demo.rpgle
└── tests/
    └── order_domain_cases.md
```

## Validation boundary

The instructional content is complete. The module is **not yet a Release Candidate** because live IBM i evidence is still required for the source/build path.

Before RC promotion, validate on the designated IBM i training environment:

- RPG module compile;
- IFS `/INCLUDE` resolution;
- service-program creation from stream-file binder source;
- binding-directory resolution;
- caller bind/runtime behavior;
- exported symbol/signature evidence;
- complete normal/boundary/invalid/regression test matrix;
- current Code for IBM i action behavior;
- current IBM Bob activities;
- independent learner pilot and technical review.

IBM, COMMON, vendor, book, and community material is used only to validate terminology and technical behavior. Academy explanations, examples, labs, tests, and Coffee Company code are original.
