# The RPG Blend Academy

## Module 0 — IBM i Orientation

**Delivery subtitle:** Your First Controlled IBM i Development Change  
**Layer:** 2 — IBM i / RPG Core  
**Status:** Canonical architecture locked; learner-facing rebuild required  
**Primary environment:** Visual Studio Code + Code for IBM i  
**Reference application:** Coffee Company  
**Architecture review:** August 18, 2026

## Purpose

Module 0 prepares a programmer who is new to IBM i to work safely in a modern IBM i engineering environment. The module does not attempt to teach meaningful RPG language depth. It establishes the IBM i mental model, safe context verification, tool selection, source/object navigation, the first controlled compile/run workflow, evidence habits, bounded AI-assisted engineering, and independent troubleshooting.

Deeper RPG development begins in Module 1 — RPG Foundations.

## Canonical system

### Core principle

**Technology follows the problem.**

### Core promise

> Understand the system.  
> Make a controlled change.  
> Prove the result.  
> Repeat.

### RPG Blend Method alignment

- **PRIMARY:** Assess, Understand, Validate, Govern
- **REINFORCED:** Stabilize, Test, Document, Repeat
- **NOT YET TAUGHT AS A DEVELOPMENT COMPETENCY:** Modernize

Module 0 does not force all nine Method stages into every exercise. The learner is introduced to the discipline of assessing context, understanding what they are touching, validating results, documenting evidence, and operating within governance boundaries.

### Blend MVC alignment

Formal Blend MVC is not an assessed Module 0 competency. The Coffee Company application is introduced as a connected reference application only. View, Controller, Model / Domain Services, and Data Services are deferred until the learner has the required RPG and data-access foundation.

### Academy learning loop

Every lesson follows:

**Learn → Practice → Prove → Review → Explain**

## Target learner

A developer who:

- understands basic programming concepts;
- may be a recent graduate, career changer, or developer transferring from another stack;
- has little or no IBM i experience;
- does not need prior RPG or 5250 experience;
- needs enough platform fluency to begin safe IBM i development.

## Prerequisites

Transferable Engineering Foundations are assumed or must be provided before/during onboarding:

- source-control purpose and basic Git mental model;
- basic test and evidence concepts;
- specification and acceptance-criteria basics;
- code-review basics;
- AI-assisted engineering fundamentals;
- security fundamentals, including secret and sensitive-data handling.

IBM i-specific Git, test, review, and AI practices are reinforced here rather than taught as isolated first principles.

## Measurable learning outcomes

By completion, the learner can:

1. explain IBM i, IBM Power, Db2 for i, libraries, objects, jobs, source members, IFS stream files, and compiled objects at a beginner working level;
2. verify the approved host, identity, library/source/target context before acting;
3. distinguish local Git source, library-based source members, IFS source, and compiled objects;
4. choose an appropriate starting tool for basic development, SQL, 5250, operational-observation, and performance-evidence scenarios;
5. locate the Coffee Company starter source and identify where it will compile;
6. predict the effect of a small assigned change before making it;
7. make the smallest authorized change;
8. compile using the approved action, read diagnostics, and prove which object was created;
9. run the resulting program and compare expected with actual behavior;
10. execute an approved read-only Db2 for i context query and explain the limits of that evidence;
11. inspect Git status/diff and commit only intended source;
12. use approved AI assistance for explanation or review while independently verifying every accepted result;
13. follow a troubleshooting ladder before escalating;
14. explain and defend the complete change/evidence chain without step-by-step instructor direction.

## Toolbelt model

VS Code is the Academy development home base. Tool selection remains problem-driven.

### Primary learner tools

- Visual Studio Code
- Code for IBM i
- Db2 for i extension
- Git

### Complementary tools

- IBM i Access Client Solutions, including Run SQL Scripts where appropriate
- IBM Navigator for i for approved browser-based operational views
- Performance Data Investigator for existing collected performance evidence when authorized

### Recognition-only or specialist-boundary topics in Module 0

- Collection Services configuration
- Job Watcher configuration
- Disk Watcher configuration
- SQL performance monitor configuration
- security administration
- system administration
- production support actions

Learners may review existing evidence. They do not start, stop, reconfigure, or administer shared collectors or production settings unless a dedicated authorized lab explicitly permits it.

### Legacy interoperability

Learners recognize SEU, PDM, RDi, STRSQL, and 5250 command workflows because real IBM i systems may still use them. The Academy does not present them as the default learning environment.

## AI-assisted engineering

AI is a cross-cutting engineering capability. Mastery is not defined as successful use of IBM Bob or any other product.

The durable competencies are:

- problem decomposition;
- context construction;
- specification;
- instruction/prompt quality;
- verification;
- testing;
- review;
- documentation;
- security;
- governance;
- engineering judgment.

