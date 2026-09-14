# The RPG Blend Academy

## Module 3: Procedures, Service Programs, and Domain Design

**Status:** In Development  
**Estimated time:** 8–10 hours including labs and independent challenge  
**Prerequisite:** Modules 0–2 or equivalent demonstrated capability  
**Primary environment:** Visual Studio Code, Code for IBM i, Db2 for IBM i extension, Git, IBM Bob

## Why this module exists

Module 1 teaches the learner to read, change, test, and extract focused RPG procedures. Module 2 establishes SQL-centered data skills. Module 3 brings those capabilities together at an architectural boundary: reusable business behavior.

The learner moves from “this code works inside this program” to “this capability has a clear contract, controlled public interface, predictable dependencies, test evidence, and a reason to exist.”

The goal is not to create service programs everywhere. The goal is to make business behavior easier to understand, reuse, test, govern, and change safely.

## Measurable learning objectives

By the end of Module 3, the learner can:

1. Explain the difference between a program, module, procedure, and service program on IBM i.
2. Design a focused procedure contract with `DCL-PR` and `DCL-PI` and explain parameter intent.
3. Separate reusable application-facing contracts from implementation details.
4. Create and compile a `NOMAIN` RPG module containing exported procedures.
5. Create a service program from one or more modules and explain binding by reference.
6. Use binder language to control exports and explain the purpose of a service-program signature.
7. Use a binding directory or another approved build mechanism deliberately.
8. Evaluate procedure/service-program boundaries using cohesion, coupling, hidden state, and change risk.
9. Move Coffee Company business rules into Model / Domain Services without leaking SQL, display-file, record-format, or transport details into the domain contract.
10. Define stable result/error contracts that distinguish business outcomes from technical failures.
11. Explain how activation-group lifetime, static storage, job-scoped values, library-list assumptions, and other hidden state can affect reusable services.
12. Prove preserved behavior with build evidence, object evidence, tests, and Git review.
13. Use IBM Bob for explanation, dependency discovery, refactoring review, and test suggestions while independently validating material findings.
14. Complete a new domain-service change without step-by-step AI or instructor direction and defend the design.

## Five mental models

### 1. Procedure contract

A procedure is not merely a smaller block of code. Its interface is a promise about inputs, outputs, side effects, and failure behavior.

### 2. Module versus service program

A module is a compiled building block. A service program is a reusable runtime capability created by binding modules and exposing selected procedures.

### 3. Public interface versus implementation

Shared contracts are intentionally small and stable. Internal helpers, SQL details, file formats, job messages, and other implementation details remain behind the boundary unless deliberately made part of the contract.

### 4. Domain ownership

Business rules belong in Model / Domain Services. Presentation, orchestration, and persistence have different responsibilities.

### 5. Reuse requires lifecycle discipline

A reusable service needs a cohesive purpose, ownership, source control, compatibility strategy, test evidence, understandable state behavior, and a controlled build/release process.

## Lesson 1 — From Procedure to Capability

### Learn

- Review internal procedures and explicit contracts.
- Distinguish code decomposition from architectural separation.
- Define cohesion and coupling in practical IBM i terms.
- Identify presentation, orchestration, business-rule, and data-access responsibilities in mixed code.
- Recognize that extraction is not automatically improvement.

### Practice

Map the current Coffee Company order flow. Classify each responsibility and select one business capability that should change independently from the surrounding program.

### Prove

Submit a before-state responsibility map and dependency list plus a written boundary rationale.

### Bob-assisted activity

Complete the first map manually. Then ask Bob to identify likely boundaries and missed dependencies. Disposition material findings as **Accept, Reject, Investigate, or Defer**, with evidence.

### Independent task

Analyze a second mixed procedure without Bob and identify which logic should remain local versus become a reusable capability.

## Lesson 2 — Procedure Contracts That Mean Something

### Learn

- `DCL-PR` and `DCL-PI` as a caller/callee agreement.
- Return values versus output parameters.
- `CONST` and `VALUE` as deliberate parameter semantics.
- Qualified templates/data structures for business-facing request and result shapes.
- Required versus optional inputs.
- Why a database row or display-file record is usually a poor domain contract.
- Naming procedures around business capabilities instead of implementation steps.

### Practice

Define `OrderRequest_t`, `ProductSnapshot_t`, and `OrderDecision_t` for the Coffee Company.

### Prove

Compile a caller and implementation against the same contract and explain each parameter’s ownership and direction.

### Bob-assisted activity

