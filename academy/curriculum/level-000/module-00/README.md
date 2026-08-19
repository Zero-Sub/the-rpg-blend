# Module 0 — IBM i Orientation

**Delivery subtitle:** Your First Controlled IBM i Development Change  
**Layer:** 2 — IBM i / RPG Core  
**Status:** Canonical learner/instructor source package rebuilt; environment validation and new pilot still required  
**Primary development environment:** Visual Studio Code + Code for IBM i  
**Connected reference application:** Coffee Company  
**Last source-package review:** August 19, 2026

## Purpose

Module 0 gives a developer who is new to IBM i enough platform and tooling fluency to work safely before deeper RPG instruction begins.

The module is intentionally not an RPG syntax survey, IBM i administration course, performance-tuning course, or green-screen nostalgia tour. It teaches the learner to orient themselves, select an appropriate tool, verify context, make one controlled Coffee Company change, prove the result, recover from a simple failure, and explain what happened.

## Canonical RPG Blend alignment

**Core principle:** Technology follows the problem.

**Core promise:**

> Understand the system.  
> Make a controlled change.  
> Prove the result.  
> Repeat.

Method alignment:

- **PRIMARY:** Assess, Understand, Validate, Govern
- **REINFORCED:** Stabilize, Test, Document, Repeat
- **NOT YET TAUGHT AS A DEVELOPMENT COMPETENCY:** Modernize

Blend MVC is not an assessed Module 0 competency. Formal View / Controller / Model-Domain Services / Data Services responsibilities are deferred until the learner has the required RPG and data-access foundation.

## Prerequisites

The learner should already have the transferable Engineering Foundations needed to participate safely:

- basic programming and relational-data concepts;
- source-control purpose and basic Git mental model;
- basic test/evidence concepts;
- specification and acceptance-criteria basics;
- code-review basics;
- AI-assisted engineering fundamentals, including verification and data-handling boundaries.

No IBM i, RPG, or 5250 experience is required.

## Measurable completion outcome

A learner completes Module 0 only when they can independently:

1. connect to the approved IBM i training environment;
2. verify host, identity, source, build library, and target context;
3. distinguish source, IFS/file-system artifacts, and compiled IBM i objects at a beginner level;
4. choose an appropriate tool for a basic IBM i development, SQL, or operational-observation task;
5. locate the Coffee Company starter source;
6. predict the effect of one small assigned change;
7. make the controlled change;
8. compile with the approved action and interpret the result;
9. prove which object was created and where;
10. run and compare expected with actual behavior;
11. execute an approved read-only SQL observation and explain its evidence limits;
12. inspect Git status/diff and commit only intended source;
13. use an approved AI assistant for explanation or review without outsourcing the workflow or final decision;
14. follow the troubleshooting ladder when expected and actual differ;
15. explain the change and evidence chain without step-by-step instructor direction.

## Academy learning loop

Every learner-facing activity follows:

**Learn → Practice → Prove → Review → Explain**

Guided procedures use:

1. Before you start
2. Goal
3. Do this
4. Expect to see
5. If you do not see it
6. Prove it
7. Explain it

## Lesson sequence

| Lesson | Title | Primary result |
|---|---|---|
| Prework | Workstation and Access Preflight | Workstation/access ready before instruction |
| 0.1 | Where Am I? | Learner identifies IBM i context and safety boundary |
| 0.2 | Which Tool Do I Use? | Learner selects tools by problem |
| 0.3 | Find the Coffee Company | Learner locates source and target without changing it |
| 0.4 | First Controlled Change | Learner predicts, changes, compiles, diagnoses, runs, validates |
| 0.5 | Observe, Review, and Prove | Learner uses read-only SQL, Git evidence, and AI-assisted review correctly |
| 0.6 | Do It Without Me | Learner independently completes a controlled Coffee Company change |

## Source package

