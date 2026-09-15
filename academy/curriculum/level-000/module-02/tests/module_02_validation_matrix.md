# Module 2 Validation Matrix

**Status:** Development expectations. All results require live IBM i confirmation before release candidate promotion.

## Baseline seed counts

| Table | Expected rows |
|---|---:|
| `CUSTOMER` | 4 |
| `PRODUCT` | 5 |
| `ORDER_HEADER` | 4 |
| `ORDER_ITEM` | 6 |

## Integrity tests

Each test is performed in the approved training schema and should be rolled back or otherwise isolated from the shared baseline.

| Test | Expected result |
|---|---|
| Product `ACTIVE = 'X'` | Rejected by `CK_PRODUCT_ACTIVE` |
| Product negative `UNIT_PRICE` | Rejected by `CK_PRODUCT_PRICE` |
| Product negative `QUANTITY_AVAILABLE` | Rejected by `CK_PRODUCT_QTY` |
| Duplicate product `SKU` | Rejected by unique constraint |
| Order references unknown customer | Rejected by `FK_ORDER_CUSTOMER` |
| Order item references unknown product | Rejected by `FK_ITEM_PRODUCT` |
| Order item quantity = 0 | Rejected by `CK_ITEM_QTY` |
| Duplicate `(ORDER_ID, LINE_NO)` | Rejected by primary key |

## SELECT expectations

| Scenario | Expected result |
|---|---|
| Active products | 2001, 2002, 2003, 2005 |
| Products priced 10.00–20.00 | 2001, 2002, 2005 |
| Customers with `EMAIL IS NULL` | 1003 only |
| Orders dated Sep 1–5, 2026 inclusive | 5001, 5002, 5003 |
| Active and (`price < 13` or `quantity < 10`) | 2001, 2003, 2005 |
| Distinct order statuses | `CANCELLED`, `FULFILLED`, `OPEN`, `SUBMITTED` |

## Join/cardinality expectations

| Query | Expected grain | Expected rows |
|---|---|---:|
| Orders + customer | One row per order | 4 |
| Order items + product | One row per order line | 6 |
| Customer order count, inner join | One row per customer with orders | 3 |
| Customer order count, left join | One row per customer | 4 |
| Customers with no orders | One row per unmatched customer | 1 (1004) |

## Aggregate expectations

### Order totals from stored order-item values

| Order | Expected total |
|---:|---:|
| 5001 | 53.00 |
| 5002 | 71.75 |
| 5003 | 15.25 |
| 5004 | 12.50 |

### Units represented in order items by product

| Product | Units |
|---:|---:|
| 2001 | 3 |
| 2002 | 3 |
| 2003 | 1 |
| 2005 | 3 |

Product 2004 has no order-item row in the baseline and therefore does not appear in the inner-join aggregate.

### Customer stored totals

| Customer | Orders | Expected stored total |
|---:|---:|---:|
| 1001 | 2 | 68.25 |
| 1002 | 1 | 71.75 |
| 1003 | 1 | 12.50 |
| 1004 | 0 | 0.00 |

## Transaction lab expectation

Product 2003 begins with `QUANTITY_AVAILABLE = 8`.

1. `UPDATE ... SET QUANTITY_AVAILABLE = 10 WHERE PRODUCT_ID = 2003` affects exactly 1 row.
2. Within the transaction, query shows 10.
3. `ROLLBACK` restores 8.
4. Repeat update affects exactly 1 row.
5. `COMMIT` persists 10.
6. Instructor reset must restore the intended baseline for the next learner.

This test is invalid unless journaling, commitment-control behavior, and connection settings are verified first.

## `V_PRODUCT_SNAPSHOT` contract

Expected columns:

- `PRODUCT_ID`
- `UNIT_PRICE`
- `QUANTITY_AVAILABLE`
- `ACTIVE`

Expected baseline rows: 5.

The view may expose inactive products as facts. It must not contain order-approval, discount, shipping, or other domain decisions.

## Embedded-SQL demo expectations

| Case | Expected status | `success` | `found` |
|---|---|---:|---:|
| Existing product 2001 | `FOUND` | on | on |
| Missing product | `NOT_FOUND` | on | off |
| Forced database failure | `DATA_ERROR` | off | off |

Raw SQL diagnostics may be captured for support inside the implementation path but must not become the caller-facing status contract.

## Release evidence

For each validated case record:

- branch and commit;
- IBM i host/release/PTF;
- profile and training schema;
- tool/extension versions;
- statement or build command;
- expected result;
- actual result;
- pass/fail;
- defect/reference if failed.