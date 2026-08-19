# Module 0 — IBM i Orientation

**Delivery subtitle:** Your First Controlled IBM i Development Change  
**Layer:** 2 — IBM i / RPG Core  
**Status:** Canonical architecture locked; learner materials require rebuild against this contract  
**Primary development environment:** Visual Studio Code + Code for IBM i  
**Connected reference application:** Coffee Company  
**Last architecture review:** August 18, 2026

## Purpose

Module 0 gives a developer who is new to IBM i enough platform and tooling fluency to work safely before deeper RPG instruction begins.

The module is intentionally not an RPG syntax survey, IBM i administration course, performance-tuning course, or green-screen nostalgia tour. It teaches the learner to orient themselves, select an appropriate tool, verify context, make one controlled Coffee Company change, prove the result, and explain what happened.

## Canonical RPG Blend alignment

**Core principle:** Technology follows the problem.

**Core promise:**

> Understand the system.  
> Make a controlled change.  
> Prove the result.  
> Repeat.

Module 0 introduces and reinforces these RPG Blend Method stages:

- **PRIMARY:** Assess, Understand, Validate, Govern
- **REINFORCED:** Stabilize, Test, Document, Repeat
- **NOT YET TAUGHT AS A DEVELOPMENT COMPETENCY:** Modernize

Blend MVC is not an assessed competency in Module 0. The Coffee Company application is introduced as a connected application that will evolve across later modules. Formal View / Controller / Model-Domain Services / Data Services responsibilities are deferred until the learner has the required RPG and data-access foundation.

## Prerequisites

The learner should already have the transferable Engineering Foundations needed to participate safely:

- basic programming concepts;
- basic relational-data concepts;
- source-control purpose and basic Git mental model;
- basic test/evidence concepts;
- specification and acceptance-criteria basics;
- code-review basics;
- AI-assisted engineering fundamentals, including verification and data-handling boundaries.

No IBM i, RPG, or 5250 experience is required.

## Measurable completion outcome

A learner completes Module 0 only when they can independently:

1. connect to the approved IBM i training environment;
2. verify host, identity, library/source/target context;
3. distinguish local Git source, source members, IFS stream files, and compiled IBM i objects at a beginner level;
4. choose an appropriate tool for a basic IBM i development, SQL, or operational-observation task;
5. locate the Coffee Company starter source;
6. predict the effect of one small assigned change;
7. make the controlled change;
8. compile with the approved action and interpret the result;
9. prove which object was created and where;
10. run the program and compare expected with actual behavior;
11. execute an approved read-only SQL context query and explain what it proves and does not prove;
12. inspect Git status/diff and commit only the intended source;
13. use an approved AI assistant for explanation or review without outsourcing the workflow or final decision;
14. explain the entire change and evidence chain without step-by-step instructor direction.

## Academy learning loop

Every learner-facing activity must follow:

**Learn → Practice → Prove → Review → Explain**

Every guided lab must use the same instructional frame:

1. **Before you start** — required starting state.
2. **Your goal** — the problem to solve.
3. **Do this** — exact guided action.
4. **Expect to see** — observable success signal.
5. **If you do not see it** — first recovery steps.
6. **Prove it** — required evidence.
7. **Explain it** — what the learner must be able to defend.

## Lesson architecture

| Lesson | Title | Primary result |
|---|---|---|
| Prework | Workstation and Access Preflight | Workstation is ready before live instruction begins |
| 0.1 | Where Am I? | Learner can describe IBM i context and safety boundary |
| 0.2 | Which Tool Do I Use? | Learner selects tools by problem rather than product preference |
| 0.3 | Find the Coffee Company | Learner locates source and identifies target without changing it |
| 0.4 | First Controlled Change | Learner predicts, changes, compiles, diagnoses, runs, and validates |
| 0.5 | Observe, Review, and Prove | Learner uses read-only SQL, Git evidence, and AI-assisted review correctly |
| 0.6 | Do It Without Me | Learner independently completes a second controlled Coffee Company change |

Live teaching should be treated as a half-day orientation. Workstation installation/configuration is prework and should not consume the core learning session.

## Tool-selection model

VS Code is the Academy development home base, but no tool is presented as universally correct.

