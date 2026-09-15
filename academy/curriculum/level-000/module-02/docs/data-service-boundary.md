# Architecture Decision — Module 2 Data Service Boundary

## Decision

Module 2 establishes a Coffee Company Data Service boundary using two deliberate seams:

1. `RPGBA_CC.V_PRODUCT_SNAPSHOT` is the **relational interface** over Db2 for i.
2. The embedded-SQL RPG Data Service translates that relational shape into the **application-facing product snapshot** consumed by later RPG logic.

The boundary exposes **facts** needed by application logic while hiding SQL implementation details and persistence-specific representation choices.

## Public application-facing facts

The application-facing snapshot contains:

- `productId` — packed numeric identifier;
- `unitPrice` — packed decimal price;
- `quantityAvailable` — packed numeric quantity;
- `active` — RPG indicator/Boolean-style fact.

This intentionally aligns with the `ProductSnapshot_t` shape used by Module 3 Domain Services.

The Db2 relational view may use SQL-oriented storage types such as `INTEGER` and `CHAR(1)`. The Data Service adapter owns the translation from those persistence types to the stable RPG application contract. For example, persisted `ACTIVE = 'Y'/'N'` becomes an RPG indicator before Module 3 sees it.

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
Application data contract / Data Service
        ↓
Relational view (`V_PRODUCT_SNAPSHOT`)
        ↓
Db2 for i tables
```

Module 2 builds the lower part of that stack and teaches why the upper layers should not depend directly on a table row, a `CHAR(1)` persistence convention, or SQL diagnostics.

## Why a view

`V_PRODUCT_SNAPSHOT` provides a readable, testable relational interface that can evolve independently from some underlying table details. A view is not magic isolation and does not eliminate compatibility responsibility, but it creates a concrete teaching seam.

The view is **not by itself the entire application contract**. The RPG Data Service remains responsible for translating the relational representation into the stable application-facing snapshot.

## Compatibility rule

Changes to either of these surfaces require deliberate review:

- view columns or their meaning, because they can break the Data Service implementation;
- application-facing snapshot fields or semantics, because they can break Module 3 consumers.

A storage-type change that is fully absorbed by the Data Service may be an implementation change rather than a Domain Service contract change. The evidence must prove that the application-facing contract stayed stable.

## AI rule

Bob may review the boundary and identify likely leakage. A human learner/reviewer must verify whether the proposed boundary actually matches the schema, application requirements, and Academy architecture.