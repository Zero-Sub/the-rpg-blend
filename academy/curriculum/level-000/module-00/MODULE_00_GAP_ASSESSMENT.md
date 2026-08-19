# Module 0 — Canonical Audit, Drift Report, and Remediation Record

**Module:** IBM i Orientation  
**Delivery subtitle:** Your First Controlled IBM i Development Change  
**Audit date:** August 18, 2026  
**Remediation source-package update:** August 19, 2026  
**Audit recommendation:** READY TO REBUILD  
**Current remediation status:** Canonical learner/instructor source package rebuilt; validation gates remain

## Executive finding

The prior Module 0 direction was sound: IBM i orientation, modern tooling, context verification, VS Code/Code for IBM i, complementary ACS usage, operational awareness, first compile/run experience, Git evidence, and responsible AI use were all worth preserving.

The principal defect was learner independence. Two target learners required experienced IBM i developer guidance during the pilot. That demonstrated that useful information existed, but the module did not yet reliably convert that information into an independent workflow for the intended learner.

The remediation therefore focused on intentional sequencing rather than making the module larger.

## KEEP / MOVE / EXPAND / REMOVE / ADD decisions

| Prior content | Decision | Destination | Remediation |
|---|---|---|---|
| IBM Power vs IBM i vs application | KEEP | Module 0 | Rebuilt as action-oriented context model |
| AS/400 / iSeries / System i terminology | KEEP | Module 0 | Recognition only; IBM i remains current terminology |
| Libraries, objects, jobs, source members, IFS | KEEP + EXPAND | Module 0 | Tied directly to learner navigation and build context |
| Native/SQL vocabulary translation | KEEP | Module 0 | Preserved as orientation; deeper SQL deferred |
| Production/nonproduction safety boundary | KEEP | Module 0 | Embedded in lab, workbook, assessment, instructor guide |
| VS Code + Code for IBM i | KEEP | Module 0 | Retained as development home base |
| Db2 for i extension | KEEP | Module 0 | Read-only observation; deeper SQL remains Module 2 |
| ACS / Run SQL Scripts | KEEP | Module 0 | Reframed as problem-driven complementary tooling |
| Navigator for i / PDI | KEEP | Module 0 | Recognition/observation, not administration proficiency |
| Collection Services / Job Watcher / Disk Watcher configuration | MOVE | Later support/performance curriculum | Module 0 teaches recognition and escalation only |
| SEU / PDM / RDi / STRSQL / 5250 | KEEP as recognition | Module 0 | Real-world interoperability; not Academy default |
| Git first principles | MOVE as teaching | Engineering Foundations | Git evidence retained in Module 0 application |
| Testing first principles | MOVE as teaching | Engineering Foundations | Expected/actual evidence applied here |
| General AI prompting/verification principles | MOVE as teaching | Engineering Foundations | IBM i-specific application retained |
| IBM Bob | KEEP as implementation example | Module 0 | Durable competency renamed AI-assisted engineering |
| Bob-specific workflows/labels | MOVE | Bob implementation/reference material | Version-sensitive and revalidation required |
| First RPG source inspection | KEEP | Module 0 | Preserved without turning Module 0 into RPG syntax course |
| First controlled RPG change | KEEP + EXPAND | Module 0 | Converted to Coffee Company continuity with evidence |
| Compile / diagnostics / run | KEEP + EXPAND | Module 0 | Explicit source → build → object → runtime evidence chain |
| Introductory SQL context query | KEEP | Module 0 | Read-only observation |
| SQL DDL/data manipulation | MOVE | Module 2 — Db2 for i and SQL | Removed from orientation competency |
| HELLO-only continuity | REMOVE / REPLACE | Coffee Company | Replaced by `COFFEE00` starter and continuous evidence record |
| Formal Blend MVC instruction | DO NOT ADD | Later modules | Avoided premature architecture |
| Tool-selection decision model | EXPAND | Module 0 | Rebuilt around problem → tool → boundary |
| Troubleshooting ladder | ADD | Module 0 | Added to lab, workbook, lesson, instructor guide |
| Expected-result and recovery cues | ADD | Every guided workflow | Added to canonical lab frame |
| Independent completion gate | ADD | Module 0 capstone | Implemented as “Do It Without Me” |
| Pilot intervention telemetry | ADD | Instructor validation | Added intervention log and 0–4 scale |

## Learning progression

### LEARN

Learner gains only the IBM i vocabulary, context, safety, source/object flow, and tool roles needed to perform the orientation workflow.

**Remediation:** six canonical lessons now attach concepts to concrete tasks instead of front-loading disconnected terminology.

### PRACTICE

Learner performs a guided Coffee Company workflow: verify context, locate source, identify target, predict, compile, diagnose, change, run, observe, review, and capture evidence.

**Remediation:** the guided lab now uses Before → Goal → Do → Expect → Recover → Prove → Explain.

