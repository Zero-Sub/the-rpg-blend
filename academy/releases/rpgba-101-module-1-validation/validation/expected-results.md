# Module 1 Compile and Runtime Expectations

These are semantic expectations. Do not fail a test because `%CHAR` adds leading blanks.

| ID | Source | Program | Expected result |
|---|---|---|---|
| L1A | `src/lesson-01/program_map.pgm.rpgle` | `M1L1MAP` | Contains `Welcome Avery to RPGBA-101` |
| L1B | `src/lesson-01/program_map_independent.pgm.rpgle` | `M1L1IND` | Contains `Welcome Jordan to RPGBA-101-M1` |
| L2 | `src/lesson-02/data_definitions.pgm.rpgle` | `M1L2DATA` | Final total contains `712.50` |
| L3 | `src/lesson-03/expressions.pgm.rpgle` | `M1L3EXPR` | Name normalizes to `AVERY JONES`; subtotal is 599.97; `%DEC` conversion is explicitly reviewed for truncation risk |
| L4 | `src/lesson-04/decisions.pgm.rpgle` | `M1L4DEC` | 500.00 -> STANDARD DISCOUNT and rate .0500 |
| L5 | `src/lesson-05/loops.pgm.rpgle` | `M1L5LOOP` | Count 5; total 2874.99; highest 1000.00 |
| L6 | `src/lesson-06/procedures.pgm.rpgle` | `M1L6PROC` | Discount contains 37.50 |
| CAP-S | `src/capstone/start/blend_order.pgm.rpgle` | `M1CAPST` | Starter compiles and displays the initial customer/order message |
| CAP-I | `src/capstone/solution/blend_order.pgm.rpgle` | `M1CAPSOL` | Full capstone matrix passes; installment messages reconcile exactly to final total |

## Capstone validation cases

| Amount | Discount | Final | Shipping | Installments |
|---:|---:|---:|---|---|
| -0.01 | N/A | N/A | N/A | Invalid status only |
| 0.00 | N/A | N/A | N/A | Invalid status only |
| 0.01 | 0.00 | 0.01 | STANDARD | 0.00, 0.00, 0.01 |
| 499.99 | 0.00 | 499.99 | STANDARD | 166.66, 166.66, 166.67 |
| 500.00 | 25.00 | 475.00 | STANDARD | 158.33, 158.33, 158.34 |
| 750.00 | 37.50 | 712.50 | STANDARD | 237.50, 237.50, 237.50 |
| 999.99 | 50.00 | 949.99 | PRIORITY | 316.66, 316.66, 316.67 |
| 1000.00 | 100.00 | 900.00 | PRIORITY | 300.00, 300.00, 300.00 |

The 999.99 case is deliberately included because `%DECH` should half-adjust 49.9995 to 50.00.