IBM Bob remains the Academy's primary IBM i-oriented implementation example. It may be used to explain RPG/CL/SQL/DDS, interpret diagnostics, identify likely dependencies, suggest tests, review diffs, and help draft documentation. The learner remains responsible for accuracy, security, testing, code quality, and final decisions.

For the independent task, AI may assist after an independent attempt but may not carry the learner through the workflow.

## Coffee Company continuity

### Starting state

The learner receives a deliberately small Coffee Company repository and an approved nonproduction/public training IBM i environment.

Minimum repository shape:

```text
coffee-company/
├── README.md
├── src/
├── docs/
└── evidence/
```

The starter RPG program must compile and run without requiring database design, service programs, APIs, or formal MVC architecture.

### Learner changes

Across Module 0 the learner:

1. opens the repository;
2. connects to IBM i;
3. verifies host/profile/library/source/target context;
4. locates Coffee Company source without changing it;
5. predicts a visible starter behavior;
6. makes one approved small change;
7. compiles and diagnoses;
8. runs and validates;
9. performs a read-only SQL context observation;
10. reviews Git status/diff;
11. uses AI for bounded explanation/review;
12. commits the intended change;
13. completes a second independent change.

### Ending state

Module 0 ends with:

- a working local Coffee Company repository;
- a verified IBM i connection;
- a known learner build library;
- a compiling/runnable Coffee Company starter program;
- one or more focused commits from controlled learner changes;
- a completed Coffee Company Change Evidence Record;
- a learner capable of explaining the source-to-object workflow.

That exact state becomes Module 1's starting point.

## Lesson sequence

### Prework — Workstation and Access Preflight

**Goal:** Eliminate installation and access troubleshooting from the core learning session.

Evidence includes approved VS Code/extension setup, Git availability, workspace/repository availability, authentication readiness, and known training-host information. Version-sensitive product requirements remain subject to pre-delivery validation.

### Lesson 0.1 — Where Am I?

**Learn:** IBM Power vs IBM i, Db2 for i, jobs, libraries, objects, source members, IFS, source vs compiled object, safety boundary.  
**Practice:** Identify host, identity, current/build library, source type, and target.  
**Prove:** Complete a context record correctly.  
**Review:** Instructor checks context without directing navigation.  
**Explain:** Learner explains why a successful sign-on does not prove that every visible object is safe to change.

### Lesson 0.2 — Which Tool Do I Use?

**Learn:** Tool roles rather than product feature memorization.  
**Practice:** Select a tool for development, SQL, 5250, spooled output, operational observation, and performance evidence scenarios.  
**Prove:** Complete scenario decisions with rationale.  
**Review:** Verify the learner knows when to escalate instead of changing system configuration.  
**Explain:** Learner defends one tool choice and one escalation boundary.

### Lesson 0.3 — Find the Coffee Company

**Learn:** Local source, remote/source-member context, IFS, build target, action command, and object result.  
**Practice:** Navigate the Coffee Company repository and IBM i environment.  
**Prove:** Identify source, target library/object, and approved build action without changing source.  
**Review:** Confirm no wrong-environment or wrong-source assumption.  
**Explain:** Learner traces source → compile → object.

### Lesson 0.4 — First Controlled Change

**Learn:** The core promise applied to one small change.  
**Practice:** Understand → predict → change → compile → read diagnostics → run → validate.  
**Prove:** Provide diff, compile result, object location, and runtime evidence.  
**Review:** Confirm only the intended source changed.  
**Explain:** Learner states what the compiler proved and what runtime evidence proved.

A controlled diagnostic failure should be included so the learner practices recovery instead of experiencing only the happy path.

### Lesson 0.5 — Observe, Review, and Prove

**Learn:** Read-only SQL observation, Git evidence, AI-assisted review, documentation.  
**Practice:** Run an approved context query, inspect status/diff, request AI explanation/review, verify findings.  
**Prove:** Record expected/actual results and accepted/rejected AI findings.  
**Review:** Check data-handling and evidence quality.  
**Explain:** Learner distinguishes observation evidence, compiler evidence, runtime evidence, Git evidence, and AI suggestions.

### Lesson 0.6 — Do It Without Me

**Learn:** No new technical content.  
**Practice/Prove:** Complete a second Coffee Company change without step-by-step prompting.  
**Review:** Use the independent-completion rubric and intervention log.  
**Explain:** Defend context, tool choice, change, target, evidence, AI use, and escalation decisions.

## Guided-lab standard

Every guided lab must contain these seven sections:

1. **Before you start**
2. **Your goal**
3. **Do this**
4. **Expect to see**
5. **If you do not see it**
6. **Prove it**
7. **Explain it**

