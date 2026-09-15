# The RPG Blend Academy Curriculum Map

**Status:** Canonical module sequence  
**Owner:** George Van Eaton  
**Last aligned:** September 15, 2026  
**Architecture authority:** The RPG Blend Method and MVC Architecture v1.3

This file is the authoritative high-level sequence for the Academy's primary developer learning path. Detailed lesson plans live inside each module and must not redefine the module order.

The Academy uses a three-layer learning path rather than one flat RPG-only sequence.

## Layer 1 — Engineering Foundations

Before IBM i specialization, learners need durable engineering habits: development lifecycle, Git/source control, debugging, testing, SQL/data fundamentals, API/integration concepts, code review, documentation, security/production responsibility, and AI-assisted engineering fundamentals.

### Layer 1 → Layer 2 bridge

| Module | Title | Status | Primary focus |
|---:|---|---|---|
| 0 | IBM i Developer Orientation | Built | IBM i mental model, VS Code/Code for IBM i tooling, safety boundaries, Db2/SQL orientation, Git workflow, and system-understanding habits |

## Layer 2 — Modern IBM i Engineer

| Module | Title | Status | Primary focus |
|---:|---|---|---|
| 1 | Modern RPG Fundamentals | Built | Read, change, test, and explain modern RPG safely |
| 2 | Db2 for i and SQL-Centered Development | Content Complete — Validation Pending | Relational model, SQL querying/manipulation, safe data change, database tooling, Data Services, and the Module 3 handoff |
| 3 | Procedures, Service Programs, and Domain Design | Content Complete — Validation Pending | Procedures, prototypes, modules, service programs, binding, contracts, cohesion/coupling, errors, state awareness, and Model / Domain Services |
| 4 | Testing, Validation, and Production Readiness | Planned | Repeatable tests, diagnostics, validation evidence, failure handling, production-safety, and release readiness |
| 5 | APIs, Integration, and Controllers | Planned | Controller responsibilities, request/response contracts, APIs, integration boundaries, and orchestration |
| 6 | AI-Assisted IBM i Engineering | Planned | Governed AI-assisted analysis, coding, testing, review, documentation, and developer judgment |
| 7 | Architecture + Modernization Capstone | Planned | Apply the RPG Blend Method and Blend MVC Architecture to an end-to-end Coffee Company modernization slice |

## Layer 3 — Cross-Stack Engineer

After the core IBM i path, expand beyond an RPG-only identity into the surrounding enterprise stack: web/HTTP/JSON/API engineering, JavaScript/TypeScript and service concepts, CI/CD, observability, security, platform concepts, and governed AI-agent/tool integration.

## Primary progression

```text
Engineering Foundations
        ↓
Module 0 — IBM i Developer Orientation
        ↓
Module 1 — Modern RPG Fundamentals
        ↓
Module 2 — Db2 for i and SQL-Centered Development
        ↓
Module 3 — Procedures, Service Programs, and Domain Design
        ↓
Module 4 — Testing, Validation, and Production Readiness
        ↓
Module 5 — APIs, Integration, and Controllers
        ↓
Module 6 — AI-Assisted IBM i Engineering
        ↓
Module 7 — Architecture + Modernization Capstone
        ↓
Cross-Stack Engineering
```

## Connected instructional system

The Academy uses the Coffee Company as a progressive application rather than disconnected examples. Each module should make a controlled improvement to the same system and leave visible evidence of what changed.

The application exists to teach architecture and engineering judgment, not coffee-domain complexity.

## Curriculum design rules

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
11. Connect the work to the RPG Blend Method and Blend MVC Architecture where appropriate.
12. Continue the Coffee Company application when doing so improves learning continuity.

## Tooling direction

The primary Academy environment is:

- Visual Studio Code
- Code for IBM i
- Db2 for IBM i extension
- Git and GitHub
- IBM i Access Client Solutions when it remains the appropriate tool
- IBM Bob as an integrated AI-assisted learning and development companion

SEU, PDM, RDi, and green-screen workflows may be taught for recognition, support, or comparison, but they are not the Academy's default development experience.

## Module 2 → Module 3 handoff

Module 2 now ends with an explicit Coffee Company Data Service seam rather than a generic SQL endpoint. The learner builds and proves `V_PRODUCT_SNAPSHOT`, which exposes product identity, unit price, available quantity, and active state as facts. The learner also sees an embedded-SQL data-access example that translates database outcomes while keeping raw SQL diagnostics inside the implementation boundary.

Module 3 may therefore assume that the learner can:

- understand the Coffee Company relational model, keys, constraints, and result grain;
- query and join the required product/order data;
- perform controlled DML with transaction awareness;
- distinguish persistence shape from application-facing data contract;
- explain why `V_PRODUCT_SNAPSHOT` returns facts rather than order-eligibility decisions;
- keep SQL/database diagnostics behind Data Services;
- produce schema/query/transaction evidence.

Module 3 deliberately focuses on reusable RPG capability and domain ownership. It should not reteach SQL fundamentals or move persistence details into domain contracts.

### Module 2 current gate

Instructional content, labs, assessment, Coffee Company SQL source, validation matrix, Data Service boundary, and instructor/learner material are complete. The remaining gate is live IBM i validation: DDL/DML execution, constraints, expected query results, journaling/commitment-control behavior, rollback/commit proof, `V_PRODUCT_SNAPSHOT`, embedded-SQL compile/runtime behavior, current Db2 for IBM i/Code for IBM i workflow, Bob behavior, independent technical review, and learner pilot.

### Module 3 current gate

Instructional content, labs, assessment, reference source, and review material are complete. The remaining gate is live IBM i validation: compile/build, IFS include resolution, binder-source creation, service-program binding, runtime behavior, test matrix, current Code for IBM i behavior, technical review, and learner pilot.

## Change control

Material changes to this module order require an explicit Academy curriculum decision and updates to the canonical Curriculum Coverage Matrix, Blueprint/Method materials, module plans, learner-facing roadmap, and publication backlog.

Do not silently fall back to older module definitions such as the prior “Module 3 — Files + Data Access / Module 4 — Procedures + ILE” sequence. That structure is superseded by the current canonical Academy architecture.
