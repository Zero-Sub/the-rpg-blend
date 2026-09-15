# Module 3 Lab Guide

**Status:** Content Complete — IBM i Validation Pending

All labs use an approved non-production IBM i environment and the Module 3 learner branch assigned by the instructor.

## Lab 1 — Find the Boundary

### Goal
Identify one Coffee Company business responsibility that should become a reusable domain capability.

### Steps
1. Open the starting Coffee Company flow in VS Code.
2. Verify branch and IBM i context before editing.
3. Mark each relevant block as presentation, orchestration, business rule, data access, or technical support.
4. List dependencies used by the business rule.
5. Select one boundary and explain why it should change independently.
6. Only after your own analysis, ask Bob to identify missed dependencies or questionable boundaries.
7. Disposition each material Bob finding.

### Success criteria
- Responsibility map is complete enough to explain the current flow.
- Chosen boundary has a coherent business purpose.
- No code change is made before the learner can explain the boundary.

### Evidence
Responsibility map, dependency list, boundary rationale, Bob dispositions.

## Lab 2 — Build a Reusable Module

### Goal
Create the shared contract and a `NOMAIN` RPG module implementing the Order Domain capability.

### Steps
1. Review `order_domain_contracts.rpgleinc`.
2. Confirm the include contains declarations/prototypes only and does not introduce a second source-form directive in the middle of the including source.
3. Review `order_domain.rpgle` and identify the public procedure versus private helper.
4. Review the Code for IBM i build action before running it.
5. Compile to `ORDERDOM *MODULE` with an approved `CRTRPGMOD` workflow.
6. Inspect diagnostics/event-file results.
7. Verify the intended `*MODULE` exists in the learner build library.
8. Review the Git diff.

### Success criteria
- Module compiles in the validated training environment.
- `EvaluateOrder` is implemented as the public domain operation.
- Private helper implementation remains outside the public contract.
- Source/build/object evidence refers to the same revision and environment.

## Lab 3 — Create and Bind a Service Program

### Goal
Expose the intended domain capability through a controlled service-program interface and prove a caller can resolve it.

### Steps
1. Review `order_domain.bnd`.
2. Predict the public export list before building.
3. Create `ORDERDOM *SRVPGM` from the compiled module using the approved binder-source workflow.
4. Inspect service-program export/signature evidence.
5. Create or verify the learner binding directory.
6. Add `ORDERDOM *SRVPGM` only if the correct entry is not already present.
7. Compile the demo caller using the intended binding directory.
8. Verify the caller resolves the intended service program.
9. Run the smoke test.

### Expected development smoke-test data
- quantity: 2
- unit price: 275.00
- subtotal: 550.00
- discount: 27.50
- final total: 522.50
- result: `OK`

These expectations remain validation pending until the designated IBM i run is recorded.

## Lab 4 — Move Business Rules into Domain Services

### Goal
Prove that extracting pricing/order validation into `ORDERDOM` preserves required behavior while improving separation of concerns.

### Steps
1. Capture the before-state behavior matrix.
2. Compare the old pricing/order rules with the domain implementation.
3. Confirm the public contract uses business meaning rather than screen/database layouts.
4. Build the module/service/caller.
5. Run every required case in `tests/order_domain_cases.md`.
6. Compare expected and actual behavior.
7. Review the final diff for accidental presentation/data-access leakage.
8. Perform a peer-style architecture review.

### Success criteria
- Required behavior matches the defined matrix.
- Domain contract does not expose SQL/display/transport details.
- Public interface remains intentionally small.

## Lab 5 — Break It Safely

### Goal
Learn why public service-program interface changes require deliberate compatibility management.

### Rules
Use a disposable branch. Do not merge the intentionally incompatible experiment.

### Steps
1. Record current binder signature and exports.
2. Make one deliberate public-interface change assigned by the instructor.
3. Predict which callers/builds should be affected.
4. Rebuild only the service program first when instructed.
5. Observe build/runtime evidence.
6. Rebuild/rebind the caller when the exercise requires it.
7. Restore the supported interface.
8. Re-run the baseline caller and tests.
9. Document prediction versus observation.

### Success criteria
- Learner explains why the compatibility result occurred.
- Supported interface is restored.
- No incompatible experiment remains on the supported branch.

# Independent Challenge — Do It Without Me

## Requirement
A product marked inactive cannot be ordered, and the returned business result must distinguish inactive product from insufficient quantity.

## Rules
Course references are allowed. Step-by-step instructor or Bob workflow direction is not allowed during implementation.

## Required work
1. Write acceptance criteria before editing.
2. Locate the correct contract and implementation.
3. Decide whether the public contract needs to change.
4. Make the smallest correct change.
5. Compile/rebuild the intended objects.
6. Verify object identity and binding.
7. Run normal, inactive, insufficient, invalid, and regression tests.
8. Review the Git diff and binder-source impact.
9. Ask Bob for review only after the independent implementation.
10. Explain the solution without AI assistance.

## Completion evidence
Submit the completed workbook evidence packet and explain-back.
