# Module 3 Assessment and Instructor Key

**Status:** Content Complete — IBM i Validation Pending  
**Scoring:** Knowledge 20% · Practical 60% · Explain-back/Review 20%  
**Minimum:** 80% overall and no critical safety failure.

# Learner Assessment

## Part A — Knowledge Check (20 points)

Answer each question in your own words. Two points each.

1. What is the practical difference between a `*MODULE` and a `*SRVPGM`?
2. Why is a service program not invoked like a normal `*PGM` with an ordinary program call?
3. What roles do `DCL-PR` and `DCL-PI` play in a procedure contract?
4. What does `NOMAIN` communicate about an RPG module?
5. What does binding by reference mean for a caller that uses a service-program procedure?
6. Why does the Academy use controlled binder source instead of exporting every eligible procedure?
7. What problem does a service-program signature help detect or control?
8. Why should SQLCODE/SQLSTATE normally remain outside a Model / Domain Service public contract?
9. Name two forms of hidden state that can make a reusable service harder to reason about.
10. What evidence is required before you can claim a refactor preserved required behavior?

## Part B — Practical Implementation (60 points)

### Requirement

A product marked inactive cannot be ordered. The returned business result must distinguish an inactive product from insufficient quantity.

### Rules

Complete the implementation without step-by-step IBM Bob or instructor workflow direction. Course/reference material is allowed. Bob may be used for review only after your independent implementation is complete.

### Required work

1. Write acceptance criteria before changing source.
2. Identify the correct public contract and implementation.
3. Decide whether the public interface must change and explain why.
4. Make the smallest correct source change.
5. Compile the intended `*MODULE`.
6. Create/update the intended `*SRVPGM` through the approved build path.
7. Compile the intended caller.
8. Verify the correct source revision, library, module, service program, caller, and binding relationship.
9. Execute normal, inactive-product, insufficient-quantity, invalid, and regression cases.
10. Review the Git diff and binder-source impact.
11. Ask Bob for post-implementation review and disposition any material findings.
12. Submit one internally consistent evidence packet.

### Practical rubric

| Area | Points | Full-credit evidence |
|---|---:|---|
| Acceptance criteria | 6 | Clear expected normal/invalid/boundary/regression behavior written before editing |
| Contract decision | 8 | Correctly identifies whether public contract changes are required and explains the compatibility impact |
| RPG implementation | 12 | Focused, readable change with no accidental infrastructure leakage |
| Build/object control | 10 | Correct source, module, service program, caller, library, and binding evidence |
| Tests | 12 | Required cases executed with expected vs actual results and regression evidence |
| Git/review discipline | 6 | Focused diff; binder/contract impact reviewed; no unrelated or sensitive material |
| Bob disposition | 6 | Material findings classified and independently validated |

## Part C — Explain-Back and Review (20 points)

Without AI-generated notes open, explain:

1. What business capability does `ORDERDOM` own?
2. What responsibilities does it deliberately not own?
3. Which procedure(s) are public and why?
4. Which implementation details remain private?
5. How does the caller resolve the service dependency?
6. What could happen if the public interface changes incompatibly?
7. Which outcomes are expected business decisions versus technical failures?
8. What state/lifetime assumptions were reviewed?
9. What evidence proves required behavior was preserved?
10. What remains unproven or environment-dependent?

### Explain-back rubric

| Area | Points |
|---|---:|
| Boundary and ownership | 5 |
| Contract/export/binding | 5 |
| Error/state reasoning | 4 |
| Evidence/test reasoning | 4 |
| Accurate limitations/unknowns | 2 |

# Instructor Key

Do not require exact wording. Grade the demonstrated mental model.

## Part A conceptual answers

### 1. `*MODULE` vs `*SRVPGM`
A `*MODULE` is a compiled ILE building block used during binding. A `*SRVPGM` is a bound reusable service object that exposes selected procedures to callers.

### 2. Why not ordinary program call?
A service program does not expose a normal program entry procedure like a `*PGM`; callers invoke its exported procedures through ILE procedure binding/call interfaces.

### 3. `DCL-PR` and `DCL-PI`
`DCL-PR` describes the callable prototype/contract a caller compiles against. `DCL-PI` defines the parameters/return contract inside the procedure implementation. They make interface agreement explicit and compiler-checkable.

### 4. `NOMAIN`
It tells the compiler the module has no main program entry procedure and is intended to provide procedures rather than act as a standalone program entry point.

### 5. Binding by reference
The caller is bound to an exported procedure provided by a service program rather than receiving a copy of that procedure implementation inside the caller. The service dependency remains an external bound runtime dependency.

### 6. Controlled binder source
It keeps the public interface intentionally small and reviewable. Exporting helpers casually creates compatibility commitments and unnecessary coupling.

### 7. Signature purpose
A service-program signature provides an interface compatibility checkpoint. It helps prevent existing bound callers from silently using an incompatible service-program interface.

### 8. Why SQLCODE/SQLSTATE stay out
They are persistence/technical implementation details. Domain callers should receive stable application-facing business/technical outcomes rather than becoming coupled to a particular SQL implementation.

### 9. Hidden-state examples
Any two well-explained examples: static/global storage, activation-group lifetime, job-scoped values, data areas, library list/current library, caches, open data paths, adopted authority, external environment/IFS state.

### 10. Refactor evidence
Expected answer includes before/after acceptance criteria and behavior tests plus build/object/source evidence. Strong answers distinguish compile evidence, runtime behavior evidence, architecture/boundary evidence, and review/Git evidence.

## Practical scoring notes

### Contract decision
For the supplied development reference contract, `ORDER_INACTIVE_PRODUCT` and the `active` product snapshot field already exist. A learner working from that baseline may correctly conclude that no new public shape is required; the implementation/test behavior may already support the rule. The important skill is discovering and proving the baseline rather than manufacturing a change. If the instructor supplies a starter state before the inactive rule exists, grade the learner's compatibility decision against that assigned baseline.

Do not force a code change merely to create activity. If the requirement is already satisfied, a strong learner should prove it, identify the existing contract behavior, run the tests, and avoid unnecessary modification.

### Build/object control
Full credit requires internally consistent evidence: the source revision reviewed must be the source compiled; the object library must be the intended training library; the caller must resolve the intended service program.

### Tests
At minimum include:
- allowed active product;
- inactive product;
- insufficient quantity;
- invalid quantity;
- pricing threshold/regression case.

### Bob
No points for merely pasting Bob output. Credit comes from useful findings plus independent disposition/evidence.

## Critical safety failures

Require remediation regardless of numeric score if the learner:

- builds into an unverified/prohibited library;
- uses production/client data in a lab or AI prompt;
- exposes credentials, tokens, or private keys;
- broadens/bypasses authority to avoid understanding a failure;
- claims success with mismatched source/object/test evidence;
- merges the intentionally incompatible compatibility experiment into the supported baseline.

## Instructor completion judgment

The learner is complete only when they can independently connect these ideas:

**business responsibility → contract → module → service program → binding → behavior evidence → review/governance**.

Syntax recall alone is not sufficient.
