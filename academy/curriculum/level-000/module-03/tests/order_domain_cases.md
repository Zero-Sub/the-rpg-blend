# Module 3 — Order Domain Test Matrix

These are required behavior cases for the development reference slice. They are Academy-original tests and must be executed on the designated IBM i training environment before release-candidate promotion.

## Acceptance matrix

| Case | Product active | Unit price | Available | Requested | Expected result | Expected discount | Expected final |
|---|---:|---:|---:|---:|---|---:|---:|
| Invalid negative quantity | Yes | 10.00 | 10 | -1 | `INVALID_QUANTITY` | 0.00 | 0.00 |
| Invalid zero quantity | Yes | 10.00 | 10 | 0 | `INVALID_QUANTITY` | 0.00 | 0.00 |
| Inactive product | No | 10.00 | 10 | 1 | `INACTIVE_PRODUCT` | 0.00 | 0.00 |
| Insufficient quantity | Yes | 10.00 | 2 | 3 | `INSUFFICIENT_QTY` | 0.00 | 0.00 |
| Product mismatch | Yes | 10.00 | 10 | 1 | `PRODUCT_MISMATCH` | 0.00 | 0.00 |
| Small allowed order | Yes | 10.00 | 10 | 1 | `OK` | 0.00 | 10.00 |
| Just below 5% threshold | Yes | 499.99 | 10 | 1 | `OK` | 0.00 | 499.99 |
| Exact 5% threshold | Yes | 250.00 | 10 | 2 | `OK` | 25.00 | 475.00 |
| Normal 5% case | Yes | 250.00 | 10 | 3 | `OK` | 37.50 | 712.50 |
| Precision case | Yes | 333.33 | 10 | 3 | `OK` | 50.00 | 949.99 |
| Exact 10% threshold | Yes | 500.00 | 10 | 2 | `OK` | 100.00 | 900.00 |

For the precision case, subtotal is 999.99 and 5% is 49.9995. The module deliberately uses half-adjust decimal conversion so the expected discount is 50.00.

## Contract tests

In addition to value tests, prove these boundaries:

- `EvaluateOrder` is the only procedure exported by the development binder source.
- The caller can compile without knowing the implementation of `CalculateDiscount`.
- The public contract does not contain SQLCODE, SQLSTATE, database row layouts, display-file fields, HTTP/JSON payloads, or library-specific names.
- Changing a private helper does not require changing the public binder source.
- A deliberate incompatible public-contract experiment is isolated to a disposable branch and is not merged into the supported baseline.

## Evidence for every run

Record:

1. Git commit or working-tree revision.
2. IBM i host/environment alias and learner profile (no credentials).
3. Build library.
4. `ORDERDOM *MODULE` creation evidence.
5. `ORDERDOM *SRVPGM` creation/signature/export evidence.
6. Caller object evidence.
7. Expected result.
8. Actual result.
9. Pass/fail.
10. Any diagnostic IDs or unexpected behavior.

A successful compile is not a passing behavior test.