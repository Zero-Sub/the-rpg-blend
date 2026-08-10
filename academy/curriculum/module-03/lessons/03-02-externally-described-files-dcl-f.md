# Lesson 3.2 — Externally Described Files and `DCL-F`

## Metadata

- **Estimated time:** 75 minutes
- **Required source:** `code/rpg/03_native_lookup.pgm.rpgle`
- **Validation status:** source reviewed; compile validation pending

## Learning Objectives

The learner can:

1. Read a free-form `DCL-F` definition.
2. Explain `USAGE`, `KEYED`, `EXTDESC`, and `EXTFILE(*EXTDESC)` in the course example.
3. Distinguish compile-time external-description resolution from runtime file opening.
4. Explain why externally described fields/record formats are a dependency.
5. Verify the target before compiling and running.

## Why This Matters

An RPG file definition is not just a syntax line. It connects source code to an IBM i database object and its external description. If a developer compiles against one file and runs against another incompatible file, the problem is operational, not stylistic.

## Free-Form File Definition

Module 3 uses an explicit training pattern after `YOURSCHEMA` is replaced:

```rpgle
**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f ORDHDR
    usage(*input : *update)
    keyed
    extdesc('YOURSCHEMA/ORDHDR')
    extfile(*extdesc);
```

Read it as decisions:

- `ORDHDR` — RPG file name
- `usage(*input : *update)` — operations the program intends to perform
- `keyed` — keyed access is expected
- `extdesc(...)` — external description used by the compiler
- `extfile(*extdesc)` — the same named external file is the runtime target in this training example

## Compile-Time Dependency

An externally described file must be available to the compiler so the RPG compiler can obtain record/field definitions. In enterprise pipelines, teams may use library lists, overrides, reference libraries, generated artifacts, or controlled build environments. The Academy does not claim the literal `EXTDESC` pattern is the only correct enterprise approach; it uses the pattern because the learner can see the target directly.

## Runtime Dependency

Compile success does not prove the runtime file is the correct business target. The training example deliberately uses `EXTFILE(*EXTDESC)` so learners can state both targets without an ambient library-list dependency.

Later, when learners support older applications, they will encounter unqualified file names and overrides. The correct response is to trace resolution, not guess.

## SQL-Created Tables Are Still IBM i Database Objects

Module 3's order tables are created with SQL but given explicit system names and record formats. Native RPG can consume their external descriptions. This is a useful bridge: SQL DDL and native RPG access are not separate universes.

## Guided Compile Review

Before compiling `03_native_lookup.pgm.rpgle`:

1. replace `YOURSCHEMA` only with the assigned learner library
2. confirm `ORDHDR` exists there
3. inspect system/table metadata from SQL
4. record the intended program object/build library
5. inspect the Code for IBM i Action that will compile the source
6. predict whether the compile should succeed
7. compile and capture diagnostics
8. prove the program object was created in the intended build library

## Bob-Assisted Activity

Ask Bob to explain the file definition, then challenge these possible bad answers:

- “EXTDESC controls only runtime.”
- “Compile success proves the runtime target is safe.”
- “SQL-created tables cannot be externally described RPG files.”
- “If the file is not found, add more authority.”

## Independent Task

With Bob closed, annotate each keyword in the Module 3 `DCL-F` and write one sentence explaining what would be different if `EXTFILE(*EXTDESC)` were removed.

## Troubleshooting

| Symptom | First evidence |
|---|---|
| External file not found at compile | Confirm substituted library/file and build job context |
| Field/format mismatch | Compare actual external description to source expectation |
| Program compiles but opens wrong data | Trace runtime resolution/overrides; stop data-changing work |
| Authority failure | Confirm intended target and learner ownership; do not broaden authority casually |

## Completion Criteria

The learner can compile an externally described file example only after proving the external description, runtime target strategy, and build target.