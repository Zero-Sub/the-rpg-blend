# RPGBA-101 Module 1 — Validation Runbook

Module 1 remains a Release Candidate until live IBM i evidence is recorded.

## Stop conditions

Stop validation if the host/profile cannot be positively identified, the build library is outside the Academy boundary, the resolved Code for IBM i action targets an unexpected object/path, restricted data would be captured, or a Critical/High defect is open without disposition.

## Compile/run matrix

| ID | Source | Program | Expected result |
|---|---|---|---|
| L1A | `src/lesson-01/program_map.pgm.rpgle` | `M1L1MAP` | Welcome Avery to RPGBA-101 |
| L1B | `src/lesson-01/program_map_independent.pgm.rpgle` | `M1L1IND` | Welcome Jordan to RPGBA-101-M1 |
| L2 | `src/lesson-02/data_definitions.pgm.rpgle` | `M1L2DATA` | Final total contains 712.50 |
| L3 | `src/lesson-03/expressions.pgm.rpgle` | `M1L3EXPR` | Normalized name; subtotal 599.97; conversion behavior reviewed |
| L4 | `src/lesson-04/decisions.pgm.rpgle` | `M1L4DEC` | 500.00 follows the standard-discount branch |
| L5 | `src/lesson-05/loops.pgm.rpgle` | `M1L5LOOP` | Count 5; total 2874.99; highest 1000.00 |
| L6 | `src/lesson-06/procedures.pgm.rpgle` | `M1L6PROC` | Calculated adjustment contains 37.50 |
| CAP-S | `src/capstone/start/blend_order.pgm.rpgle` | `M1CAPST` | Starter behavior is documented |
| CAP-I | `src/capstone/solution/blend_order.pgm.rpgle` | `M1CAPSOL` | All capstone tests pass |

For each target, predict the compile result, verify the fully resolved action, record compiler diagnostics, prove the expected `*PGM` object in the assigned library, run the intended object, compare expected/actual results, and inspect Git status/diff.

## Required capstone matrix

- -0.01 → invalid; no downstream processing.
- 0.00 → invalid; no downstream processing.
- 0.01 → 0.00 adjustment; 0.01 final.
- 499.99 → 0.00 adjustment; 499.99 final.
- 500.00 → 25.00 adjustment; 475.00 final.
- 750.00 → 37.50 adjustment; 712.50 final.
- 999.99 → 50.00 adjustment; 949.99 final; this is the required half-adjust precision case.
- 1000.00 → 100.00 adjustment; 900.00 final.

Three installments must reconcile exactly to the final total; the third installment absorbs the remaining cents.

## Diagnostic proof

Create one temporary compile error on a disposable validation branch. Confirm `OPTION(*EVENTF)` surfaces the intended source diagnostic. Undo the defect, recompile cleanly, and ensure the deliberate error is not retained.

## Gate exit criteria

- All nine targets have recorded compile results.
- Every required `*PGM` is proven in the assigned build library.
- Normal, invalid, boundary, and precision tests pass.
- The 999.99 case demonstrates the intended half-adjust behavior.
- Installments reconcile exactly.
- Event-file diagnostics are proven once.
- No Critical or High compile/runtime defect remains open.