```text
module-00/
├── README.md
├── MASTER_COURSE_PACKAGE.md
├── MODULE_00_GAP_ASSESSMENT.md
├── lessons/
│   ├── 00-01-where-am-i.md
│   ├── 00-02-which-tool-do-i-use.md
│   ├── 00-03-find-the-coffee-company.md
│   ├── 00-04-first-controlled-change.md
│   ├── 00-05-observe-review-prove.md
│   └── 00-06-do-it-without-me.md
├── code/
│   ├── rpg/COFFEE00.rpgle
│   └── cl/
│       ├── setup-training-workspace.cl
│       ├── compile-coffee00.cl
│       └── run-coffee00.cl
├── lab/module-00-lab.md
├── assessment/module-00-assessment.md
├── workbook/
│   ├── student-workbook.md
│   ├── preflight-checklist.md
│   ├── tool-selection-guide.md
│   ├── troubleshooting-guide.md
│   └── coffee-company-change-record.md
├── instructor-notes/
│   ├── instructor-guide.md
│   └── pilot-intervention-log.md
└── sources/source-register.md
```

## Tool-selection model

VS Code is the Academy development home base, but tool choice follows the problem.

- VS Code + Code for IBM i — primary IBM i development workflow.
- Db2 for i extension — SQL in the modern development workflow when practical.
- ACS — Run SQL Scripts, 5250, spooled files, data transfer, database tooling, and selected SQL/performance work.
- Navigator for i — approved browser-based operational/admin observation.
- PDI / Collection Services / Job Watcher / Disk Watcher / SQL performance tools — recognition/evidence categories in Module 0; configuration belongs to authorized specialist work.
- Approved AI assistant — explanation/review/diagnosis; IBM Bob is the Academy's primary IBM i implementation example when available.

Learners recognize SEU, PDM, STRSQL, RDi, and other existing workflows without treating them as the Academy default.

## Coffee Company continuity

Module 0 establishes the first Coffee Company baseline. The starter is intentionally small because the competency is the workflow, not RPG complexity.

By completion the learner has:

- a working Coffee Company workspace;
- a verified IBM i connection;
- a known learner build library;
- a compiling/runnable `COFFEE00` program;
- focused Git/evidence records;
- a completed Coffee Company Change Evidence Record;
- an independently completed second change.

That state becomes the starting point for Module 1 — RPG Foundations.

## Troubleshooting ladder

1. Stop.
2. Restate the goal.
3. Verify host → profile → source → library → target.
4. Compare expected versus actual.
5. Read the diagnostic/evidence.
6. Use the troubleshooting guide.
7. Use approved AI assistance for explanation if appropriate.
8. Verify any suggestion.
9. Escalate with goal, expected, actual, diagnostic, context, and checks already performed.

## Pilot finding and release gate

The August 18, 2026 pilot showed that two target learners required experienced IBM i developer guidance during Module 0. This remains a **HIGH curriculum defect** until a new target-learner pilot demonstrates reliable independence.

The next pilot must record intervention telemetry. The independent challenge target is intervention level **0 or 1** with no unresolved Critical/High curriculum defect.

## Curriculum status

- [x] Canonical module placement and purpose locked
- [x] RPG Blend Method alignment defined
- [x] Academy learning loop embedded
- [x] Coffee Company continuity implemented in source package
- [x] AI competency separated from IBM Bob product usage
- [x] Engineering Foundations prerequisite boundary defined
- [x] Tool-selection model defined
- [x] Six canonical learner lessons rebuilt
- [x] Guided lab rebuilt to the canonical lab frame
- [x] Student workbook rebuilt
- [x] Assessment rebuilt around demonstrated competency
- [x] Instructor guide rebuilt
- [x] Troubleshooting guide added
- [x] Tool-selection quick guide added
- [x] Preflight checklist added
- [x] Coffee Company Change Evidence Record added
- [x] Pilot intervention log added
- [x] HELLO-only starter removed from canonical source package
- [x] Source/manual register reconciled to current Academy reference set
- [ ] Run actual learner-equivalent environment smoke test
- [ ] Revalidate version-sensitive Code for IBM i, Db2 tooling, ACS, Navigator/PDI, and IBM Bob claims immediately before delivery
- [ ] Reconcile/generated formatted coursebook and deck to this source package
- [ ] Run new independent target-learner pilot
- [ ] Resolve all Critical/High pilot defects before release

## Source-of-truth rule

This GitHub package is the editable source of truth for Module 0 curriculum, code, labs, assessment, evidence templates, instructor guidance, and release history. Formatted delivery artifacts must conform to it and must not reintroduce superseded lesson structure, HELLO-only continuity, or product-specific AI competency definitions.