Use Bob after the learner draft to identify ambiguity, accidental mutation, implementation leakage, and missing boundary cases.

## Lesson 3 — Modules, NOMAIN, Exports, and Build Evidence

### Learn

- A `*MODULE` is created by module compilation and later bound into a program or service program.
- A `NOMAIN` RPG module has no program entry procedure and can contain reusable procedures.
- `EXPORT` identifies procedures intended to be visible outside the module; the final service-program interface is still controlled by the binder step.
- Reusable service construction makes module/binder steps visible rather than hiding everything behind one bound-program compile.
- Build evidence must identify the source, command, target library, module, and final object.

### Practice

Move the selected Coffee Company rule into `order_domain.rpgle`, compile it with an approved `CRTRPGMOD` Code for IBM i Action, and verify the intended `ORDERDOM *MODULE` object.

### Prove

Capture the source revision, resolved command, compiler diagnostics, target module, and focused Git diff.

## Lesson 4 — Service Programs and Binding by Reference

### Learn

- A `*SRVPGM` exposes procedures to bound ILE callers.
- A service program has no normal program entry point and is not invoked with ordinary `CALL` as though it were a `*PGM`.
- Callers bind to exported procedures by reference.
- One service program may contain multiple modules, but packaging should follow cohesion and lifecycle rather than convenience alone.
- Binding directories help resolve approved reusable dependencies but require ownership and hygiene.

### Practice

Create `ORDERDOM *SRVPGM`, add it to the learner application binding directory, and compile a small caller that uses the exported procedure.

### Prove

Capture service-program object evidence, binder/export evidence, caller build evidence, and runtime behavior.

## Lesson 5 — Binder Language, Export Control, and Signature Stability

### Learn

- Binder language defines the service program’s public export surface.
- The Academy uses explicit binder source for reusable application services rather than exporting every eligible symbol.
- Signatures provide a compatibility checkpoint between a service program and programs bound to it.
- Interface changes require a compatibility decision; they are not merely “recompile until it works.”
- Modern Academy source keeps binder source under Git with the rest of the application.

### Academy binder source pattern

```text
STRPGMEXP PGMLVL(*CURRENT) SIGNATURE('RPGBAORDDOMV1')
  EXPORT SYMBOL('EVALUATEORDER')
  EXPORT SYMBOL('CALCULATEORDERTOTAL')
ENDPGMEXP
```

### Practice

Build `ORDERDOM` from controlled binder source. Introduce a disposable interface change on the lab branch, predict its impact, observe evidence, then restore the supported contract.

### Prove

Explain the public interface, why each symbol is exported, and why unrelated helpers remain private.

## Lesson 6 — Domain Design: Put Business Behavior Where It Belongs

### Learn

- Model / Domain Services own reusable business rules and domain behavior.
- Controllers coordinate application flow; they do not become the home of core business rules.
- Data Services own persistence mechanics and technical data-access errors.
- Domain contracts should not expose SQLCODE, SQLSTATE, record formats, display-file fields, HTTP payloads, or database row layouts by default.
- Pure or mostly pure rule procedures are easier to test and reuse than procedures that combine UI, SQL, committing, logging, and formatting.

### Practice

Extract Coffee Company order-pricing and order-validation behavior into `ORDERDOM` while preserving required behavior.

### Prove

Run the same boundary matrix before and after extraction and show no unintended behavior change.

## Lesson 7 — Error Contracts, State, and Activation-Group Awareness

### Learn

- Distinguish expected business outcomes from technical failures.
- Return stable application-facing result identifiers; keep detailed technical evidence available for diagnostics without making it the business contract.
- Activation groups affect runtime lifetime and shared runtime resources.
- Static storage, data areas, job-scoped values, cached values, open data paths, library-list assumptions, and other implicit state can make reusable services harder to reason about.
- Prefer explicit inputs, outputs, and scoped state for new domain services.

### Practice

Add invalid-order, inactive-product, insufficient-quantity, and technical-failure outcomes to the design without making callers depend on SQLCODE or a database row layout.

### Prove

Create a failure-mode table with outcome type, responsible layer, returned contract value, and diagnostic evidence.

### Bob-assisted activity

Ask Bob to search for hidden state and error leakage. Verify each finding against source, object, or runtime evidence before accepting it.

## Lesson 8 — Prove the Refactor and Explain the Design

### Learn

- Compiler acceptance is not behavior proof.
- Runtime evidence is not architecture proof.
- Architecture evidence must show that the boundary is intentional and implementation details did not leak upward.
- Git review must include contract and binder-source changes, not only RPG implementation changes.

