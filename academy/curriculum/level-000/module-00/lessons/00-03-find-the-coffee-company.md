# Lesson 0.3 — Find the Coffee Company

## Purpose

Connect the IBM i mental model to the Academy's continuous reference application before the learner edits anything.

## Learning objectives

By the end, the learner can locate the Coffee Company workspace, identify the starter RPG source, identify the intended build target, and predict the starter behavior.

## Learn

The Coffee Company application is the connected Academy reference application. Module 0 establishes its first known-good state. Later modules evolve the same application rather than discarding it for unrelated exercises.

For Module 0, keep the application intentionally small. The learner is learning the engineering workflow, not application architecture.

Starter source: `code/rpg/COFFEE00.rpgle`.

```rpgle
**free

ctl-opt dftactgrp(*no);

dcl-s message varchar(52) inz('Coffee Company system ready.');

dsply message;

*inlr = *on;
return;
```

You are not expected to understand every RPG construct yet. Module 1 teaches RPG foundations. In Module 0, identify the visible behavior and the relationship between source, build, object, and runtime.

## Practice

1. Open the Coffee Company repository/workspace.
2. Locate `COFFEE00.rpgle`.
3. Verify the approved IBM i connection.
4. Identify the learner build library.
5. Identify the target program name `COFFEE00`.
6. Predict the program output before running it.

Do not edit yet.

## Prove

Record:

- repository/workspace;
- source location;
- IBM i connection;
- build library;
- target program;
- predicted output.

## Review

Make sure all evidence refers to one coherent environment and one coherent source/target path.

## Explain

Explain what will happen between editing `COFFEE00.rpgle` and calling `<YOURLIB>/COFFEE00`.

## AI-assisted activity

After your own source walkthrough, ask the approved AI assistant to summarize the program in plain language. Compare its explanation with the visible source. Mark any statement that goes beyond what the source proves.

## Common mistakes

- editing before establishing a baseline;
- confusing the repository file with an already compiled object;
- assuming the build target from an old screenshot or previous learner;
- asking AI to explain the code before first reading it yourself.

## Completion criteria

You can find the Coffee Company starter and state its intended source, target, and expected behavior without instructor navigation.
