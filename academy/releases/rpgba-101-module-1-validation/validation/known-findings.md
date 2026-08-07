# Known Findings Before Live IBM i Validation

## DEF-001 — Code for IBM i prerequisite wording is stale
**Severity:** High (publication accuracy)

The Academy Code for IBM i Quick Start Handbook v1.1 records IBM i 7.4 as the supported minimum and 7.3 as potentially working but unsupported.

The current Code for IBM i installation documentation reviewed during this validation build lists **IBM i 7.3 TR 8 minimum** and requires the SSH daemon.

**Action:** Correct the handbook and canonical Source and Manual Register before the next final Academy publication. Keep the wording version-qualified and record the review date.

## DEF-002 — Capstone monetary conversion used truncation
**Severity:** High (business correctness)

The release-candidate capstone solution used `%DEC(amount * rate : 11 : 2)`. RPG distinguishes `%DEC` from `%DECH`; `%DECH` applies half-adjust. A value such as 999.99 at 5% exposes the difference.

**Action:** The validation-candidate repository changes the discount procedure to `%DECH`.

## DEF-003 — Three equal displayed installments could fail to reconcile
**Severity:** High (business correctness)

The release-candidate solution calculated one two-decimal installment and displayed it three times. For totals not evenly divisible by three, the displayed installments can differ from the final total by one or two cents.

**Action:** The validation candidate truncates the first two installment amounts and assigns the remaining cents to the third installment. The test matrix verifies the sum.

## DEF-004 — Live compile/runtime evidence still required
**Severity:** Blocking

Static review cannot prove compile behavior, object creation, event-file diagnostics, or runtime output.

**Action:** Run the validation matrix on the Academy IBM i partition and record actual evidence.
