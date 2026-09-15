# Architecture Decision — Module 2 Data Service Boundary

## Decision

Module 2 establishes a Coffee Company Data Service boundary centered on `RPGBA_CC.V_PRODUCT_SNAPSHOT` and a small embedded-SQL RPG demonstration.

The boundary exposes **facts** needed by application logic while hiding SQL implementation details.

## Public application-facing facts

The Module 2 product snapshot contains:

- product identifier;
- unit price;
- quantity available;
- active-state fact.

These values describe data. They do not decide what the application should do with that data.

## Deliberately excluded domain decisions

The Data Service does not determine:

- whether an order is allowed;
- discount eligibility or percentage;
- shipping classification;
- approval/denial result codes;
- customer-facing business messages.

Those responsibilities move to Module 3 Model / Domain Services.

## Error boundary

Database outcomes are translated inside the data-access implementation.

For the training example:

- found row → `FOUND`;
- no matching row → `NOT_FOUND`;
- technical database problem → `DATA_ERROR`.

`SQLCOD`, `SQLSTT`, object names, access paths, and other database diagnostics may be preserved for support evidence but are not the caller-facing business contract.

## Transaction boundary

Module 2 teaches transaction fundamentals and proves controlled rollback/commit behavior. It does not teach learners to scatter commits inside generic data-access helpers.

Later application use cases must deliberately own or coordinate transaction boundaries. Module 3 introduces stronger reusable-service design; later modules deepen release/production behavior.

## Dependency direction

Target direction:

```text
Controller / Use Case
        ↓
Domain Services        (Module 3)
        ↓
Data Port / Data Service contract
        ↓
Db2 for i implementation
```

Module 2 builds the lower part of that stack and teaches why the upper layers should not depend directly on a table row or SQL diagnostics.

## Why a view

`V_PRODUCT_SNAPSHOT` provides a readable, testable relational interface that can evolve independently from some underlying table details. A view is not magic isolation and does not eliminate compatibility responsibility, but it creates a concrete teaching seam.

## Compatibility rule

Any change to the view columns or their meaning is treated as an application-interface change for Academy purposes and must be reviewed with Module 3 consumers in mind.

## AI rule

Bob may review the boundary and identify likely leakage. A human learner/reviewer must verify whether the proposed boundary actually matches the schema, application requirements, and Academy architecture.