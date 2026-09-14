# Module 3 Assessment Draft

**Status:** Development. Final scoring/key must be validated with the course source and pilot before release.

## Scoring

- Knowledge check: 20 points
- Practical implementation: 60 points
- Explain-back/review: 20 points
- Minimum overall score: 80/100
- Any critical safety failure requires remediation regardless of numeric score.

## Part A — Knowledge check (20 points)

2 points each. Select ten for the learner assessment; retain the rest as alternate/instructor questions.

1. What is the practical difference between a `*MODULE` and a `*SRVPGM`?
2. Why is a service program not invoked like a normal program with `CALL`?
3. What responsibilities do `DCL-PR` and `DCL-PI` serve?
4. When can `CONST` or `VALUE` improve the clarity of a procedure contract?
5. What does `NOMAIN` communicate about an RPG module?
6. What does binding by reference mean for a caller using a service program?
7. Why does this module use controlled binder source instead of exporting every eligible procedure?
8. What does a service-program signature help detect or control?
9. When can a binding directory improve maintainability, and what governance problem can it create?
10. Give one Coffee Company example of an expected business outcome and one example of a technical failure.
11. Why should SQLCODE or SQLSTATE normally remain outside a domain-service public contract?
12. Name two forms of hidden state that can make a reusable service harder to reason about.
13. What evidence is needed to claim that a refactor preserved required behavior?
14. Why is “more reusable” not automatically “better architecture”?
15. What should a developer do before accepting a Bob recommendation to split or combine service boundaries?

## Part B — Practical implementation (60 points)

### Requirement

A product marked inactive cannot be ordered. The returned business result must distinguish an inactive product from insufficient quantity.

### Required learner work

The learner must independently:

1. Write acceptance criteria before editing.
2. Identify the correct public contract and implementation.
3. Decide whether the public interface must change.
4. Make the smallest correct source change.
5. Compile the intended `*MODULE`.
6. Recreate/update the intended `*SRVPGM` through the approved build workflow.
7. Build the intended caller.
8. Prove the correct target objects were updated.
9. Execute required behavior tests.
10. Review the Git diff and binder-source impact.
11. Record Bob review only after the independent implementation.
12. Submit an evidence packet.

### Practical rubric

| Area | Points | Full-credit evidence |
|---|---:|---|
| Acceptance criteria | 6 | Clear normal/invalid/boundary/regression expectations before code change |
| Contract decision | 8 | Correctly identifies whether a public-contract change is necessary and explains why |
| RPG implementation | 12 | Focused, readable change; no accidental implementation leakage |
| Build/object control | 10 | Correct source, module, service program, caller, library, and binding evidence |
| Tests | 12 | Required cases pass; expected vs actual recorded |
| Git/review discipline | 6 | Focused diff; binder/contract changes reviewed; no unrelated files/secrets |
| Bob disposition | 6 | Material findings recorded as Accept/Reject/Investigate/Defer with evidence |

## Part C — Explain-back and review (20 points)

The learner explains the solution without AI-generated notes open.

### Prompt set

- What business capability does `ORDERDOM` own?
- What does it deliberately not own?
- Which symbols are public and why?
- Which implementation details remain private?
- How does the caller resolve the service dependency?
- What would happen if the supported public interface changed incompatibly?
- What business failures can the service return?
- What technical failures remain outside this contract?
- What state assumptions exist?
- What evidence proves that required behavior was preserved?

### Explain-back rubric

| Area | Points |
|---|---:|
| Boundary/ownership explanation | 5 |
| Contract/export/binding explanation | 5 |
| Error/state explanation | 4 |
| Evidence/test explanation | 4 |
| Limits/unknowns stated accurately | 2 |

## Critical safety failures

Examples include:

- compiling to an unverified or prohibited library;
- using production/client data in a lab or AI prompt;
- exposing credentials/tokens/private keys;
- granting/bypassing authority to avoid understanding a failure;
- claiming success with mismatched source/object/test evidence;
- merging the intentionally incompatible compatibility experiment into the supported baseline.

## Instructor key — conceptual expectations

The final answer key should not require memorized wording. It should reward these concepts:

- module = compiled ILE building block; service program = bound reusable service object exposing selected procedures;
- service procedures are called through bound procedure interfaces rather than treating the service program as a normal program entry point;
- prototypes/interfaces make contracts explicit and allow compile-time agreement checking;
- controlled exports keep the public API intentionally small;
- signatures support interface compatibility checking;
- binding directories simplify dependency resolution but require ownership and hygiene;
- domain services own business behavior, not SQL/display/transport mechanics;
- hidden runtime state must be removed, made explicit, or documented/tested;
- compile success, runtime success, and architecture quality are distinct evidence questions;
- AI review is advisory until independently verified.