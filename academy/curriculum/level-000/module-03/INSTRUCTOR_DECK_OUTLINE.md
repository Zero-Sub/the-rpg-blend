# Module 3 Instructor Deck Outline

## Procedures, Service Programs, and Domain Design

**Status:** Content Complete — final visual deck production follows Academy slide standards.  
**Target:** 24–28 slides plus optional lab/backup slides.

## Slide 1 — Title
Module 3 — Procedures, Service Programs, and Domain Design

## Slide 2 — Why This Module Exists
From code that works in one program to a reusable capability with a contract, owner, controlled interface, and evidence.

## Slide 3 — Where Module 3 Fits
Module 0 orientation → Module 1 RPG fundamentals → Module 2 SQL/data → **Module 3 Model / Domain Services** → Module 4 testing/readiness.

## Slide 4 — Learning Outcomes
Condense the measurable outcomes into five groups: contracts, ILE object model, binding/interface governance, domain design, proof/review.

## Slide 5 — The Learning Loop
Learn → Practice → Prove → Review → Explain.

## Slide 6 — Procedure vs Capability
Show local helper extraction versus a reusable domain capability. Emphasize cohesion/coupling.

## Slide 7 — Responsibility Map
View / Controller / Model-Domain / Data Services with Coffee Company examples.

## Slide 8 — Contract First
`DCL-PR` + `DCL-PI`; inputs, outputs, side effects, failure behavior.

## Slide 9 — Business-Facing Structures
`OrderRequest_t`, `ProductSnapshot_t`, `OrderDecision_t`.

## Slide 10 — What Does Not Belong in the Domain Contract
SQLCODE, database row layouts, DSPF fields, HTTP payloads, transport-specific errors.

## Slide 11 — ILE Object Mental Model
Procedure → `*MODULE` → `*SRVPGM` → bound caller.

## Slide 12 — `NOMAIN` and Exported Procedures
Explain reusable module purpose and public/private procedure intent.

## Slide 13 — Build Evidence
Source revision, resolved command, diagnostics, build library, object proof.

## Slide 14 — Service Programs
What `*SRVPGM` is and is not. No ordinary `CALL` entry point.

## Slide 15 — Binding by Reference
Caller dependency relationship and why actual resolution must be proven.

## Slide 16 — Binding Directories
Benefits and governance risk. “Convenience without ownership becomes ambiguity.”

## Slide 17 — Binder Language
Show supported public export:

```text
STRPGMEXP PGMLVL(*CURRENT) SIGNATURE('RPGBAORDDOMV1')
  EXPORT SYMBOL('EVALUATEORDER')
ENDPGMEXP
```

## Slide 18 — Public Interface = Compatibility Commitment
Why private helpers stay private; signature stability; impact of incompatible changes.

## Slide 19 — Coffee Company Domain Flow
Request + trusted product snapshot → `EvaluateOrder` → stable decision.

## Slide 20 — Business Outcomes vs Technical Failures
Examples: invalid quantity/inactive/insufficient vs database/authority/object failures.

## Slide 21 — Hidden State
Activation group, static storage, job state, data areas, library list, caches, open paths, adopted authority.

## Slide 22 — IBM Bob in Module 3
Explain, boundary review, hidden-state scan, test ideas, documentation. Learner validates everything material.

## Slide 23 — Evidence Is Layered
Compiler evidence ≠ runtime evidence ≠ architecture evidence ≠ review evidence.

## Slide 24 — Guided Labs
Five labs with one-line purpose each.

## Slide 25 — Break It Safely
Disposable-branch compatibility experiment: predict → observe → recover → explain.

## Slide 26 — Independent Challenge
Inactive-product rule; no step-by-step Bob/instructor direction.

## Slide 27 — Completion Criteria
80%, no critical safety failure, labs/evidence complete, independent explain-back.

## Slide 28 — What Comes Next
Module 4 — Testing, Validation, and Production Readiness.

# Optional backup slides

- Code for IBM i build command anatomy
- Full behavior matrix
- Troubleshooting prototype/PI mismatch
- Troubleshooting wrong service-program resolution
- Signature compatibility discussion
- Bob finding disposition examples
- Production safety checklist

# Instructor notes

Keep the deck conceptual and demonstration-oriented. Do not turn it into a command catalog. The learner should spend more time predicting, building, testing, and explaining than reading slides.

Build/runtime screenshots and exact Code for IBM i labels must be captured only after the designated environment validation; do not fabricate screenshots for validation-pending behavior.