| Need | Typical Module 0 starting tool |
|---|---|
| Edit/navigate RPG and IBM i development artifacts | VS Code + Code for IBM i |
| Work with Db2 for i SQL | Db2 for i extension; ACS Run SQL Scripts where its richer database workflow is appropriate |
| 5250, spooled output, data transfer, selected operational tasks | IBM i Access Client Solutions |
| Browser-based system/operational observation | IBM Navigator for i |
| Existing performance evidence | Navigator/PDI or approved existing evidence; escalate before collector/configuration changes |
| AI-assisted explanation/review | Approved AI assistant; IBM Bob is the Academy's primary IBM i-oriented implementation example |

Learners recognize SEU, PDM, RDi, STRSQL, and 5250 workflows so they can support real systems. They are not the Academy's default development path.

## AI-assisted engineering boundary

The durable competency is AI-assisted engineering, not mastery of one product.

The learner may use an approved AI assistant to:

- explain unfamiliar RPG, CL, SQL, DDS, and IBM i concepts;
- identify dependencies or assumptions;
- interpret diagnostics;
- suggest tests;
- review a diff;
- help draft documentation.

IBM Bob may be used for these activities as the standard IBM i implementation example.

The learner remains responsible for context, security, verification, testing, review, and final decisions. AI must not become a substitute instructor that carries the learner through the independent workflow.

## Coffee Company continuity

Module 0 establishes the Coffee Company application baseline.

Starting repository shape:

```text
coffee-company/
├── README.md
├── src/
├── docs/
└── evidence/
```

The starter application must remain intentionally small. Module 0 is about platform orientation and the development workflow, not application architecture.

By the end of Module 0 the learner has:

- a working local repository;
- a verified IBM i connection;
- a known build library;
- a compiling/runnable Coffee Company starter RPG program;
- one focused change committed;
- one completed Coffee Company Change Evidence Record.

That exact state is the starting point for Module 1 — RPG Foundations.

## Troubleshooting ladder

When the learner is stuck, the course teaches this sequence:

1. Stop making additional changes.
2. Restate the goal.
3. Verify host, identity, library, source, and target context.
4. Compare expected versus actual behavior.
5. Read the diagnostic or available evidence.
6. Use the course troubleshooting guide.
7. Use an approved AI assistant for explanation if appropriate.
8. Verify any AI suggestion against source, diagnostics, tests, and current documentation.
9. Escalate with a concise evidence package: goal, expected, actual, diagnostic, and checks already performed.

## Pilot finding and release gate

The August 18, 2026 pilot evidence shows that two target learners required experienced IBM i developer guidance during Module 0. This is treated as a **HIGH curriculum defect**, not as an individual learner failure.

The next pilot must demonstrate that a target learner can complete the core Module 0 workflow with course materials, approved references, and bounded AI assistance **without step-by-step expert direction**.

Instructor clarification is allowed. Instructor navigation of the workflow is not considered independent completion.

## Curriculum status

- [x] Canonical module placement confirmed
- [x] Canonical RPG Blend Method alignment defined
- [x] Coffee Company continuity defined
- [x] AI competency separated from IBM Bob product usage
- [x] Engineering Foundations prerequisite boundary defined
- [x] Tool-selection model defined
- [x] Troubleshooting ladder defined
- [x] Independent-completion gate defined from pilot evidence
- [ ] Rebuild learner-facing lessons to the six-lesson architecture
- [ ] Rebuild labs to Before/Goal/Do/Expect/Recover/Prove/Explain standard
- [ ] Replace HELLO-only continuity with Coffee Company starter continuity
- [ ] Reconcile workbook, instructor guide, lab guide, assessment, deck, and formatted course book
- [ ] Run workstation/environment smoke test
- [ ] Revalidate version-sensitive Code for IBM i, Db2 tooling, ACS, Navigator/PDI, and IBM Bob claims immediately before delivery
- [ ] Run new independent target-learner pilot and record intervention telemetry
- [ ] Resolve all Critical/High pilot defects before release

## Source-of-truth rule

GitHub holds editable curriculum, source, labs, evidence templates, and release history. Formatted delivery artifacts may be maintained separately, but they must conform to this Module 0 contract and must not reintroduce obsolete lesson structure or product-specific competency definitions.