### Practice

Perform a peer-style review of the completed Module 3 vertical slice.

### Prove

Deliver one evidence packet containing:

- source revision and focused diff;
- resolved build commands;
- `*MODULE`, `*SRVPGM`, and caller object evidence;
- binder exports/signature evidence;
- test results;
- known limitations;
- Bob findings/dispositions;
- independent explain-back.

## Guided labs

### Lab 1 — Find the Boundary

Classify mixed Coffee Company responsibilities and choose one domain rule for extraction.

### Lab 2 — Build a Reusable Module

Create the contract include, `NOMAIN` module, exported procedure, compile action, and module evidence.

### Lab 3 — Create and Bind a Service Program

Create binder source, service program, binding-directory entry, and caller.

### Lab 4 — Move Coffee Company Rules into Domain Services

Refactor pricing/validation behavior without changing required outputs.

### Lab 5 — Break It Safely

Make one controlled contract/export change on a disposable branch, predict the impact, observe the evidence, then restore compatibility.

## Independent challenge — Do It Without Me

New requirement:

> A product marked inactive cannot be ordered, and the returned business result must distinguish an inactive product from insufficient quantity.

Without step-by-step AI or instructor workflow direction, the learner must:

1. locate the correct domain contract and implementation;
2. write acceptance criteria;
3. decide whether the public contract must change;
4. make the smallest correct source change;
5. compile the module, service program, and intended caller;
6. verify the intended IBM i objects were updated;
7. test normal, inactive-product, insufficient-quantity, invalid, and regression cases;
8. review the Git diff and binder-source impact;
9. ask Bob for review only after the independent implementation is complete;
10. explain the design and evidence without AI assistance.

## Assessment

- **Knowledge check — 20%**: object model, contracts, binding, binder source, signatures, activation groups, cohesion/coupling, errors.
- **Practical implementation — 60%**: independent Coffee Company change and evidence.
- **Explain-back/review — 20%**: boundary, contract, binding strategy, failure behavior, and proof.

### Minimum completion standard

- 80% overall.
- No critical safety failure.
- Practical implementation compiles and executes in the approved training environment.
- Required tests pass.
- Evidence identifies source revision, IBM i context, build library, target objects, and observed behavior.
- Learner can explain the final design without Bob open.

## IBM Bob rules

Bob may:

- explain unfamiliar RPG/ILE relationships;
- identify candidate boundaries and dependencies;
- review a focused procedure contract;
- explain binder/signature concepts;
- identify likely hidden state or implementation leakage;
- suggest negative and regression tests;
- draft documentation from verified facts.

Bob may not replace:

- first-pass learner analysis where required;
- environment verification;
- acceptance criteria;
- compile/object/runtime evidence;
- human architecture review;
- security and data-handling rules;
- the independent challenge.

## Production safety and governance

- Work only on the assigned non-production host/profile/library/path.
- Verify host, identity, source revision, build library, and target object before build actions.
- Do not request broader authority simply to make a lab compile.
- Do not expose credentials, tokens, PHI, customer data, production source, unrestricted logs, or confidential configuration in Git or AI prompts.
- A public service-program interface change is an application dependency change and requires deliberate review.
- Do not rely on hidden library-list, adopted-authority, activation-group, or job-state behavior without documenting and testing the dependency.

## Completion criteria

- Eight lesson activities completed.
- Five guided labs completed with evidence.
- Independent challenge completed without step-by-step AI assistance.
- Knowledge assessment at or above 80%.
- Module/service-program/caller evidence is internally consistent.
- Binder exports/signature are documented.
- Git diff contains only intentional changes.
- Required before/after tests pass.
- Bob findings are dispositioned with evidence.
- Learner can explain the final boundary, contract, binding, and error strategy independently.

## Release status

This package is in development. Promotion to release candidate requires live IBM i compile/runtime validation, Code for IBM i workflow validation, binder-source validation, technical review, learner pilot, and closure of Critical/High defects.

## Primary validation sources

- IBM i 7.6 ILE RPG Programmer’s Guide.
- IBM i 7.6 ILE RPG Reference.
- IBM i 7.6 ILE Concepts / service-program and binder-language documentation.
- Current Code for IBM i documentation.
- Current IBM Bob documentation for version-sensitive behavior.
- Canonical RPG Blend Method and Blend MVC Architecture.
- Coffee Company Place Order reference slice.

Third-party and IBM sources validate terminology and behavior. Academy sequence, explanations, examples, labs, tests, and Coffee Company source remain original.