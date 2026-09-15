# Module 3 Quick Reference

## IBM i / ILE object model

| Item | Purpose | Key point |
|---|---|---|
| Procedure | Focused callable unit | Contract is defined by prototype/interface and behavior |
| `*MODULE` | Compiled ILE building block | Not the final reusable/runnable application object by itself |
| `*SRVPGM` | Reusable ILE service object | Exposes selected procedures to bound callers |
| `*PGM` | Program object | Provides a program entry point |
| Binding directory | Dependency-resolution aid | Must be owned and verified; do not treat it as a dumping ground |

## RPG interface terms

- `DCL-PR`: prototype visible to the caller.
- `DCL-PI`: procedure interface visible inside the implementation.
- `NOMAIN`: module has no program entry procedure.
- `EXPORT`: makes a procedure eligible for use outside the module; the service-program binder still controls the final public export surface.
- `CONST`: communicates that the called procedure should not modify the passed value.
- `VALUE`: requests pass-by-value semantics when appropriate.
- `QUALIFIED TEMPLATE`: useful for reusable business-facing data-structure definitions.

## Blend MVC responsibility check

| Responsibility | Layer |
|---|---|
| Presentation / external interaction | View |
| Request/workflow coordination | Controller |
| Business rules and reusable domain behavior | Model / Domain Services |
| SQL/native persistence mechanics | Data Services |

Rule of thumb: if the contract exposes SQLCODE, a display-file field, database row layout, or HTTP payload merely because the implementation uses it, question the boundary.

## Coffee Company public contract

### `OrderRequest_t`
- customerId
- productId
- quantity

### `ProductSnapshot_t`
- productId
- unitPrice
- quantityAvailable
- active

### `OrderDecision_t`
- allowed
- resultCode
- message
- unitPrice
- discountAmount
- finalTotal

## Business result codes

- `OK`
- `INVALID_QUANTITY`
- `INACTIVE_PRODUCT`
- `INSUFFICIENT_QTY`
- `PRODUCT_MISMATCH`

These are business-facing outcomes. Raw technical diagnostics belong behind the appropriate boundary unless deliberately required.

## Binder source

```text
STRPGMEXP PGMLVL(*CURRENT) SIGNATURE('RPGBAORDDOMV1')
  EXPORT SYMBOL('EVALUATEORDER')
ENDPGMEXP
```

`CalculateDiscount` is a private helper and should not be exported by the supported Module 3 interface.

## Build evidence checklist

Before build:
- [ ] correct Git branch/revision;
- [ ] correct IBM i connection/profile;
- [ ] correct build library;
- [ ] correct remote IFS source path;
- [ ] intended target object known.

After build:
- [ ] command/output captured;
- [ ] diagnostics reviewed;
- [ ] expected `*MODULE` verified;
- [ ] expected `*SRVPGM` verified;
- [ ] binder exports/signature verified;
- [ ] binding directory verified;
- [ ] caller resolves intended service program;
- [ ] expected vs actual tests recorded;
- [ ] Git diff reviewed.

## Behavior thresholds

Discount rule used by the reference slice:

- below 500.00 subtotal: 0%
- 500.00 through 999.99: 5%
- 1000.00 and above: 10%

The 999.99 precision case expects half-adjust conversion of 49.9995 to 50.00.

## Bob review disposition

For a material AI finding, record one:

- **Accept** — validated and used.
- **Reject** — evidence shows it is not appropriate/correct.
- **Investigate** — more evidence required.
- **Defer** — valid concern but outside the current change; record why/where it will be handled.

Bob output is review input, not proof.

## Hidden-state scan

Check for:
- static/global storage;
- activation-group lifetime assumptions;
- job-scoped values;
- data areas;
- library-list/current-library assumptions;
- caches;
- open data paths;
- adopted authority;
- external IFS/environment configuration.

Prefer explicit inputs/outputs and scoped state for new services.

## Stop conditions

Stop rather than guessing when:

- host/profile/build library is unclear;
- resolved build command targets an unexpected object;
- binding resolution is ambiguous;
- authority/data boundary is unclear;
- source revision and object evidence do not match;
- an AI recommendation cannot be independently verified.

## Module completion

You should be able to answer five questions without Bob:

1. What business capability does `ORDERDOM` own?
2. What does it deliberately not own?
3. What is the public interface and why?
4. How does a caller depend on it?
5. What evidence proves the change works and remains safely bounded?
