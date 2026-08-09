# Known Findings Before Live IBM i Validation

Second full static validation: 2026-08-09.

## DEF-001 — Code for IBM i prerequisite wording is stale
**Severity:** High (publication accuracy)

The Academy Code for IBM i Quick Start Handbook v1.1 records IBM i 7.4 as the supported minimum and 7.3 as potentially working but unsupported.

The current Code for IBM i installation documentation reviewed during validation lists **IBM i 7.3 TR 8 minimum** and requires the SSH daemon.

**Action:** Correct the handbook and canonical Source and Manual Register before the next final Academy publication. Keep the wording version-qualified and record the review date.

## DEF-002 — Capstone monetary conversion used truncation
**Severity:** High (business correctness)

The original release-candidate capstone solution used `%DEC(amount * rate : 11 : 2)`. RPG distinguishes `%DEC` from `%DECH`; `%DECH` applies half-adjust. A value such as 999.99 at 5% exposes the difference.

**Status:** Candidate fix built. The validation-candidate capstone uses `%DECH`. Live compile/runtime test remains required.

## DEF-003 — Three equal displayed installments could fail to reconcile
**Severity:** High (business correctness)

The original release-candidate solution calculated one two-decimal installment and displayed it three times. For totals not evenly divisible by three, the displayed installments can differ from the final total by one or two cents.

**Status:** Candidate fix built. The validation candidate assigns the remaining cents to the third installment. Live tests remain required.

## DEF-004 — Live compile/runtime evidence still required
**Severity:** Critical / release blocking

Static review cannot prove compile behavior, object creation, event-file diagnostics, DSPLY runtime visibility, or actual program output on PUB400.

**Action:** Run the validation matrix on PUB400 and record actual evidence before merging or publishing Final v1.0.

## DEF-005 — `%DEC` wording in course artifacts is technically misleading
**Severity:** High (instructional accuracy)

The Release Candidate student/instructor material includes wording such as `%DEC` potentially "rounding." IBM documents `%DECH` as the half-adjust form of `%DEC`. The Academy should not teach `%DEC` as the monetary rounding operation.

**Action:** In the regenerated coursebook, instructor guide, slides, labs, and solution notes, describe `%DEC` conversion in terms of precision reduction/truncation risk where applicable and use `%DECH` when the stated business rule is half-adjust to cents. Lesson 3 may retain `%DEC` only as an explicit contrast exercise.

## DEF-006 — Some Release Candidate DSPLY examples contradict the documented 52-byte limit
**Severity:** High (instructional/runtime robustness)

The coursebook correctly states that RPG DSPLY is limited to 52 bytes and says the training examples stay short, but the original Lesson 3 source built a `varchar(150)` summary and passed it to DSPLY. Lesson 4 also combined a status string and numeric rate into one message.

**Status:** Validation-branch source corrected by splitting Lesson 3 and Lesson 4 output into short messages. Regenerated course artifacts must show the corrected source before Final v1.0.

## DEF-007 — PUB400 is IBM i 7.5 while the RC source register emphasizes IBM i 7.6 manuals
**Severity:** Medium (version traceability)

Using current 7.6 manuals as reference is reasonable, but the standard public runtime target is now PUB400, which advertises IBM i 7.5. Version-sensitive claims and example behavior must therefore be verified against 7.5 documentation and the live 7.5 environment.

**Action:** Add IBM i 7.5 validation entries to the canonical Source and Manual Register and record the live PUB400 test date/results. Do not claim final 7.5 compatibility until compilation and runtime testing pass.

## DEF-008 — Exact shipping boundary was not explicitly covered by the automated capstone matrix
**Severity:** High (test coverage)

The shipping rule changes at `finalTotal >= 750`, after discount. The existing core tests cover values below and above the threshold but do not prove an exact discounted `finalTotal` of 750.00.

**Status:** Validation expectations now add a required boundary supplement: 789.46 -> 749.99 STANDARD, 789.47 -> 750.00 PRIORITY, 789.48 -> 750.01 PRIORITY. Live execution remains required. Final course artifacts must reconcile their stated test count with this supplement.

## DEF-009 — Capstone starter implied one final message while the solution uses bounded result messages
**Severity:** Medium (cross-artifact consistency)

The starter TODO said to build and display one final result message, while the validated solution deliberately emits separate bounded messages to stay within the DSPLY training constraint.

**Status:** Validation-branch starter corrected. Regenerate the learner-facing capstone instructions before Final v1.0.

## DEF-010 — Code for IBM i CALL + DSPLY evidence path is not yet proven on PUB400
**Severity:** High (workflow validation)

The compile Action is aligned with current Code for IBM i local-action variables and `OPTION(*EVENTF)`, but static review cannot prove where DSPLY output will surface when the program is invoked through the chosen learner workflow on PUB400.

**Action:** During the smoke test, explicitly record where the message appears. If the Call Action does not provide clear learner-visible output, revise the run/evidence workflow rather than teaching an unproven UI assumption.
