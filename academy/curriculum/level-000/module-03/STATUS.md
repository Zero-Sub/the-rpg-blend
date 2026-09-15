# Module 3 Status

## Current state

**Content Complete — IBM i Validation Pending**

The instructional design and source package are complete enough for technical validation. Module 3 is not yet a Release Candidate because the IBM i build/runtime path has not been proven on the designated training environment.

## Complete

- Canonical scope and learning objectives
- Eight lessons
- Five guided labs
- IBM Bob activities and verification rules
- Independent “Do It Without Me” challenge
- Knowledge/practical/explain-back assessment model
- Coffee Company domain-service contract and implementation source
- Controlled binder source
- Demo caller
- Behavior test matrix
- Validation runbook
- Student coursebook/workbook/lab guide
- Instructor guide/deck outline
- Quick reference
- Architecture decision and evidence checklist
- GitHub curriculum-map alignment
- Google Drive curriculum tracking alignment

## Validation still required before Release Candidate

- Compile `ORDERDOM *MODULE` on the designated IBM i training environment.
- Verify IFS `/INCLUDE` resolution.
- Create `ORDERDOM *SRVPGM` from stream-file binder source.
- Verify the binder export surface and signature.
- Verify binding-directory resolution.
- Compile and run the demo caller.
- Execute the full normal/boundary/invalid/regression matrix.
- Run the compatibility/break-it-safely lab.
- Recheck current Code for IBM i Actions behavior.
- Recheck current IBM Bob behavior used by the activities.
- Perform independent RPG technical review.
- Run a learner pilot.
- Close all Critical/High validation defects.

## Technical correction applied during finalization

The shared `order_domain_contracts.rpgleinc` file no longer begins with `**free`. The include is inserted after the caller/module has already established fully free-form RPG, so placing `**free` in the shared include could make the include invalid in that position. The source remains marked validation pending until compiled on IBM i.

## Promotion rule

Do not relabel this module Release Candidate until the validation runbook gates are complete and evidence is retained.