This is mandatory across coursebook, workbook, lab guide, deck, and instructor guide.

## Troubleshooting ladder

1. Stop making additional changes.
2. Restate the goal.
3. Verify host, identity, library, source, and target.
4. Compare expected versus actual.
5. Read the diagnostic/evidence.
6. Use the course troubleshooting guide.
7. Use approved AI assistance for explanation if appropriate.
8. Verify the AI suggestion against source, diagnostics, tests, and current documentation.
9. Escalate with goal, expected, actual, diagnostic, and checks already completed.

The instructor should coach the reasoning process, not become the learner's navigation system.

## Enterprise safety requirements

The module must reinforce:

- approved nonproduction/public training environment;
- least privilege;
- source/target verification;
- no customer data, PHI, credentials, tokens, private keys, or unrestricted sensitive output in repositories, screenshots, notes, or AI prompts;
- read-only SQL unless a dedicated authorized lab explicitly states otherwise;
- no shared performance/security/system configuration changes;
- Git diff review before commit;
- evidence before claims;
- human accountability for AI-assisted work;
- escalation when a task crosses into DBA, administrator, security, performance, production-support, or change-approval responsibility.

## Assessment model

### Knowledge — 20%

IBM i mental model, context, tool selection, safety, evidence boundaries.

### Guided evidence — 20%

Completion of the structured learning path and required evidence records.

### Independent Coffee Company challenge — 50%

Learner performs the complete controlled-change workflow without step-by-step instructor direction.

### Explain-back — 10%

Learner explains and defends the workflow, evidence, and decisions.

### Critical completion gates

Regardless of numeric score, remediation is required for:

- wrong-environment action not recognized by the learner;
- secret or sensitive-data exposure;
- unauthorized system/configuration change;
- inability to identify the source or compile target;
- inability to complete the independent workflow;
- blind acceptance of AI output as proof.

## Required evidence package

- workstation/access preflight;
- context record;
- tool-selection exercise;
- Coffee Company starting-state record;
- before-change prediction;
- source diff;
- compile diagnostics/result;
- target object proof;
- runtime result;
- approved read-only SQL observation;
- AI-review disposition;
- Git commit;
- explain-back result;
- pilot/intervention record when delivered as a validation cohort.

## Pilot evidence and remediation

Two target learners in the August 18, 2026 pilot required experienced IBM i developer guidance while completing Module 0. This is recorded as a **HIGH curriculum defect: learner independence not yet reliable**.

This finding does not justify making the course larger. It requires clearer sequencing, expected-state cues, recovery instructions, and an independent completion gate.

### Next-pilot acceptance criterion

A new target learner must complete the core Module 0 workflow using the course materials, approved reference documentation, and bounded AI assistance without step-by-step expert direction.

Instructor clarification is allowed. Instructor navigation of the workflow is not independent completion.

### Pilot telemetry

For each major step, record:

| Step | Independent | Course reference used | AI used | Instructor hint | Instructor intervention | Friction note |
|---|---|---|---|---|---|---|

A repeated instructor intervention becomes a curriculum defect to remediate, not an undocumented teaching dependency.

## Instructor materials required

- instructor guide aligned to this architecture;
- canonical deck;
- prework/environment smoke test;
- Coffee Company starter and known-good state;
- controlled compile-error example;
- tool-selection scenarios;
- symptom-based troubleshooting matrix;
- assessment rubric;
- independent-completion rubric;
- pilot intervention log;
- version-sensitive verification checklist.

## Student materials required

- learner coursebook;
- learner workbook;
- lab guide;
- Coffee Company repository;
- IBM i visual mental-model sheet;
- Which Tool Should I Use? quick reference;
- troubleshooting guide;
- Coffee Company Change Evidence Record;
- Git quick reference;
- AI verification card;
- independent challenge instructions.

## Technical claims requiring pre-delivery verification

The following are version-sensitive and must be checked against current primary documentation and the actual training environment before delivery:

- Code for IBM i supported IBM i levels and prerequisites;
- Code for IBM i connection/action behavior and UI labels;
- Db2 for i extension prerequisites and workflow;
- ACS functionality demonstrated in the course;
- Navigator for i and PDI navigation/availability;
- IBM Bob current capabilities, review workflow, and product labels;
- target IBM i release/PTF/compiler behavior;
- Coffee Company build commands and resolved target variables;
- public training-provider limits or restrictions when a public system is used.

## Release status

This architecture is approved for rebuild. The module is **not release-complete** until learner-facing artifacts are reconciled, the actual environment passes smoke testing, version-sensitive claims are revalidated, and a new target-learner pilot demonstrates independent completion with no open Critical/High curriculum defects.