### PROVE

Learner completes a second Coffee Company change independently.

**Remediation:** the independent challenge now explicitly prohibits step-by-step instructor navigation and AI-supplied workflow before the learner's first attempt.

### REVIEW

Learner reviews context, diff, build result, target object, runtime, SQL observation, AI findings, sensitive-data handling, and escalation boundaries.

**Remediation:** evidence record, workbook, and assessment now use consistent review criteria.

### EXPLAIN

Learner explains source-to-object flow, tool choice, build evidence, runtime evidence, Git evidence, and AI boundaries.

**Remediation:** explain-back is now an assessed completion component rather than an optional reflection.

## Prerequisite boundary

### Engineering Foundations owns

- source-control mental model;
- test/evidence basics;
- specification/acceptance criteria;
- code-review basics;
- AI-assisted engineering basics;
- security/secrets fundamentals.

### Module 0 introduces/applies

- IBM Power / IBM i relationship;
- integrated IBM i environment;
- Db2 for i orientation;
- libraries, objects, jobs, source members, IFS;
- source/build/target context;
- IBM i tool-selection model;
- source → compile → object → run evidence chain;
- IBM i-specific safety and escalation boundaries.

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

No competing “safe change methodology” remains. Operational checklists are subordinate to the canonical Method.

## Blend MVC mapping

- View — not assessed
- Controller — not assessed
- Model / Domain Services — not assessed
- Data Services — not assessed

Coffee Company is introduced without premature architecture.

## AI audit result

The durable competency is **AI-assisted engineering**. IBM Bob remains an IBM i-oriented implementation example, not the definition of mastery.

Learners may use approved AI to explain, diagnose, review, suggest tests, and improve documentation. They remain responsible for context, verification, security, testing, review, and final decisions.

## Coffee Company continuity

### Starting state

A deliberately small Coffee Company Git/workspace source and approved IBM i training environment.

### Module 0 learner work

- verify context;
- locate `COFFEE00.rpgle`;
- identify target;
- predict baseline behavior;
- compile and verify baseline;
- diagnose a controlled compile failure;
- make one small specified message change;
- run and validate;
- perform one approved read-only SQL observation;
- review Git evidence;
- use AI for bounded explanation/review;
- document the result;
- complete a second independent change.

### Ending state

A known-good Coffee Company starter program, buildable in the learner's approved environment, with an evidence record and focused source-control history. Module 1 starts from this state.

## Enterprise realism

Preserved and strengthened:

- least privilege;
- approved nonproduction/training boundary;
- source/target verification;
- no PHI/customer data/secrets/tokens/private keys in evidence or AI prompts;
- read-only SQL by default;
- no shared collector/configuration changes;
- focused Git evidence;
- diagnostic evidence;
- escalation when work crosses role boundaries;
- distinction between compiler evidence, runtime evidence, Git evidence, and AI suggestions.

## Pilot finding

### HIGH — Learner independence not yet reliable

Two target learners required experienced IBM i developer guidance during the August 18 pilot.

This remains open until the re-pilot demonstrates that the rebuilt curriculum resolves the issue.

The new pilot telemetry uses:

0. Independent
1. Clarification only
2. Hint required
3. Step-by-step guidance required
4. Instructor performed action

The independent challenge release target is level **0 or 1**.

## Drift severity after source-package remediation

### CRITICAL

None identified in the technical/orientation philosophy.

### HIGH — open until validation

1. Learner independence must be re-proven with a new target learner.
2. Actual learner-equivalent environment must be smoke-tested against the new Coffee Company workflow.

### MEDIUM — remaining publication work

1. Version-sensitive tool/product claims require pre-delivery revalidation.
2. Formatted coursebook and deck must be regenerated from the rebuilt source package.
3. Screenshots/visuals must be refreshed and sanitized against current UI.

### LOW

Editorial polish and timing may be adjusted after pilot telemetry, but should not change the canonical competency architecture without a recorded curriculum decision.

## Estimated disposition from the original audit

- KEEP: 55%
- MOVE: 15%
- EXPAND: 20%
- REMOVE: 10%

## Remediation artifacts completed

- six canonical learner lessons;
- Coffee Company `COFFEE00` starter;
- Coffee Company build/run templates;
- guided lab;
- student workbook;
- preflight checklist;
- tool-selection guide;
- troubleshooting guide;
- Coffee Company Change Evidence Record;
- competency-based assessment;
- instructor guide;
- pilot intervention log;
- reconciled source/manual register;
- updated canonical README and master package.

## Current recommendation

**SOURCE PACKAGE REBUILT — VALIDATION REQUIRED BEFORE RELEASE**

No additional curriculum decision is blocking Module 0. The next required work is empirical: smoke-test the actual environment, regenerate formatted delivery artifacts, and run a new independent target-learner pilot.
