# The RPG Blend Academy

## Module 0 — IBM i Orientation

**Delivery subtitle:** Your First Controlled IBM i Development Change  
**Layer:** 2 — IBM i / RPG Core  
**Status:** Canonical learner/instructor source package rebuilt; environment validation and independent re-pilot required  
**Primary environment:** Visual Studio Code + Code for IBM i  
**Reference application:** Coffee Company  
**Source-package review:** August 19, 2026

## Purpose

Module 0 prepares a programmer new to IBM i to work safely enough to begin RPG instruction. It establishes platform orientation, problem-driven tool selection, context verification, source/object navigation, a controlled compile/run workflow, diagnostics, read-only SQL observation, Git evidence, bounded AI-assisted engineering, troubleshooting, and independent explain-back.

Deeper RPG development begins in Module 1 — RPG Foundations.

## Canonical RPG Blend alignment

**Core principle:** Technology follows the problem.

**Core promise:**

> Understand the system.  
> Make a controlled change.  
> Prove the result.  
> Repeat.

**RPG Blend Method alignment**

- PRIMARY: Assess, Understand, Validate, Govern
- REINFORCED: Stabilize, Test, Document, Repeat
- NOT YET A DEVELOPMENT COMPETENCY: Modernize

Blend MVC is not assessed in Module 0. The learner does not need View / Controller / Model-Domain Services / Data Services complexity before RPG and data-access foundations exist.

## Academy learning loop

Every lesson uses:

**Learn → Practice → Prove → Review → Explain**

Every guided procedure uses:

**Before you start → Goal → Do this → Expect to see → If not → Prove it → Explain it**

## Target learner

A programmer with basic software-development and relational-data knowledge who is new to IBM i. No prior RPG or 5250 experience is required.

Transferable Git, testing/evidence, specification, review, AI-assisted engineering, and basic security concepts belong in Engineering Foundations and are applied here in IBM i context.

## Completion outcome

The learner must independently be able to:

1. verify approved IBM i connection, identity, source, build library, and target;
2. distinguish IBM Power, IBM i, libraries/objects, IFS/file-system artifacts, editable source, and compiled program objects at a beginner working level;
3. select an appropriate starting tool for common development, SQL, 5250, operational-observation, and performance-evidence scenarios;
4. find the Coffee Company starter source and identify its target;
5. predict baseline behavior before running it;
6. make one minimal requirement-driven change;
7. compile using the approved build path and interpret a basic diagnostic;
8. prove the intended `*PGM` was created/updated;
9. run and compare expected with actual behavior;
10. execute an approved read-only SQL observation;
11. review Git evidence;
12. use AI for explanation/review while independently verifying material claims;
13. follow the troubleshooting ladder before escalating;
14. explain and defend the complete evidence chain without step-by-step expert direction.

## Toolbelt

- **VS Code + Code for IBM i:** development home base.
- **Db2 for i extension:** SQL in the development workflow when practical.
- **IBM i Access Client Solutions:** Run SQL Scripts, 5250, spooled files, data transfer, database tooling, selected SQL/performance work.
- **IBM Navigator for i:** approved browser-based operational/admin observation.
- **PDI / Collection Services / Job Watcher / Disk Watcher / SQL performance tools:** recognition/evidence categories here; configuration is specialist/authorized work.
- **Approved AI assistant:** explanation, diagnosis, review, test/documentation assistance. IBM Bob is the Academy's primary IBM i implementation example when available.

Legacy tools such as SEU, PDM, STRSQL, and RDi are recognition/interoperability topics, not the Academy default workflow.

## Coffee Company continuity

Module 0 now uses `COFFEE00.rpgle` as the connected starter instead of disconnected HELLO exercises.

The learner establishes the first Coffee Company known-good state, makes a controlled message change, gathers evidence, and independently completes a second change. This state carries into Module 1.

## Canonical lesson sequence

1. Prework — Workstation and Access Preflight
2. 0.1 — Where Am I?
3. 0.2 — Which Tool Do I Use?
4. 0.3 — Find the Coffee Company
5. 0.4 — First Controlled Change
6. 0.5 — Observe, Review, and Prove
7. 0.6 — Do It Without Me

## Canonical source package

The rebuilt package includes:

- six canonical lessons;
- Coffee Company RPG starter and build/run templates;
- guided lab;
- student workbook;
- preflight checklist;
- tool-selection guide;
- troubleshooting guide;
- Coffee Company Change Evidence Record;
- competency-based assessment;
- instructor guide;
- pilot intervention log;
- source/manual register;
- canonical drift/gap assessment.

See `README.md` for the exact file map and current status.

## AI boundary

The durable competency is AI-assisted engineering, not successful operation of IBM Bob, Claude, ChatGPT, Copilot, or another vendor product.

AI may help explain, diagnose, review, suggest tests, and improve documentation. The learner remains responsible for context, security, correctness, testing, verification, review, and final decisions. The independent challenge cannot be completed by having AI supply the workflow.

## Troubleshooting ladder

1. Stop.
2. Restate the goal.
3. Verify host → profile → source → library → target.
4. Compare expected versus actual.
5. Read diagnostic/evidence.
6. Use course troubleshooting references.
7. Use approved AI assistance for explanation when appropriate.
8. Verify suggestions.
9. Escalate with goal, expected, actual, diagnostic, context, and checks already performed.

## Pilot evidence

The August 18, 2026 pilot showed that two target learners required experienced IBM i developer guidance during Module 0. This is a **HIGH curriculum defect: learner independence not yet reliable** until a new target-learner pilot demonstrates otherwise.

The next pilot records assistance levels from 0 (independent) through 4 (instructor performed an action). The independent challenge target is level 0 or 1 with no unresolved Critical/High curriculum defect.

## Assessment model

- Knowledge: 20%
- Guided evidence: 20%
- Independent Coffee Company challenge: 50%
- Explain-back: 10%

A critical safety failure, inability to identify source/target, or inability to complete the independent workflow requires remediation regardless of numerical score.

## Enterprise safety requirements

Use an approved non-production/training environment and least privilege. Do not expose credentials, tokens, private keys, PHI, client data, or unnecessary confidential system information. Do not change shared performance/security/system configuration in Module 0. SQL observation is read-only unless a separately controlled lab explicitly authorizes otherwise. Git history, AI output, and compile success are evidence sources, not substitutes for authorization, testing, or engineering judgment.

## Technical verification required before delivery

Revalidate against current primary documentation and the actual training environment:

- Code for IBM i support/prerequisites, UI, Actions, and diagnostics;
- Db2 for i extension workflow/prerequisites;
- ACS features demonstrated;
- Navigator/PDI labels and navigation;
- IBM Bob capabilities/product labels/data-handling guidance;
- compiler/PTF behavior;
- actual Coffee Company build/deploy action;
- organization/provider-specific access and authority constraints.

## Release gate

The editable source package is rebuilt, but Module 0 is not release-complete until:

1. the learner-equivalent environment passes smoke testing;
2. version-sensitive claims are revalidated;
3. formatted coursebook/deck outputs are regenerated from this package;
4. a new target learner completes the independent challenge at intervention level 0 or 1; and
5. no Critical or High curriculum defect remains open.
