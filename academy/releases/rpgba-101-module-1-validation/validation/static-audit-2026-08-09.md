# RPGBA-101 Module 1 — Second Full Static Validation

**Review date:** 2026-08-09  
**Scope:** Release Candidate course artifacts, GitHub validation branch, PUB400 lab model, current IBM i 7.5 RPG documentation, current Code for IBM i documentation, and current IBM Bob workflow documentation.

## Executive result

**Static status: CONDITIONALLY READY FOR LIVE VALIDATION.**

The curriculum architecture, safety model, lesson progression, labs, assessment, capstone rubric, Git workflow, and Bob responsibility model are sound. The second pass identified additional technical and cross-artifact issues that must be corrected before Final v1.0. The validation-branch source has been patched where possible; the generated learner/instructor artifacts must be regenerated after live PUB400 results are known.

The module remains a Release Candidate. No static review can replace live compilation and execution on the target IBM i environment.

## Validation dimensions

| Dimension | Result | Notes |
|---|---|---|
| Curriculum progression | PASS | Module 0 -> Module 1 progression is clear and measurable. |
| Prerequisites/objectives | PASS | Objectives map to lesson/lab/capstone work. |
| Modern toolchain | PASS WITH LIVE CHECK | VS Code, Code for IBM i, Git and Bob are correctly central; actual PUB400 workflow still must be exercised. |
| RPG structure/declarations | PASS STATIC | Uses fully free-form examples and clear declarations. Live compile required. |
| Numeric precision | CORRECTED / RETEST | `%DEC` versus `%DECH` distinction tightened; monetary procedure uses `%DECH`. |
| Decisions | PASS STATIC | Discount tiers ordered from highest threshold downward; invalid amount guarded first. |
| Loops | PASS STATIC | Lesson loop is bounded; capstone installment loop is explicitly bounded. |
| Procedures | PASS STATIC / RETEST | PR/PI match; monetary conversion changed to `%DECH`; live compile required. |
| DSPLY training output | CORRECTED / RETEST | Lesson 3 and 4 output split to respect documented 52-byte limit. |
| Capstone discount boundaries | PASS STATIC / RETEST | -0.01, 0, .01, 499.99, 500, 750, 999.99, 1000 defined. |
| Shipping boundary | GAP CORRECTED IN VALIDATION PLAN | Added 789.46/789.47/789.48 to prove finalTotal 749.99/750.00/750.01. |
| Installment reconciliation | CORRECTED / RETEST | Third installment absorbs remaining cents. |
| Assessment | PASS STATIC | 25 questions and practical checkpoint align with taught objectives. |
| Lab evidence model | PASS | Predict -> compile -> run -> evidence -> Bob disposition -> Git review is strong. |
| Bob integration | PASS CURRENT | Explanation/review use is bounded; human verification remains required. |
| Safety/security | PASS | No production/client/PHI/secrets; PUB400 boundary explicitly stated. |
| Version traceability | NEEDS UPDATE | RC source register emphasizes 7.6 manuals while public runtime target is PUB400 IBM i 7.5. |
| Publication consistency | NOT FINAL | Generated RC artifacts still contain pre-audit source/wording and must be regenerated. |

## Source-code review

### Lesson 1 — Program map

Static logic is clear. The validation source uses a 52-byte message field and a simple output. Verify compile and run behavior on PUB400.

### Lesson 2 — Data definitions

The current sample produces 750.00 * 5% = 37.50 and final 712.50. Data definitions are sufficient for the exercise. Live output and DSPLY behavior still need proof.

### Lesson 3 — Expressions

The original validation source built a 150-byte summary and passed it to DSPLY, conflicting with the course's own 52-byte rule. The validation branch now emits short separate messages.

This lesson intentionally retains `%DEC` as a contrast example. With subtotal 599.97 and rate 0.0500, raw discount is 29.9985. `%DEC(...:11:2)` does not half-adjust; expected lesson result is discount 29.99 and final 569.98. The learner must explain why `%DECH` would produce 30.00 when half-adjust is the required business rule.

### Lesson 4 — Decisions

Tier ordering is correct. Output was split into separate status and rate messages so the training example does not rely on an oversized DSPLY expression.

### Lesson 5 — Loops

The five input values total 2874.99; highest is 1000.00; count is 5. Loop termination is bounded by `%ELEM(amounts)`.

### Lesson 6 — Procedures

The PR and PI agree. The monetary calculation now uses `%DECH(amount * rate : 11 : 2)` to implement the stated half-adjust-to-cents business rule.

### Capstone starter

The starter now asks the learner to display short independently verifiable result fields/messages instead of implying one large final message.

### Capstone solution

Static business rules are internally coherent:

- amount <= 0 -> invalid
- amount >= 1000 -> 10%
- amount >= 500 -> 5%
- otherwise -> 0%
- discount uses `%DECH` to cents
- shipping is PRIORITY when discounted `finalTotal >= 750`
- first two installments are converted to cents; the third receives the remaining cents so the displayed payments reconcile to `finalTotal`

The exact shipping threshold must be proven after discount, not inferred from original order amount.

## Course-artifact findings to carry into regeneration

1. Replace wording that implies `%DEC` performs half-adjusted rounding. Use `%DECH` where half-adjust is the stated business rule.
2. Replace pre-audit Lesson 3 and Lesson 4 code snippets with the validation-branch versions.
3. Replace Lesson 6 `%DEC` monetary procedure examples with `%DECH`.
4. Reconcile the capstone's stated "eight tests" with the required shipping-boundary supplement. The final artifact may call the eight cases the core set and require a separate three-case shipping-boundary supplement, or revise the total test count consistently everywhere.
5. Update the Source and Validation Register to record IBM i 7.5 / PUB400 as the public runtime validation target while retaining IBM i 7.6 manuals as a reference source where useful.
6. Correct the Code for IBM i prerequisite claim in the Academy Quick Start handbook; current official documentation lists IBM i 7.3 TR 8 as the minimum.
7. Record where DSPLY output actually appears when programs are invoked through the Academy PUB400 / Code for IBM i run workflow.

## Live validation required before Final v1.0

1. Connect to PUB400 with the learner profile and SSH port 2222.
2. Verify the learner's actual private libraries and IFS home/deploy path.
3. Compile all nine targets using the checked-in Code for IBM i Action.
4. Prove each expected *PGM object and target library.
5. Introduce one deliberate compile error and prove `OPTION(*EVENTF)` diagnostics flow into the expected Code for IBM i experience.
6. Run every lesson and record semantic actual output.
7. Run the eight core capstone cases.
8. Run the three shipping-boundary supplement cases.
9. Confirm installment totals reconcile for values not evenly divisible by three.
10. Confirm where DSPLY output surfaces through the learner run workflow.
11. Inspect Git status/diff after builds and runs; no generated or environment-specific content should become tracked unexpectedly.
12. Resolve all Critical/High findings, regenerate the course package, then rerun the cross-artifact comparison.

## Release decision

**Do not merge PR #19 or label Module 1 Final v1.0 yet.**

After the live PUB400 pass, regenerate the student coursebook, instructor guide, lab workbook, slides, capstone package, assessment references, PDF editions, repository ZIP, validation tracker, source register, and release manifest from the corrected source of truth.
