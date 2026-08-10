# Module 2 Capstone Blueprint — Customer Validation Procedures

## Metadata

- **Level:** 100 — Associate Foundations
- **Module:** 100-02 — Data Structures and Procedures
- **Lab:** 100-02-08
- **Working title:** Customer Validation Procedures
- **Difficulty:** Independent / Capstone
- **Estimated time:** 120 minutes plus review
- **Application area:** Customer Master
- **Status:** Blueprint — student and instructor versions not yet drafted

## Scenario

The RPG Blend Coffee Company is preparing customer-entry logic that may later be called from more than one interface. The current prototype stores related customer values in loose fields and mixes validation rules with the caller's working state.

The development request is to create a small, testable customer-validation component that makes the data shape and procedure contracts explicit before persistence is introduced in a later module.

## Objective

Build an original fully free-form RPG component that:

1. models customer and address data with reusable definitions;
2. uses qualified/nested structures to make ownership clear;
3. stores multiple validation issues safely in a bounded structured collection;
4. validates customer data through explicit procedure interfaces;
5. treats input customer data as read-only unless a requirement explicitly states otherwise;
6. returns or produces a clear validation result;
7. compiles and runs in the isolated Academy environment;
8. passes the required normal, boundary, invalid, and capacity tests;
9. produces a focused Git diff and evidence record;
10. uses Bob only after an independent first working attempt and dispositions every finding.

## Starting Point

Planned repository paths:

```text
academy/curriculum/level-100/module-02/
  src/
    capstone/
      start/
      solution/
  lab/
  assessment/
```

Exact source filenames, program object names, build library, and IFS deployment path will be added only after the source compiles in the validation environment.

## Required Technical Elements

The final learner solution will include, at minimum:

- `Address_t` reusable definition;
- `Customer_t` reusable definition containing qualified address data;
- `ValidationIssue_t` reusable definition;
- `ValidationResult_t` reusable definition containing status/count and a bounded issue collection;
- at least two procedures with explicit interfaces;
- deliberate `CONST` use for read-only structured input;
- one return value or result parameter whose semantics the learner can explain;
- bounded array/data-structure-array processing;
- no hidden dependency on production data or external database objects.

## Proposed Business Rules

These are **Academy training rules**, not universal customer-data standards. Final field lengths and rules must be documented in the course as fictional requirements.

Candidate rules:

- Customer name is required.
- At least one address line is required for the shipping address.
- City is required.
- State/province code has an Academy-defined maximum length rather than assuming every real address is a two-character US state.
- Postal code is treated as character data, not numeric data.
- Validation stops adding issues when the defined issue-array capacity is reached and records the capacity condition visibly.
- The validation procedures must not modify the caller's customer structure when the contract is read-only.

Avoid introducing real-email-format claims or international-address rules that the module cannot support accurately.

## Proposed Test Matrix

Final exact values will be frozen after source validation.

| Test | Input condition | Expected result | Risk proved |
|---|---|---|---|
| T1 | All required fields valid | Valid; zero issues | Normal path |
| T2 | Blank customer name | Invalid; name issue | Required-field detection |
| T3 | Blank shipping city | Invalid; city issue | Nested-field access |
| T4 | Blank postal code when course rule requires it | Invalid; postal issue | Character field handling |
| T5 | Multiple independent invalid fields | Multiple issues in expected order/count | Structured array accumulation |
| T6 | Maximum valid field lengths | Valid or documented result | Boundary capacity |
| T7 | Enough invalid conditions to reach issue capacity | No out-of-bounds write; capacity behavior explicit | Array safety |
| T8 | Customer input snapshot before/after validation | Identical | `CONST` / side-effect discipline |
| T9 | Deliberate PR/PI mismatch in disposable branch | Compile failure with recorded diagnostic | Contract checking |
| T10 | Restored correct source | Clean compile and full matrix pass | Regression proof |

## Learner Tasks — Planned Shape

The student version will provide business requirements and checkpoints without giving away the full source.

1. Verify host, profile, branch, source path, build library, and intended program object.
2. Read the starter source and create a data/contract map.
3. Identify loose fields that belong to customer or address concepts.
4. Define reusable structure templates.
5. Create qualified/nested runtime instances.
6. Create the bounded validation-issue collection.
7. Write the validation procedure contract before writing its implementation.
8. Implement customer/address validation.
9. Hand-trace at least one multi-issue case.
10. Compile and prove the expected object.
11. Run the entire test matrix and record expected versus actual results.
12. Compare customer input before/after validation.
13. Inspect `git diff` and remove unrelated changes.
14. Ask Bob to review the intended diff for data-shape, contract, side-effect, bounds, and missing-test risks.
15. Accept, correct, or reject every Bob finding with evidence.
16. Run regression tests after any accepted change.
17. Commit only the intended source and approved evidence.
18. Explain the completed solution without Bob open.

## Bob Review Prompt — Draft

After completing a first working version:

```text
Review this RPG customer-validation change as a cautious IBM i teammate.
Do not modify the files.

For each finding, report:
1. The exact source evidence
2. Whether the issue is definite or only a hypothesis
3. Data-structure or array risk
4. Procedure-contract or side-effect risk
5. Parameter-semantics risk
6. A test that could confirm or reject the finding
7. Any dependency or caller impact that cannot be proven from the supplied source

Pay special attention to qualified/nested data, array capacity, PR/PI matching,
CONST/VALUE behavior, hidden globals, and missing boundary tests.
```

The student must verify the output against source, compiler diagnostics, runtime tests, and course references before changing code.

## Evidence Package

Required evidence will include:

- verified connection/target record;
- data/contract map;
- source filenames and program object;
- compile action and meaningful diagnostic IDs;
- proof the expected object was created;
- completed test matrix;
- before/after input comparison proving intended side-effect behavior;
- final `git status` and focused diff review;
- Bob prompt/output summary and finding dispositions;
- final commit ID when the course workflow authorizes commit;
- learner explanation of one design tradeoff and one remaining risk.

## Critical Failures

Any of these blocks capstone completion until corrected:

- production or unauthorized environment/data use;
- secret or protected-data exposure;
- out-of-bounds array access;
- optional parameter accessed without proving it was supplied;
- unintended modification of caller data;
- unresolved procedure-interface mismatch;
- AI-generated code the learner cannot explain;
- false or missing evidence;
- unrelated destructive source changes.

## Instructor Solution Requirements

The instructor package must include:

- compile-tested completed source;
- expected program output/test evidence;
- full test matrix;
- alternate acceptable designs and tradeoffs;
- common misconceptions;
- scoring rubric;
- coaching questions;
- reset/recovery procedure;
- Bob finding examples that should be accepted, rejected, or investigated further.

## Completion Criteria

The capstone is complete when the learner can demonstrate that the modeled data shape matches the stated Academy requirements, all procedure contracts are explicit and compile-validated, all required tests pass, input mutation behavior matches the contract, no array bound is exceeded, the Git diff is focused, Bob findings are evidence-dispositioned, and the learner can explain the implementation independently.
