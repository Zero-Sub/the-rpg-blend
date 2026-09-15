# The RPG Blend Academy

## Module 3 — Procedures, Service Programs, and Domain Design

**Status:** Content Complete — IBM i Validation Pending  
**Estimated time:** 8–10 hours

## Purpose

Module 3 teaches you how to turn focused RPG logic into a reusable IBM i application capability with a deliberate public contract, a `NOMAIN` module, a service program, controlled exports, predictable dependencies, and test evidence.

You will continue the Coffee Company application. The goal is not to use service programs everywhere. The goal is to move business behavior into a boundary that is easier to understand, test, review, and change safely.

## Prerequisites

Before starting, you should be able to work in Visual Studio Code with Code for IBM i and Git; read and change modern fully free-form RPG; use procedures and `DCL-PR`/`DCL-PI`; compile and inspect diagnostics; understand basic Db2 for i/SQL concepts; and verify IBM i context before building.

## Learning objectives

By completion you should be able to explain programs/modules/procedures/service programs; design useful procedure contracts; build a `NOMAIN` module; create and bind a service program; control exports with binder language/signatures; evaluate cohesion/coupling/state; keep SQL/UI/transport details outside domain contracts; distinguish business outcomes from technical failures; use IBM Bob safely for review; and independently complete a domain-service change with evidence.

# Lesson 1 — From Procedure to Capability

An internal procedure can make one program easier to read without creating a reusable architectural boundary. Module 3 asks whether a business responsibility should become a capability with its own contract and lifecycle.

A good boundary has high cohesion: the behavior inside belongs together for one reason. It also limits coupling: callers should not need to know how the capability performs its work.

For the Coffee Company, classify each part of the order flow as presentation, orchestration, business behavior, or data access. Select one business rule that should change independently from the surrounding program.

**Bob activity:** make the map yourself first. Then ask Bob to identify likely missed dependencies. Record meaningful findings as Accept, Reject, Investigate, or Defer.

**Evidence:** responsibility map, dependency list, and boundary rationale.

# Lesson 2 — Procedure Contracts That Mean Something

`DCL-PR` describes what a caller may rely on. `DCL-PI` defines how the called procedure receives that contract. A useful contract communicates business meaning rather than mirroring a display file or database record.

Use deliberate parameter semantics. `CONST` communicates that a procedure should not modify the caller's value. `VALUE` requests pass-by-value behavior where appropriate. Return values are often useful for one result; output structures are useful when the operation returns a richer decision.

Module 3 uses three business-facing shapes:

- `OrderRequest_t`: customer, product, quantity requested.
- `ProductSnapshot_t`: trusted product facts required by the rule.
- `OrderDecision_t`: whether the order is allowed plus stable result information.

These structures are not display records or SQL rows.

**Practice:** explain every field in the contract and why it belongs there.

**Evidence:** compile agreement between caller and implementation plus parameter-ownership explanation.

# Lesson 3 — Modules, NOMAIN, Exports, and Build Evidence

A `*MODULE` is an ILE building block created by compilation. It is not the final runnable application object. A `NOMAIN` RPG module has no program entry procedure and is appropriate for reusable procedure implementations.

An exported procedure can be referenced outside its module, but the service program's actual public surface is still controlled during service-program creation.

Build evidence must identify the exact source revision, command, build library, compiler result, and resulting object. A successful action in VS Code does not prove you targeted the correct system or library.

**Practice:** compile `order_domain.rpgle` into `ORDERDOM *MODULE` using an approved Code for IBM i action.

**Evidence:** resolved command, diagnostics, object verification, Git revision/diff.

# Lesson 4 — Service Programs and Binding by Reference

A `*SRVPGM` packages reusable ILE procedures. It does not provide a normal program entry point and is not invoked like a `*PGM` with an ordinary program call.

