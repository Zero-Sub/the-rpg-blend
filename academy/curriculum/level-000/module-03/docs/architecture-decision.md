# ADR — Coffee Company Order Domain Service

**Status:** Accepted for Module 3 content; IBM i build/runtime validation pending.

## Context

The Coffee Company pricing/order rules began as behavior embedded within a caller-oriented RPG flow. Module 3 needs a concrete example of moving business behavior into the Blend MVC **Model / Domain Services** responsibility without forcing a full application rewrite.

The teaching slice must support multiple potential callers, remain testable without presentation/database coupling, expose only a deliberate public capability, and make service-program compatibility visible to the learner.

## Decision

Create an `ORDERDOM` Order Domain service with one public business capability:

`EvaluateOrder`

The public contract uses application-facing structures:

- `OrderRequest_t`
- `ProductSnapshot_t`
- `OrderDecision_t`

The caller or another boundary is responsible for obtaining a trusted product snapshot. The domain service does not query Db2 directly in this module.

`CalculateDiscount` remains a private implementation helper and is not exported by binder source.

## Public interface

```text
STRPGMEXP PGMLVL(*CURRENT) SIGNATURE('RPGBAORDDOMV1')
  EXPORT SYMBOL('EVALUATEORDER')
ENDPGMEXP
```

## Boundary rules

The domain service may own:

- quantity validation;
- product-state business decisions;
- inventory-availability business decision based on supplied trusted facts;
- pricing/discount business calculation;
- stable business result identifiers.

The domain service does not own in this Module 3 slice:

- 5250/UI fields;
- HTTP/JSON request/response formats;
- SQL statements or native record I/O;
- SQLCODE/SQLSTATE exposure;
- transaction/commit ownership for the later persistence use case;
- database row layouts;
- presentation formatting.

## Error model

Expected rule outcomes use stable result codes such as:

- `OK`
- `INVALID_QUANTITY`
- `INACTIVE_PRODUCT`
- `INSUFFICIENT_QTY`
- `PRODUCT_MISMATCH`

Unexpected infrastructure/database failures belong to the appropriate technical/data/application boundary and should not be represented as raw SQL diagnostics in the domain contract.

## State decision

The reference domain service should not require hidden cross-call state. Inputs and results are explicit. Any later use of service-program static state, job-scoped values, data areas, caches, library-list assumptions, adopted authority, or activation-group-specific behavior must be treated as an architectural dependency and documented/tested.

## Consequences

### Positive

- Business behavior can be tested independently from UI/transport.
- Callers depend on business-facing contracts rather than infrastructure layouts.
- Public service-program surface is small and reviewable.
- Internal pricing implementation can change without creating a public compatibility obligation.
- The design forms a clean transition seam for later controller/API and data-service modules.

### Tradeoffs

- The caller/application boundary must supply trusted product facts.
- Service-program build/binding/signature management adds lifecycle responsibility.
- More explicit contracts require deliberate version/change management.
- The Academy must prove IFS include, binder-source, binding, and runtime behavior on the training IBM i before Release Candidate status.

## Alternatives considered

### Keep rules in the caller
Rejected for the Module 3 target because it keeps business behavior tied to a specific application flow and provides weak test/reuse seams.

### Let the domain service query Db2 directly
Not selected for this lesson. It would mix the domain-design objective with persistence implementation and weaken the explicit Data Service boundary taught by the Blend MVC architecture.

### Export the discount helper
Rejected. The helper is an implementation detail; exporting it expands the compatibility surface without a business-facing need.

## Validation

This ADR is validated instructionally when the learner can explain the boundary and prove no SQL/display/transport details leaked into the public contract. It is validated technically only after the Module 3 validation runbook succeeds on the designated IBM i environment.
