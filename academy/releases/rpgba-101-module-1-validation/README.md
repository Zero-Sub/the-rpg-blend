# RPGBA-101 Module 1 - RPG Fundamentals: Read, Change, Test

This repository supports The RPG Blend Academy Module 1 validation candidate.

## Standard public Academy lab environment

For learners who do not have access to an employer or school IBM i partition, the Academy standard public lab environment is PUB400.

Current PUB400 facts verified August 7, 2026:

- Host: `pub400.com`
- IBM i release advertised by PUB400: IBM i 7.5
- SSH port: `2222`
- Learner receives an individual `*PGMR` user profile
- PUB400 provides two private object libraries plus a third library intended for save files
- PUB400 examples use `<USER>1` and `<USER>2` for private object libraries and `<USER>B` for the save-file library
- User IFS home directory follows `/home/<user>`
- PUB400 is a shared learning system with no regular backup or availability guarantee

Always confirm the actual libraries assigned to the learner account after first sign-on rather than assuming the example names.

See `PUB400_SETUP.md` for the controlled learner setup.

## Safety boundary

- Use only the learner's own PUB400 profile and assigned private libraries.
- Never attempt to inspect, scan, modify, or access another PUB400 user's objects.
- Verify host, profile, branch, source, current library, and build library before compiling.
- Never store passwords, private keys, access tokens, customer data, PHI, or proprietary employer source here.
- Git is the authoritative copy of Academy source. PUB400 explicitly does not provide regular backup.
- Review every Git diff and every Bob-generated suggestion.

## Source sequence

1. `src/lesson-01/program_map.pgm.rpgle`
2. `src/lesson-01/program_map_independent.pgm.rpgle`
3. `src/lesson-02/data_definitions.pgm.rpgle`
4. `src/lesson-03/expressions.pgm.rpgle`
5. `src/lesson-04/decisions.pgm.rpgle`
6. `src/lesson-05/loops.pgm.rpgle`
7. `src/lesson-06/procedures.pgm.rpgle`
8. `src/capstone/start/blend_order.pgm.rpgle`
9. `src/capstone/solution/blend_order.pgm.rpgle`

## Build model

Each learner builds into their own assigned PUB400 library. Do not hard-code a shared Academy build library.

The workspace-scoped Action in `.vscode/actions.json` uses the current Code for IBM i prompted-Action syntax and defaults the build library from `&BUILDLIB` and source path from `&FULLPATH`. The learner must inspect the resolved values before execution.

Suggested validation object names:

- `M1L1MAP`
- `M1L1IND`
- `M1L2DATA`
- `M1L3EXPR`
- `M1L4DEC`
- `M1L5LOOP`
- `M1L6PROC`
- `M1CAPST`
- `M1CAPSOL`

## Source authority

This Git repository is the authoritative source for Academy examples. PUB400 is a compile/run target, not a source-of-truth repository.
