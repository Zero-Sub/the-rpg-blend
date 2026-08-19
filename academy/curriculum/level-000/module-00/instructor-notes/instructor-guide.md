# Module 0 Instructor Guide — IBM i Orientation

## Purpose

Module 0 prepares a programmer new to IBM i to work safely enough to begin RPG instruction. The learner must finish able to orient themselves, choose the appropriate basic tool, make one controlled Coffee Company change, prove the result, recover from a simple failure, and explain the evidence.

This module is not a survey of every IBM i tool and is not a substitute for system-administration training.

## Canonical alignment

- **Layer:** 2 — IBM i / RPG Core
- **Module:** 0 — IBM i Orientation
- **Delivery subtitle:** Your First Controlled IBM i Development Change
- **Learning loop:** Learn → Practice → Prove → Review → Explain
- **Primary RPG Blend Method stages:** Assess, Understand, Validate, Govern
- **Reinforced:** Stabilize, Test, Document, Repeat
- **Modernize:** not meaningfully taught here
- **Blend MVC:** not an assessed competency in Module 0

## Pilot remediation

The August 2026 pilot produced a HIGH curriculum finding: two target learners required experienced IBM i guidance to progress through Module 0. Treat this as evidence that learner independence was not yet reliable.

The instructor's job in the next pilot is therefore not merely to get learners to the end. It is to measure where the materials cease to be self-sufficient.

Do not hide curriculum defects by rescuing the learner too quickly.

---

# Instructor preparation

Before delivery:

- verify the approved IBM i training environment and current release/PTF context;
- verify Code for IBM i connection from the learner network;
- verify the approved Db2 for i extension workflow if used;
- verify ACS and Navigator demonstrations against current product behavior;
- verify the configured Coffee Company source/build path;
- compile and run `COFFEE00` in a clean learner-equivalent environment;
- verify diagnostics for the intentional-error exercise;
- verify each learner has a least-privilege profile and isolated/approved build target;
- verify Git workspace instructions;
- validate IBM Bob instructions against the current product when Bob is used;
- sanitize screenshots and example output;
- confirm no exercise requires production/client data, PHI, secrets, or unrestricted system output.

Do not spend instructional time repairing workstation prerequisites that should have been caught by preflight.

---

# Recommended learner sequence

## Preflight — before the teaching session

Confirm workstation, access, repository, extension, and learner-library readiness.

## Lesson 1 — Where Am I?

Teach only enough IBM i mental model for the learner to reason about context:

IBM Power → IBM i partition → job/identity → libraries/objects and IFS → source/build target.

Historical names such as AS/400, iSeries, and System i are recognition vocabulary, not a history lecture.

## Lesson 2 — Which Tool Do I Use?

Organize tools around problems, not product feature lists.

| Need | Default/appropriate path |
|---|---|
| Edit/build RPG | VS Code + Code for IBM i |
| Browse IBM i development objects | Code for IBM i Object Browser |
| SQL while developing | Db2 for i extension when practical |
| Mature SQL tooling / Run SQL Scripts | ACS |
| 5250, spooled files, data transfer | ACS |
| Approved browser operational/admin views | Navigator for i |
| Performance symptom | collect approved context, recognize PDI/Collection Services/Job Watcher/Disk Watcher/SQL performance categories, escalate appropriately |
| AI-assisted explanation/review | approved AI assistant; IBM Bob is primary IBM i example when available |

The learner is not expected to administer performance collectors.

## Lesson 3 — Find the Coffee Company

Learner locates the starter without changing it. Require them to identify source, intended build target, and predicted behavior.

## Lesson 4 — First Controlled Change

This is the module's central demonstration:

**Assess context → Understand current behavior → Stabilize with baseline evidence → Make minimal change → Validate → Review → Document → Repeat.**

Use the intentional compile failure to teach evidence-based diagnosis.

## Lesson 5 — Observe, Review, and Prove

Use a read-only SQL observation, Git diff/evidence, and AI-assisted review. Keep the learner responsible for verification.

## Lesson 6 — Do It Without Me

Run the independent challenge. Instructor intervention is measured.

---

# Standard guided-lab structure

Every guided procedure should visibly use:

1. **Before you start** — required state.
2. **Goal** — the result being pursued.
3. **Do this** — learner action.
4. **Expect to see** — observable success.
5. **If you do not see it** — first recovery steps.
6. **Prove it** — required evidence.
7. **Explain it** — learner articulation.

If an activity cannot be expressed this way, review whether the activity is intentional enough to remain in Module 0.

---

# Troubleshooting ladder

Teach and enforce this order:

1. Stop.
2. Restate the goal.
3. Verify host → profile → source → library → target.
4. Compare expected versus actual.
5. Read the diagnostic.
6. Use course troubleshooting material.
7. Use approved AI for explanation/diagnostic possibilities when useful.
8. Verify any suggestion.
9. Escalate with evidence: goal, expected, actual, diagnostic, context, and checks already performed.

