# Module 1 Live PUB400 Run Checklist

Use this tomorrow as the shortest path through the blocking validation work.

## Preflight

- [ ] Connect to `pub400.com` using SSH port `2222`.
- [ ] Record learner user profile.
- [ ] Record actual primary and secondary private libraries.
- [ ] Record `/home/<user>` and the Module 1 deploy path.
- [ ] Verify `.env` contains only learner-specific library values and is ignored by Git.
- [ ] Verify Git branch is `academy/module-1-validation` and working tree starts clean.
- [ ] Inspect `.vscode/actions.json` before first compile.

## Compile/run targets

- [ ] `M1L1MAP`
- [ ] `M1L1IND`
- [ ] `M1L2DATA`
- [ ] `M1L3EXPR`
- [ ] `M1L4DEC`
- [ ] `M1L5LOOP`
- [ ] `M1L6PROC`
- [ ] `M1CAPST`
- [ ] `M1CAPSOL`

For each target record compile result, diagnostic IDs, object library, runtime expected, runtime actual, and evidence location.

## Diagnostic workflow proof

- [ ] Create one deliberate compile error on a disposable validation change.
- [ ] Compile with the checked-in Action using `OPTION(*EVENTF)`.
- [ ] Verify Code for IBM i surfaces the diagnostic and identifies the correct source location.
- [ ] Revert the deliberate error.
- [ ] Recompile cleanly.

## Lesson-specific runtime checks

- [ ] L1A includes `Welcome Avery to RPGBA-101`.
- [ ] L1B includes `Welcome Jordan to RPGBA-101-M1`.
- [ ] L2 includes final total `712.50`.
- [ ] L3 shows name `AVERY JONES`, subtotal `599.97`, discount `29.99`, final `569.98`; explain that `%DEC` is deliberate here and `%DECH` would half-adjust the raw 29.9985 value to 30.00.
- [ ] L4 at 500.00 shows standard discount and rate .0500.
- [ ] L5 shows count 5, total 2874.99, highest 1000.00.
- [ ] L6 shows discount 37.50.

## Capstone core cases

- [ ] -0.01 -> invalid
- [ ] 0.00 -> invalid
- [ ] 0.01 -> discount 0.00, final 0.01, STANDARD, installments 0.00/0.00/0.01
- [ ] 499.99 -> 0.00, 499.99, STANDARD, 166.66/166.66/166.67
- [ ] 500.00 -> 25.00, 475.00, STANDARD, 158.33/158.33/158.34
- [ ] 750.00 -> 37.50, 712.50, STANDARD, 237.50/237.50/237.50
- [ ] 999.99 -> 50.00, 949.99, PRIORITY, 316.66/316.66/316.67
- [ ] 1000.00 -> 100.00, 900.00, PRIORITY, 300.00/300.00/300.00

## Shipping-boundary supplement

- [ ] 789.46 -> discount 39.47 -> final 749.99 -> STANDARD
- [ ] 789.47 -> discount 39.47 -> final 750.00 -> PRIORITY
- [ ] 789.48 -> discount 39.47 -> final 750.01 -> PRIORITY

## Workflow checks

- [ ] Record where DSPLY output actually appears when using the learner run workflow.
- [ ] Verify every created *PGM is in the expected learner library.
- [ ] Verify no source, object, or evidence crosses another PUB400 user's space.
- [ ] Run `git status` and `git diff --check` after validation.
- [ ] Confirm no `.env`, credentials, generated output, or environment-specific evidence is staged.

## Stop rule

Do not mark Gate G2 complete or merge PR #19 if any Critical/High finding is still open or if any expected result has not been proven by actual execution.
