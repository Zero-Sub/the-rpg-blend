# Lesson 1 — Read a Modern RPG Program

**Estimated time:** 55 minutes

## Why this matters

Most maintenance begins with code the developer did not write. Before changing source, the learner builds an accurate map of execution, inputs, outputs, decisions, side effects, dependencies, and termination.

## Objectives

- Identify `**free`, `ctl-opt`, declarations, executable logic, output, termination, and procedure boundaries.
- Trace a small linear RPG program from top to bottom.
- Separate visible behavior from inferred intent.
- Create a program map before editing.

## VS Code lab

Open `src/lesson-01/program_map.pgm.rpgle`, verify the IBM i connection and build context, read without editing, produce a program map, predict compile behavior, compile with the approved action, and prove the target object.

## Bob activity

Ask Bob to explain the program section by section and explicitly label source facts, assumptions, inputs/outputs/side effects, and unanswered questions. Do not ask it to rewrite the program.

## Independent task

Without Bob, map `program_map_independent.pgm.rpgle`. Use Bob only as a second reviewer after the learner has completed the map.

## Safety

A successful connection or compile does not prove the correct environment or target. Record host/profile/source/build context before the action.