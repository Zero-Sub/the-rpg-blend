# Module 0 — Canonical Gap Assessment and Drift Report

**Module:** IBM i Orientation  
**Delivery subtitle:** Your First Controlled IBM i Development Change  
**Assessment date:** August 18, 2026  
**Decision:** READY TO REBUILD

## Executive finding

The existing Module 0 direction is sound: it correctly emphasizes IBM i orientation, modern tooling, safe context verification, VS Code/Code for IBM i, complementary ACS usage, operational awareness, the first compile/run loop, Git evidence, and responsible AI use.

The module does **not** require a restart.

The principal defect is learner independence. Two target learners required experienced IBM i developer guidance during the pilot. That demonstrates that the current materials contain useful information but do not yet reliably convert that information into an independent workflow for the intended learner.

The remediation is therefore to make Module 0 more intentional, not larger.

## KEEP / MOVE / EXPAND / REMOVE / ADD

| Current content | Decision | Destination | Reason / required change |
|---|---|---|---|
| IBM Power vs IBM i vs application | KEEP | Module 0 | Essential beginner mental model; make concrete and action-oriented |
| AS/400 / iSeries / System i terminology | KEEP | Module 0 | Recognition only; use IBM i as current Academy wording |
| Libraries, objects, jobs, source members, IFS | KEEP + EXPAND | Module 0 | Tie each term to what the learner will actually navigate or verify |
| Native/SQL vocabulary translation | KEEP | Module 0 | Preserve nuance; do not teach native terminology as wrong |
| Production/nonproduction safety boundary | KEEP | Module 0 | Apply it in every lab and evidence record |
| VS Code + Code for IBM i | KEEP | Module 0 | Primary development workflow |
| Db2 for i extension | KEEP | Module 0 | Introductory observation/query use only; deeper SQL is Module 2 |
| ACS / Run SQL Scripts | KEEP | Module 0 | Complementary tool; teach when it is appropriate |
| Navigator for i / PDI | KEEP | Module 0 | Recognition/observation, not administration proficiency |
| Collection Services / Job Watcher / Disk Watcher configuration | MOVE | Later support/performance instruction | Module 0 learner recognizes purpose and escalation boundary only |
| SEU / PDM / RDi / STRSQL / 5250 | KEEP as recognition | Module 0 | Real-world interoperability; not Academy default |
| Git first principles | MOVE as teaching | Engineering Foundations | Reinforce Git evidence here |
| Git status/diff/commit evidence | KEEP | Module 0 | Required proof of controlled change |
| Testing first principles | MOVE as teaching | Engineering Foundations | Apply expected/actual thinking here |
| General AI prompting/verification principles | MOVE as teaching | Engineering Foundations | Reinforce in IBM i context here |
| IBM Bob | KEEP as implementation example | Module 0 | Product cannot define the durable competency |
| Bob-specific workflows/labels | MOVE | Bob implementation/reference material | Version-sensitive; revalidate before delivery |
| First RPG source inspection | KEEP | Module 0 | Needed to learn the workflow, not RPG language depth |
| First controlled RPG change | KEEP + EXPAND | Module 0 | Must become Coffee Company continuity and include prediction/evidence |
| Compile / diagnostics / run | KEEP + EXPAND | Module 0 | Explicit source → command → object → runtime evidence chain |
| Introductory SQL context query | KEEP | Module 0 | Read-only context observation |
| SQL DDL/data manipulation | MOVE | Module 2 — Db2 for i and SQL | Too deep for orientation |
| HELLO-only continuity | REMOVE / REPLACE | Coffee Company starter | Disconnected throwaway exercise conflicts with connected reference application rule |
| Formal Blend MVC instruction | DO NOT ADD | Later modules | Premature architectural complexity |
| Tool-selection decision model | EXPAND | Module 0 | Organize around problems, not product feature lists |
| Troubleshooting ladder | ADD | Module 0 | Required by pilot evidence |
| Expected-result and recovery cues | ADD | Every lab | Removes tacit expert dependency |
| Independent completion gate | ADD | Module 0 capstone | Learner must prove capability without expert navigation |
| Pilot intervention telemetry | ADD | Instructor validation materials | Repeated intervention becomes measurable curriculum defect |