Do not teach random trial-and-error as troubleshooting.

---

# AI-assisted engineering guidance

Teach the durable competency, not dependence on one product.

AI may help the learner:

- explain unfamiliar source;
- identify assumptions or dependencies;
- interpret diagnostics;
- suggest tests;
- review a small diff;
- improve documentation.

AI does not own:

- authorization;
- production decisions;
- correctness;
- testing;
- security;
- approval;
- final engineering judgment.

IBM Bob can remain the primary IBM i-oriented lab implementation. Learners must be able to complete and explain the core workflow without Bob carrying them through it.

---

# Enterprise safety boundaries

Module 0 must reinforce:

- non-production training target;
- least privilege;
- explicit source/target verification;
- no casual changes to shared system configuration;
- read-only SQL observation unless a controlled write exercise is explicitly designed;
- no secrets, tokens, credentials, client data, PHI, or confidential host details in repositories, screenshots, workbooks, or AI prompts;
- source control/evidence does not replace authorization or testing;
- successful compilation does not prove business correctness.

---

# Instructor prompts

Prefer questions that expose the learner's mental model:

- “What problem are you trying to solve?”
- “Where are you connected?”
- “Which artifact are you editing?”
- “What will the compiler create?”
- “Where will it create it?”
- “What do you expect before you run it?”
- “What evidence tells you the compile succeeded?”
- “What evidence tells you the correct object was called?”
- “What changed in the diff?”
- “What did AI claim, and how did you verify it?”

Avoid taking over the keyboard during the independent challenge unless safety requires it.

---

# Pilot intervention telemetry

For each meaningful step, record the highest assistance level.

| Level | Meaning |
|---:|---|
| 0 | Independent |
| 1 | Clarifying question only |
| 2 | Hint required |
| 3 | Step-by-step guidance required |
| 4 | Instructor performed action |

Also record the friction category:

- prerequisite/setup;
- IBM i mental model;
- tool selection;
- navigation;
- source vs object;
- compile/build target;
- diagnostics;
- execution;
- SQL/tooling;
- Git;
- AI verification;
- unclear instruction;
- unclear completion criteria;
- other.

A successful learner outcome at level 3 or 4 is still curriculum evidence of a problem.

For the next release pilot, the core independent challenge should complete at level **0 or 1**.

---

# Assessment rubric

| Area | Meets expectation |
|---|---|
| Context | Identifies correct connection, identity, source, build library, target |
| Platform model | Distinguishes IBM Power, IBM i, libraries/objects, IFS, source and `*PGM` |
| Tool selection | Chooses the appropriate basic tool for the stated problem and can explain why |
| Controlled change | Predicts, makes a minimal Coffee Company change, compiles and validates |
| Diagnostics | Reads and uses a basic compile diagnostic instead of guessing |
| Evidence | Proves target object and runtime behavior; keeps evidence internally consistent |
| Git | Reviews focused change and produces appropriate version-control evidence when used |
| AI | Uses AI as assistance and verifies material claims |
| Safety | Stays within approved boundaries and protects sensitive information |
| Explain-back | Defends the workflow and evidence without AI assistance |
| Independence | Completes the independent challenge without step-by-step expert direction |

---

# Critical completion gates

A passing quiz score is not sufficient.

The learner is **not yet ready for Module 1** if they cannot independently:

- verify the IBM i context;
- locate the Coffee Company source;
- distinguish source from the executable object;
- identify the build target;
- make a minimal specified change;
- compile and react to a basic diagnostic;
- verify the intended `*PGM`;
- run and validate the behavior;
- inspect the change evidence;
- explain what they did and what the evidence proves.

Safety violations require remediation regardless of score.

---

# Technical verification before publication/delivery

Revalidate version-sensitive claims rather than assuming screenshots or UI text remain current:

- Code for IBM i supported IBM i release/prerequisites and current Actions behavior;
- Db2 for i extension behavior/prerequisites;
- ACS Run SQL Scripts features demonstrated;
- Navigator for i navigation and labels;
- PDI/performance-tool labels used in recognition material;
- IBM Bob current capabilities and review workflow;
- Coffee Company compile/deploy action in the actual training environment.

Use current primary documentation for version-sensitive publication claims.

---

# Release decision

Module 0 is release-complete only after:

1. all learner-facing artifacts match the canonical architecture;
2. Coffee Company is the connected application used by the hands-on workflow;
3. the training environment passes smoke testing;
4. version-sensitive claims are revalidated;
5. a new target learner completes the independent workflow without step-by-step expert direction; and
6. no Critical or High pilot curriculum defect remains unresolved.
