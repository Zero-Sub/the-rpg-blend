# Lesson 0.2 — Which Tool Do I Use?

## Purpose

Teach tool selection by problem, not by memorizing product feature lists.

## Learning objectives

By the end, the learner can select an appropriate starting tool for common IBM i development and support tasks and explain why.

## Learn

The Academy home base for IBM i development is Visual Studio Code with Code for IBM i.

Use the broader toolbelt deliberately:

| Problem | Appropriate starting point |
|---|---|
| Edit/build RPG or inspect IBM i development objects | VS Code + Code for IBM i |
| Run SQL while developing | Db2 for i extension when practical |
| Use Run SQL Scripts or mature SQL administration/performance features | IBM i Access Client Solutions |
| Use 5250, spooled files, or data transfer | IBM i Access Client Solutions |
| Use approved browser-based operational/admin views | IBM Navigator for i |
| Investigate a performance symptom | Gather context and use/escalate to the appropriate PDI, Collection Services, Job Watcher, Disk Watcher, or SQL performance workflow |
| Explain/review unfamiliar IBM i code with AI | Approved AI assistant; IBM Bob is the Academy's primary IBM i implementation example when available |

Legacy tools such as PDM, SEU, STRSQL, and RDi matter because real systems still use them. Recognize them; do not make them the Academy's default workflow.

## Practice

Choose a tool for each scenario:

1. Change one RPG source file.
2. Run a read-only SQL query during development.
3. Inspect a spooled file.
4. Use a feature available in Run SQL Scripts.
5. A user reports a broad performance problem.
6. You encounter an unfamiliar RPG program and want assistance understanding it.

For each, write one sentence explaining your choice.

## Prove

Score at least four of five instructor-selected tool scenarios correctly and justify the choice.

## Review

Check whether your choice follows the problem. Do not choose a tool simply because it is newer, older, or more familiar.

## Explain

Explain why “VS Code is home base” does not mean “VS Code is the only correct IBM i tool.”

## AI-assisted activity

Give an approved AI assistant one tool-selection scenario. Ask for two possible tools and tradeoffs. Verify the recommendation against Academy guidance before accepting it.

## Production safety

Recognition of operational or performance tools is not permission to reconfigure collectors, alter system settings, or make production changes. New developers gather evidence and work within approved authority.

## Common mistakes

- treating ACS as obsolete;
- treating every task as a 5250 task;
- starting a performance collector without authority;
- assuming AI is itself a development environment;
- confusing recognition of a tool with proficiency in administering it.

## Completion criteria

You can select and defend an appropriate starting tool for common Module 0 scenarios.