## Learning progression audit

### LEARN

The learner must understand enough IBM i vocabulary, context, safety, source/object flow, and tool roles to make sense of the development workflow.

**Finding:** Strong content exists, but it can arrive too densely before the learner has a concrete problem to attach it to.

### PRACTICE

The learner performs a guided Coffee Company workflow: verify context, locate source, identify target, predict, edit, compile, diagnose, run, observe, review, and capture evidence.

**Finding:** Current activities are useful but need a consistent learner-facing structure and clearer expected states.

### PROVE

The learner completes a second Coffee Company change independently.

**Finding:** This is the most important remediation. Pilot evidence shows the current module has not yet demonstrated independent success.

### REVIEW

The learner uses a fixed review checklist covering context, diff, compile result, object target, runtime result, SQL observation, AI findings, sensitive-data handling, and escalation boundaries.

**Finding:** Existing evidence-first material is strong and should be preserved.

### EXPLAIN

The learner explains the source-to-object path, why a tool was selected, what the compiler proved, what runtime evidence proved, and what AI did or did not contribute.

**Finding:** Present in current material but must become an explicit completion requirement.

## Prerequisite audit

### Engineering Foundations

Teach before or outside Module 0:

- source-control mental model;
- test/evidence basics;
- specification/acceptance criteria;
- code-review basics;
- AI-assisted engineering basics;
- security/secrets fundamentals.

### Introduce in Module 0

- IBM Power and IBM i relationship;
- IBM i integrated environment;
- Db2 for i role;
- libraries, objects, jobs, source members, IFS;
- library/source/target context;
- IBM i tool-selection model;
- source → compile → object → run evidence chain;
- IBM i-specific safety and escalation boundaries.

### Undocumented assumption to eliminate

The learner must not be expected to know how to recover when the UI, environment, or result differs from the happy-path instructions.

## RPG Blend Method mapping

| Stage | Module 0 treatment |
|---|---|
| Assess | PRIMARY |
| Understand | PRIMARY |
| Stabilize | REINFORCED |
| Test | REINFORCED / introduced in IBM i context |
| Modernize | NOT APPLICABLE as a development competency |
| Validate | PRIMARY |
| Document | REINFORCED |
| Govern | PRIMARY |
| Repeat | REINFORCED |

The canonical RPG Blend Method is the governing framework. Any prior Module 0 “safe loop” or “operating loop” language may remain only as an operational checklist under the Method, not as a competing methodology.

## Blend MVC mapping

- View — NOT APPLICABLE as a taught competency
- Controller — NOT APPLICABLE as a taught competency
- Model / Domain Services — NOT APPLICABLE as a taught competency
- Data Services — NOT APPLICABLE as a taught competency

Coffee Company is introduced without premature architecture. Formal responsibility separation comes later when the learner can understand it meaningfully.

## AI audit

The existing behavior is mostly correct: use AI to explain, analyze, diagnose, suggest tests, and review; never outsource verification, security, testing, correctness, or final decisions.

The required correction is abstraction.

**Durable competency:** AI-assisted engineering.  
**Implementation example:** IBM Bob.

Module 0 mastery cannot be defined as successful use of Bob. The independent task must also prove that AI has not become a substitute for learner understanding or instructor dependency.

## Coffee Company continuity

### Starting state

A deliberately small Coffee Company Git repository and approved IBM i training environment.

### Learner changes

- verify context;
- locate source;
- identify compile target;
- predict one visible behavior;
- make a small controlled change;
- compile and interpret diagnostics;
- run and validate;
- perform one approved read-only SQL observation;
- review Git evidence;
- use AI for bounded explanation/review;
- document the result;
- complete a second independent change.

### Ending state

A known-good Coffee Company starter program, buildable in the learner's approved environment, with a clean evidence record and focused Git history. Module 1 begins from this exact state.

## Enterprise realism audit

### Preserve

