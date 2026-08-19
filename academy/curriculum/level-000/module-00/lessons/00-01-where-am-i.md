# Lesson 0.1 — Where Am I?

## Purpose

Build the minimum IBM i mental model a new developer needs before making a change.

## Learning objectives

By the end, the learner can:

- distinguish IBM Power from IBM i;
- explain partition, job, library, object, source member, program object, and IFS at an orientation level;
- translate common historical names such as AS/400 and iSeries without treating them as current platform names;
- identify host/connection, identity, source, build library, and target before changing anything.

## Why this matters

A developer can connect successfully and still be in the wrong environment, using the wrong identity, looking at the wrong source, or targeting the wrong library. Orientation begins with context, not code.

## Learn

Use this working model:

```text
IBM Power hardware
  ↓
IBM i partition
  ↓
job / user context
  ↓
libraries and objects      IFS paths and stream files
  ↓
source / build target
```

IBM i is the operating system and integrated business platform. IBM Power is the hardware platform. A partition is an isolated logical system instance. Libraries organize IBM i objects in the native object namespace. The IFS provides path-based file-system namespaces, including stream files and directories.

A source member is editable source text in a source physical file. A `*PGM` is an executable IBM i program object. Changing source does not change an existing program object until the approved build path succeeds.

Historical terms such as AS/400, iSeries, and System i remain useful recognition vocabulary because developers will encounter them in conversations, documents, job descriptions, scripts, and older systems. Use current IBM i terminology when teaching the platform today.

## Practice

In the approved training environment, identify without changing anything:

1. connection/system;
2. user profile;
3. assigned learner library;
4. one native object;
5. one IFS path;
6. the Coffee Company source location;
7. the intended Coffee Company build target.

## Prove

Record the context in the workbook. Do not record credentials or sensitive system details.

## Review

Ask:

- Did I identify the environment or merely assume it?
- Can I distinguish source from executable object?
- Can I explain why a library/build target matters?
- Did I avoid changing anything while orienting myself?

## Explain

Without notes, explain the path from source to compiled object and why a successful sign-on is not authorization to modify every visible artifact.

## AI-assisted activity

After forming your own explanation, ask the approved AI assistant to explain the difference between an RPG source member and an IBM i `*PGM`. Compare its answer with the course model. Record any unsupported or unclear statement and verify it before accepting it.

## Common mistakes

- treating IBM Power and IBM i as the same thing;
- assuming historical platform names are current product names;
- assuming every file-like thing is in the IFS;
- confusing source with the object being run;
- assuming visibility means authority to change.

## Completion criteria

You can independently identify your working context and explain source versus executable object before proceeding.
