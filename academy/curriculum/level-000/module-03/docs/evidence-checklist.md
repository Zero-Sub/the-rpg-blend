# Module 3 Evidence Checklist

Use this checklist for labs, assessment, technical validation, and release review.

## 1. Context

- [ ] Git branch recorded.
- [ ] Git revision/commit recorded.
- [ ] IBM i connection/host alias recorded.
- [ ] User profile recorded without credentials.
- [ ] Build library recorded.
- [ ] Local source path recorded.
- [ ] Remote IFS source path recorded.
- [ ] Intended module/service-program/caller objects identified.

## 2. Source and contract

- [ ] Public contract reviewed before implementation.
- [ ] `OrderRequest_t`, `ProductSnapshot_t`, and `OrderDecision_t` use business-facing meaning.
- [ ] No accidental SQL/display/transport layout leaks into the public contract.
- [ ] Read-only inputs use deliberate parameter semantics.
- [ ] Public procedure(s) are explicitly identified.
- [ ] Private helper(s) remain private.

## 3. Module build

- [ ] Resolved `CRTRPGMOD` command captured.
- [ ] Compile diagnostics reviewed.
- [ ] `ORDERDOM *MODULE` verified in the intended library.
- [ ] Compile evidence refers to the expected source revision.
- [ ] Include resolution is proven for the deployed IFS layout.

## 4. Service program

- [ ] Resolved service-program creation command captured.
- [ ] Correct module is bound into `ORDERDOM *SRVPGM`.
- [ ] Stream-file binder source is the intended source.
- [ ] Export surface verified.
- [ ] Signature verified.
- [ ] `CalculateDiscount` is not public in the supported interface.

## 5. Binding / caller

- [ ] Binding directory/library is verified.
- [ ] No unintended duplicate dependency entry was added.
- [ ] Caller compile command captured.
- [ ] Caller object verified.
- [ ] Caller resolves the intended `ORDERDOM *SRVPGM`.

## 6. Behavior tests

- [ ] Negative quantity.
- [ ] Zero quantity.
- [ ] Product mismatch.
- [ ] Inactive product.
- [ ] Insufficient quantity.
- [ ] Small valid order.
- [ ] Just below 5% threshold.
- [ ] Exact 5% threshold.
- [ ] Normal 5% case.
- [ ] 999.99 precision/rounding case.
- [ ] Exact 10% threshold.
- [ ] Regression behavior from the prior pricing rule.

For each case record expected, actual, pass/fail, source revision, and environment.

## 7. Architecture review

- [ ] Business behavior is owned by Model / Domain Services.
- [ ] Presentation behavior is outside the service.
- [ ] Data-access implementation is outside the service.
- [ ] Controller/orchestration behavior is outside the service.
- [ ] Public interface is cohesive and minimal.
- [ ] Hidden state/dependency review completed.
- [ ] Activation-group/lifetime assumptions documented where relevant.
- [ ] Error model distinguishes expected business outcomes from technical failures.

## 8. Git review

- [ ] `git status` reviewed.
- [ ] focused `git diff` reviewed.
- [ ] every changed line can be explained.
- [ ] binder-source changes reviewed explicitly.
- [ ] public contract changes reviewed explicitly.
- [ ] no credentials/generated output/unrelated changes are included.

## 9. IBM Bob review

- [ ] Learner-first analysis completed where required.
- [ ] Prompt/context contains no sensitive/production data.
- [ ] Material Bob findings recorded.
- [ ] Each finding is Accept / Reject / Investigate / Defer.
- [ ] Accepted/corrected findings have independent evidence.
- [ ] AI review is not represented as human approval.

## 10. Independent challenge

- [ ] Acceptance criteria written before coding.
- [ ] Learner determined whether public contract change was necessary.
- [ ] Implementation completed without step-by-step Bob/instructor direction.
- [ ] Intended objects rebuilt/verified.
- [ ] Required tests executed.
- [ ] Git/binder impact reviewed.
- [ ] Bob used only for post-implementation review.
- [ ] Learner explained solution independently.

## 11. Release Candidate gate

- [ ] Live IBM i compile succeeds.
- [ ] IFS include resolution verified.
- [ ] Binder-source service-program creation verified.
- [ ] Binding resolution verified.
- [ ] Full test matrix passes.
- [ ] Compatibility lab behaves as documented.
- [ ] Current Code for IBM i workflow revalidated.
- [ ] Current IBM Bob activities revalidated.
- [ ] Independent RPG technical review complete.
- [ ] Learner pilot complete.
- [ ] All Critical/High defects closed.

Module 3 may be labeled Release Candidate only after all applicable RC-gate items are complete and the evidence is retained.
