# Module 0 Instructor Guide

## Delivery target

- **Total time:** 2–3 hours
- **Format:** Instructor-led, self-paced, or blended
- **Primary environment:** VS Code with Code for IBM i
- **Supplemental environment:** ACS only when needed for operational context

## Instructor preparation

Before class:

- Confirm the target IBM i release and training partition.
- Confirm Code for IBM i can connect from the student network.
- Confirm required services and organization-approved connection settings.
- Prepare least-privilege student profiles or the approved account process.
- Decide whether students share `RPGACADEMY` or receive individual libraries.
- Compile and run `HELLO.rpgle` on the target partition.
- Validate the Code for IBM i compile action.
- Confirm event-file diagnostics appear as expected.
- Capture current, sanitized screenshots.
- Verify that no screenshot exposes system addresses, user profiles, credentials, customer names, or production data.

## Recommended schedule

| Segment | Time |
|---|---:|
| Welcome and course model | 10 minutes |
| IBM i and naming history | 25 minutes |
| RPG, libraries, objects, and members | 30 minutes |
| VS Code and connection walkthrough | 25 minutes |
| Development cycle and first program | 35 minutes |
| Guided lab and intentional error | 35 minutes |
| Challenge, assessment, and review | 20 minutes |

Allow additional time for connection problems. Do not consume concept-teaching time troubleshooting one student machine in front of the whole class.

## Teaching priorities

The student must leave Module 0 understanding these relationships:

```text
IBM Power hardware
      |
IBM i partition
      |
Library and objects
      |
Source physical file and member
      |
CRTBNDRPG
      |
Executable *PGM
```

The most important conceptual checkpoint is the difference between source and the compiled program object.

## Demonstration sequence

1. Show the active VS Code connection.
2. Show Object Browser before creating the workspace.
3. Create or locate the training library.
4. Open `QRPGLESRC(HELLO)`.
5. Enter and save the source.
6. Compile successfully.
7. Verify `HELLO *PGM`.
8. Run the program.
9. Introduce a missing semicolon.
10. Recompile and inspect the diagnostic.
11. Correct, save, recompile, and rerun.

## Instructor prompts

Use questions rather than performing every step for the student:

- “Which object are we editing?”
- “Which object are we running?”
- “What library will contain the result?”
- “Did the source save before the compile?”
- “What is the first useful diagnostic?”
- “How do we know the new program object exists?”

## Common teaching risks

| Risk | Instructor response |
|---|---|
| Too much platform history | Keep history focused on terminology students will encounter |
| Tool setup dominates the lesson | Pre-stage accounts and validate connections before class |
| Instructor uses 5250 editing from habit | Return to the VS Code-first course standard |
| Students copy commands without understanding objects | Ask them to identify library, file, member, and program in each command |
| Shared library causes collisions | Use assigned student libraries or unique member names |
| Compile succeeds but old output appears | Verify source location, save state, program library, and called object |

## Assessment rubric

| Area | Meets expectation |
|---|---|
| Platform vocabulary | Distinguishes IBM i, IBM Power, and historical names |
| Object model | Explains library, source physical file, member, and `*PGM` |
| Tool use | Connects and navigates using VS Code with Code for IBM i |
| Compile cycle | Saves, compiles, reviews diagnostics, and verifies the result |
| Execution | Calls the intended qualified program and verifies output |
| Safety | Uses only the approved training environment and does not expose credentials |

## Lab solution guidance

The guided `HELLO` solution is the repository source under `code/rpg/HELLO.rpgle`.

A valid `HELLO2` challenge solution may resemble:

```rpgle
**free

ctl-opt dftactgrp(*no);

dcl-s studentName varchar(30) inz('George');
dcl-s welcomeMessage varchar(80);

welcomeMessage = 'Welcome to The RPG Blend Academy, '
               + %trim(studentName)
               + '.';

dsply welcomeMessage;

*inlr = *on;
return;
```

Accept equivalent production-valid solutions that meet the stated requirements. Do not require the student to match this exact variable naming or formatting.

## Completion decision

A student is ready for Module 1 when the student can independently explain source versus object, locate the member, compile successfully, interpret a basic syntax diagnostic, and run the qualified program.

A passing quiz score alone is not enough when the hands-on workflow is incomplete.
