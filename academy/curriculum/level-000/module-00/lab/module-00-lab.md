# Module 0 Lab — From Empty Workspace to Running RPG Program

## Estimated time

35–45 minutes

## Objective

Complete the full VS Code-first development cycle without using a 5250 source editor.

## Prerequisites

- VS Code and Code for IBM i installed.
- Approved connection to the training partition.
- Authority to create objects in the assigned training library.
- Instructor confirmation that `RPGACADEMY` is the correct library name for the lab.

## Part 1 — Connect and verify

1. Open VS Code.
2. Connect to the approved IBM i training environment.
3. Confirm the displayed system and user are correct.
4. Open Object Browser.
5. Open the IBM i terminal.

**Checkpoint:** Record the training system name without recording credentials.

## Part 2 — Create the workspace

Run:

```cl
CRTLIB LIB(RPGACADEMY) TEXT('RPG Blend Academy training')
CRTSRCPF FILE(RPGACADEMY/QRPGLESRC) RCDLEN(112) TEXT('RPG source members')
ADDPFM FILE(RPGACADEMY/QRPGLESRC) MBR(HELLO) SRCTYPE(RPGLE) TEXT('First RPG program')
```

If an object already exists, stop and ask the instructor whether to reuse it or use an assigned student library. Do not delete shared objects.

## Part 3 — Enter the source

Refresh Object Browser, open `RPGACADEMY/QRPGLESRC(HELLO)`, and enter:

```rpgle
**free

ctl-opt dftactgrp(*no);

dcl-s message varchar(52);

message = 'Welcome to The RPG Blend Academy.';

dsply message;

*inlr = *on;
return;
```

Save the member.

## Part 4 — Compile

Run the approved Code for IBM i compile action or this command:

```cl
CRTBNDRPG PGM(RPGACADEMY/HELLO) SRCFILE(RPGACADEMY/QRPGLESRC) SRCMBR(HELLO) OPTION(*EVENTF) DBGVIEW(*SOURCE) REPLACE(*YES)
```

**Checkpoint:** Confirm the compile completed successfully and that `RPGACADEMY/HELLO` exists as `*PGM`.

## Part 5 — Run

```cl
CALL PGM(RPGACADEMY/HELLO)
```

Record the displayed message.

## Part 6 — Diagnose an error

1. Remove the semicolon from the assignment statement.
2. Save the source.
3. Compile again.
4. Locate the first useful diagnostic.
5. Record the diagnostic identifier or first-level text.
6. Restore the semicolon.
7. Save and compile successfully.
8. Run the program again.

## Lab evidence

Submit or demonstrate:

- The open `HELLO` member in VS Code.
- A successful compile result.
- The `HELLO *PGM` object.
- The expected program output.
- The diagnostic found during the intentional-error exercise.

## Challenge — HELLO2

Create member `HELLO2` and program `RPGACADEMY/HELLO2`.

Requirements:

- Fully free-form RPG.
- At least two variables.
- One variable contains the student’s first name.
- A second variable contains the completed welcome message.
- The program displays the personalized message.
- The program ends cleanly.
- The program compiles without errors.

Do not copy a completed solution before attempting the challenge.

## Challenge acceptance criteria

- [ ] Source member is named `HELLO2`.
- [ ] Program object is named `HELLO2`.
- [ ] Source uses `**free`.
- [ ] Two variables are declared.
- [ ] Output includes the student’s name.
- [ ] Compile succeeds.
- [ ] Program runs and displays the intended message.
