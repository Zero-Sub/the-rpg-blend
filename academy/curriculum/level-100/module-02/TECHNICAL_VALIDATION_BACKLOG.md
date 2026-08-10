# RPGBA-101 Module 2 — Technical Validation Backlog

**Status:** Open  
**Release rule:** Keep Module 2 in Development Draft until source review, IBM i execution, tool workflow, independent review, and learner-pilot gates are complete.

## A. Curriculum and Handoff

- [ ] Resolve the sequencing conflict between the canonical blueprint (`100-02 Data Structures and Procedures`) and the current Module 1 deck handoff to Db2/file-processing fundamentals.
- [ ] Confirm that Module 2 deepens rather than repeats Module 1's introductory arrays and internal-procedure content.
- [ ] Confirm later modules retain sufficient room for file I/O, Db2, ILE/service programs, and embedded SQL.

## B. RPG Syntax and Semantics

- [ ] Verify `DCL-DS` syntax used by every example on the target IBM i environment.
- [ ] Verify `QUALIFIED` structure use and nested qualification.
- [ ] Verify nested `LIKEDS` design chosen for billing and shipping addresses.
- [ ] Verify arrays and data-structure arrays with `DIM`.
- [ ] Verify `%ELEM` against the exact array examples used in labs.
- [ ] Verify `TEMPLATE` definitions cannot accidentally be treated as runtime instances in course wording.
- [ ] Verify `LIKEDS` and `LIKE` behavior in the final source.
- [ ] Verify every planned `POS` example and decide whether the student should author it or only recognize it.
- [ ] Verify original legacy subroutine example syntax if `BEGSR`/`EXSR` recognition remains in Lesson 5.
- [ ] Verify `DCL-PR`, `DCL-PROC`, and `DCL-PI` source patterns.
- [ ] Create an intentional PR/PI mismatch and capture the actual compiler diagnostic.
- [ ] Verify return-value syntax for structures or scalar results selected by the capstone.
- [ ] Verify `CONST` compile behavior by intentionally attempting to modify a read-only parameter in a disposable validation branch.
- [ ] Verify `VALUE` behavior with a small scalar and record caller/callee evidence.
- [ ] If `OPTIONS(*NOPASS)` remains student-authored, verify the safe `%PARMS` pattern and every branch before release.
- [ ] Decide whether `*OMIT` is recognition-only or hands-on. If hands-on, validate omitted-parameter detection and all error paths.
- [ ] Keep `*VARSIZE` recognition-only unless a compelling associate-level use case and safe validation design are approved.

## C. Data Model and Test Design

- [ ] Finalize `Address_t`, `Customer_t`, `ValidationIssue_t`, and `ValidationResult_t` field definitions.
- [ ] Document why each field exists and why its length/type is appropriate for a fictional training domain.
- [ ] Ensure no training rule is presented as a universal real-world customer-data rule.
- [ ] Define issue-array capacity and the behavior when capacity is reached.
- [ ] Define blank, maximum-length, invalid, and normal test values for every required field.
- [ ] Prove that read-only customer input is unchanged after validation.
- [ ] Prove result issue count never exceeds array capacity.
- [ ] Add at least one regression test showing that a template change produces expected compile impact.
- [ ] Add at least one test where compile success exists but business/contract behavior is wrong, so learners practice separating syntax proof from design proof.

## D. VS Code and Code for IBM i Workflow

- [ ] Record actual VS Code version used for validation.
- [ ] Record actual Code for IBM i version used for validation.
- [ ] Record actual RPGLE language extension version used for validation.
- [ ] Confirm Outline/reference navigation instructions match current UI behavior.
- [ ] Confirm the Academy compile Action works for every Module 2 source target.
- [ ] Confirm resolved source path, build library, program object, `OPTION(*EVENTF)`, debug view, target release, and replacement behavior before execution.
- [ ] Capture event-file/Problems-view evidence from one deliberate source error.
- [ ] Confirm all deliberate defects are removed before release packaging.

## E. Git Workflow

- [ ] Create clean starter and solution directories.
- [ ] Confirm `git status` is clean at every published checkpoint.
- [ ] Confirm compile/deploy workflow does not modify tracked source unexpectedly.
- [ ] Confirm `.gitignore` excludes generated/transient evidence where appropriate.
- [ ] Verify learner instructions stage only intended source/evidence files.
- [ ] Confirm the capstone can be completed from a clean clone without undocumented local files.

## F. IBM Bob Workflow

- [ ] Verify the current Bob product name, relevant review workflow, and UI terminology against current IBM documentation.
- [ ] Verify no Module 2 prompt requires production data, credentials, or protected system output.
- [ ] Create a standard finding-disposition format: finding, fact/assumption, accepted/corrected/rejected, evidence, residual risk.
- [ ] Test Bob prompts for data-shape explanation, procedure-contract review, hidden-global detection, impact analysis, and boundary-test suggestions.
- [ ] Confirm each lesson includes independent work before Bob review.
- [ ] Add one deliberately misleading or incomplete source context to prove learners can identify where Bob lacks evidence.

## G. Compile / Runtime Matrix

Create after final source filenames and object names are approved.

| ID | Source | Target object | Expected compile | Expected runtime/test behavior | Status |
|---|---|---|---|---|---|
| L1 | TBD | TBD | Success | Simple qualified customer structure behaves as predicted | Open |
| L2 | TBD | TBD | Success | Nested billing/shipping values remain distinct | Open |
| L3 | TBD | TBD | Success | Structured array count/bounds correct | Open |
| L4 | TBD | TBD | Success | Template/LIKEDS instances match intended shape | Open |
| L5 | TBD | TBD | Success | Converted procedure matches legacy example behavior | Open |
| L6 | TBD | TBD | Success | Procedure contract and return value verified | Open |
| L7 | TBD | TBD | Success | Parameter semantics and safe optional behavior verified | Open |
| CAP-S | TBD | TBD | Success | Starter establishes valid baseline | Open |
| CAP-I | TBD | TBD | Success | Full customer-validation matrix passes | Open |

## H. Assessment Validation

- [ ] Map every question to a measurable objective.
- [ ] Include recall, interpretation, application, troubleshooting, and judgment.
- [ ] Keep hands-on work the largest component.
- [ ] Verify answer key explains why choices are correct or unsafe.
- [ ] Ensure no assessment requires syntax or options not taught or identified as prerequisites.
- [ ] Confirm AI-use mode is explicit for knowledge assessment and capstone.

## I. Independent Review and Pilot

- [ ] A reviewer other than the author completes every lab from the documented starting point.
- [ ] Reviewer confirms all paths, source files, commands, object names, and expected results.
- [ ] Reviewer flags any wording that sounds like a universal IBM recommendation when it is actually Academy practice.
- [ ] Target associate-level learner completes the module.
- [ ] Record actual lesson/lab time and intervention points.
- [ ] Fix all Critical and High defects before release-candidate labeling.

## Exit Condition

This backlog reaches release-candidate status only when every blocking item is passed or explicitly removed from scope with a recorded decision and rationale.