ILE callers bind to exported procedures. A binding directory can make approved dependencies easier to resolve, but it needs ownership: an uncontrolled binding directory can hide which implementation a program resolves.

**Practice:** create `ORDERDOM *SRVPGM`, add it to the learner application's binding directory, and compile the demo caller.

**Evidence:** service-program object, binding evidence, caller build, runtime result.

# Lesson 5 — Binder Language and Signature Stability

Binder language controls the public export surface. Academy examples prefer an explicit export list rather than exporting every eligible symbol.

```text
STRPGMEXP PGMLVL(*CURRENT) SIGNATURE('RPGBAORDDOMV1')
  EXPORT SYMBOL('EVALUATEORDER')
ENDPGMEXP
```

`CalculateDiscount` is deliberately private. Making a helper public creates a new compatibility obligation for every future change.

A signature acts as a compatibility checkpoint for bound callers. Public interface changes must be reviewed as dependency changes, not treated as a routine rebuild.

**Practice:** build from controlled binder source, inspect exports/signature, then perform the compatibility experiment on a disposable branch.

# Lesson 6 — Put Business Behavior Where It Belongs

The Blend MVC Architecture assigns reusable business rules to Model / Domain Services. Controllers coordinate workflow. Data Services own persistence mechanics. Views own presentation/external interaction.

A domain contract should not normally expose `SQLCODE`, `SQLSTATE`, database row layouts, display-file fields, HTTP payloads, or transport-specific structures.

The Coffee Company `ORDERDOM` service accepts business-facing inputs and returns a stable business decision. It does not care whether a caller is a 5250 program, API controller, batch job, or test harness.

**Practice:** refactor pricing and order validation into `ORDERDOM` while preserving the required behavior matrix.

# Lesson 7 — Error Contracts, State, and Activation Groups

Expected business outcomes are different from technical failures. “Insufficient quantity” or “inactive product” is a business decision. A database failure, missing object, authority failure, or unexpected runtime exception is technical.

Return stable business-facing result identifiers for expected outcomes. Preserve technical detail for diagnostics, but do not make raw implementation diagnostics the normal caller contract.

Reusable services also become dangerous when they depend on hidden state. Review static storage, job-scoped values, data areas, current library/library list, cached values, open data paths, and activation-group lifetime.

Prefer explicit inputs/outputs for new services.

**Bob activity:** after your own review, ask Bob to look for hidden state and error leakage. Confirm every accepted finding with source or runtime evidence.

# Lesson 8 — Prove the Refactor and Explain the Design

Compile success proves compiler acceptance. Runtime success for one case proves only that case. Neither proves architectural quality.

Your final evidence packet must connect source, build, objects, tests, contracts, and review:

- source revision and focused Git diff;
- resolved build commands;
- module/service-program/caller evidence;
- binder exports/signature;
- normal, invalid, boundary, precision, and regression tests;
- known limitations;
- Bob findings/dispositions;
- independent explain-back.

## Independent challenge — Do It Without Me

A product marked inactive cannot be ordered, and the business result must distinguish inactive product from insufficient quantity.

Complete the requirement without step-by-step Bob or instructor direction. Write acceptance criteria, determine whether the public contract changes, implement the smallest correct change, rebuild the intended objects, execute required tests, review the Git/binder impact, then ask Bob for post-implementation review. Explain the result without AI assistance.

## Production safety

Use only approved non-production libraries/data. Verify host, profile, branch, source revision, IFS path, build library, and target object before every build. Never send credentials, PHI, customer data, production source, unrestricted logs, private keys, or confidential configuration to Git or an AI assistant.

## Completion standard

You are ready to move on when you score at least 80%, complete all labs and the independent challenge, provide internally consistent build/test evidence, and can explain the boundary, contract, binding strategy, error behavior, and proof without Bob open.

## Validation notice

The instructional content is complete. The supplied RPG/ILE build path remains validation pending until the Academy records live compile/runtime evidence on the designated IBM i training environment.
