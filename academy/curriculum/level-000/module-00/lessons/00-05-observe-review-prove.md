# Lesson 0.5 — Observe, Review, and Prove

## Purpose

Teach the learner to gather evidence across IBM i tooling, Git, and AI-assisted review without confusing any single tool with proof of correctness.

## Learning objectives

By the end, the learner can perform one approved read-only SQL observation, review a focused change, use AI as a reviewer, and assemble a coherent evidence package.

## Learn

Different tools answer different questions.

- Compiler diagnostics help answer whether the build accepted the source and what errors/warnings occurred.
- Runtime evidence helps answer what the program actually did.
- SQL can help inspect approved data or system context.
- Git shows what changed in version-controlled source.
- AI can help explain, question, review, or suggest tests.

None of these independently proves the whole change is correct.

For SQL, use the Db2 for i extension when practical in the development workflow. ACS Run SQL Scripts remains an appropriate tool when its capabilities are the better fit. In Module 0, the SQL task is read-only; deeper Db2 work belongs later.

## Practice

### Read-only SQL observation

Run an instructor-approved read-only query appropriate to the training environment. The query should help the learner observe context or a harmless system/database fact without creating or changing data.

Record:

- tool used;
- purpose of the query;
- what the result tells you;
- why the exercise is read-only.

### Git review

Using the previously taught Git fundamentals:

1. inspect status;
2. inspect the focused diff;
3. use `git diff --check` when appropriate;
4. confirm no unrelated source is included;
5. stage/commit only the intended change according to the course workflow.

### AI-assisted review

After completing the learner's own work, ask the approved AI assistant to review the small change for unintended behavior, missing verification, unsafe assumptions, or documentation gaps.

IBM Bob is the Academy's primary IBM i implementation example when available, but the durable competency is AI-assisted engineering and verification.

For each material AI finding, choose: accept, reject, investigate, or defer. Record evidence for the decision.

## Prove

Produce one coherent evidence package containing:

- requirement;
- context;
- source/diff;
- compile result;
- target-object proof;
- runtime result;
- SQL observation;
- AI finding disposition when AI is used;
- Git commit/status evidence when Git is used.

## Review

Check that all evidence refers to the same requirement, source, environment, and target.

## Explain

Explain what Git proves and does not prove. Explain what AI contributes and what remains the engineer's responsibility.

## Common mistakes

- treating a clean Git diff as proof of runtime correctness;
- treating AI approval as human approval;
- putting secrets or production/client data into prompts or evidence;
- turning a read-only SQL observation into an unsanctioned write exercise;
- using more tools than the problem requires.

## Completion criteria

You can assemble and explain a coherent proof package without claiming that any single artifact proves everything.