- least privilege;
- nonproduction/public training boundary;
- source and target verification;
- no PHI/customer data/secrets/tokens/private keys in evidence or AI prompts;
- read-only SQL by default;
- no shared collector/configuration changes;
- focused Git diffs;
- diagnostic evidence;
- escalation when work crosses role boundaries.

### Strengthen

- troubleshooting by symptom;
- expected-versus-actual comparison;
- explicit source-to-object evidence;
- human review boundary;
- independence measurement;
- documentation of instructor intervention during pilots.

## Measurable competency matrix

| Competency | Exercise | Evidence | Review criterion |
|---|---|---|---|
| Verify IBM i context | Context lab | host/profile/library/source/target record | All context fields correct |
| Select appropriate tool | Scenario set | selection + rationale | Correct tool or escalation boundary identified |
| Locate Coffee Company source | Navigation lab | source/target record | Learner locates without instructor navigation |
| Predict impact | First-change lab | written expected result | Prediction exists before execution |
| Make controlled change | Coffee Company change | focused Git diff | Only intended change present |
| Compile correctly | Build lab | diagnostic/result + object proof | Correct target object created |
| Diagnose simple failure | Controlled error | cause, evidence, correction | Evidence-based recovery |
| Validate runtime | Run lab | expected vs actual | Result matches requirement |
| Use SQL safely | Read-only context query | query/result explanation | Learner states what result proves and does not prove |
| Use AI responsibly | AI review | finding disposition | Findings independently verified |
| Commit safely | Git lab | commit | Intended source only |
| Explain workflow | Explain-back | instructor rubric | Learner defends context, change, evidence, and decisions independently |

## Pilot finding

### HIGH — Learner independence not yet reliable

Two target learners required experienced IBM i developer guidance during Module 0.

This is treated as curriculum evidence. It indicates that one or more prerequisite assumptions, transitions, navigation instructions, recovery paths, or completion cues are insufficiently explicit for the target learner.

Do not guess the exact friction points after the fact. Capture them in the next pilot using intervention telemetry.

### Next-pilot acceptance standard

A learner must complete the core workflow with course materials, approved references, and bounded AI assistance without step-by-step expert direction.

For each major step record:

| Step | Independent | Reference used | AI used | Instructor hint | Instructor intervention | Friction |
|---|---|---|---|---|---|---|

Repeated instructor intervention on the same step is a curriculum defect to remediate before release.

## Drift severity

### CRITICAL

None identified in the underlying IBM i orientation philosophy or technical direction.

### HIGH

1. Pilot learners required expert guidance.
2. Coffee Company is not yet the continuous Module 0 application backbone.
3. AI competency is expressed too closely through IBM Bob in older artifacts.
4. Engineering Foundations and IBM i-specific instruction are mixed.
5. Tool information can exceed the learner's working context before they have a concrete task.

### MEDIUM

1. Performance/tooling detail should be compressed around tool selection and escalation.
2. Guided labs need consistent expected-state and recovery instructions.
3. Troubleshooting must become explicit competency.
4. Explain-back must become a formal completion gate.
5. Prior local loop terminology must be subordinated to the canonical RPG Blend Method.
6. Deeper SQL content belongs in Module 2.

### LOW

1. Canonical title should be Module 0 — IBM i Orientation.
2. Coffee branding remains optional delivery personality, not curriculum taxonomy.
3. Tool and product labels must be normalized across coursebook/workbook/lab/deck.
4. Historical timing and superseded versions must remain archived rather than reintroduced.

## Estimated disposition

- **KEEP:** 55%
- **MOVE:** 15%
- **EXPAND:** 20%
- **REMOVE:** 10%

### Major ADD requirements

- Coffee Company from day one;
- troubleshooting ladder;
- standardized guided-lab frame;
- learner navigation cues;
- independent-completion gate;
- pilot intervention telemetry;
- canonical Method framing;
- AI-neutral competency definitions.

## Recommendation

**READY TO REBUILD**

The approved rebuild target is the canonical architecture in `MASTER_COURSE_PACKAGE.md` and `README.md`. Learner-facing prose and delivery artifacts should now be reconciled to that contract before another pilot.
