# Lessons 0.8–0.9 — The RPG Development Cycle and Your First Program

## Course position

- **Estimated time:** 45–55 minutes
- **Prerequisites:** Lessons 0.1–0.7
- **Required tools:** VS Code, Code for IBM i, approved training connection

## Today’s coffee

**Coffee:** Espresso  
**Roast:** Dark  
**Tasting notes:** Dark chocolate, toasted sugar, and a concentrated finish  
**Why it fits:** The edit-compile-run cycle is compact, repeatable, and central to everything that follows.

## Opening context

A developer changes source and expects the running program to change immediately. On IBM i, the source member and the executable program object are separate. The change becomes runnable only after a successful compile creates or replaces the program object.

## Learning objectives

The student can:

- Describe the edit-save-compile-diagnose-run cycle.
- Create a training library, source physical file, and source member.
- Enter a fully free-form RPG program in VS Code.
- Compile it with `CRTBNDRPG`.
- Review diagnostics and identify a successful compile.
- Run the resulting program object.

## Visual model

```text
Edit source member
      |
Save source
      |
Compile with CRTBNDRPG
      |
+-----+------------------+
|                        |
Errors found             Compile succeeds
|                        |
Review diagnostics       *PGM object created or replaced
|                        |
Correct source           CALL the program
+------------------------+
```

## Create the training workspace

Run these commands from the Code for IBM i terminal:

```cl
CRTLIB LIB(RPGACADEMY) TEXT('RPG Blend Academy training')

CRTSRCPF FILE(RPGACADEMY/QRPGLESRC)
          RCDLEN(112)
          TEXT('RPG source members')

ADDPFM FILE(RPGACADEMY/QRPGLESRC)
       MBR(HELLO)
       SRCTYPE(RPGLE)
       TEXT('First RPG program')
```

### Command explanation

| Command | Purpose |
|---|---|
| `CRTLIB` | Creates the training library |
| `CRTSRCPF` | Creates the source physical file |
| `RCDLEN(112)` | Provides a source-record length suitable for ILE RPG source |
| `ADDPFM` | Adds the `HELLO` source member |
| `SRCTYPE(RPGLE)` | Identifies the member as RPGLE source |

Refresh Object Browser and open:

`RPGACADEMY` → `QRPGLESRC` → `HELLO`

## Enter the program

```rpgle
**free

ctl-opt dftactgrp(*no);

dcl-s message varchar(52);

message = 'Welcome to The RPG Blend Academy.';

dsply message;

*inlr = *on;
return;
```

## Line-by-line explanation

| Line | Code | Explanation |
|---:|---|---|
| 1 | `**free` | Marks the source as fully free-form RPG |
| 2 | blank | Separates logical sections |
| 3 | `ctl-opt dftactgrp(*no);` | Compiles the program for the ILE environment rather than the default activation group |
| 4 | blank | Separates control options from declarations |
| 5 | `dcl-s message varchar(52);` | Declares a variable-length character variable |
| 6 | blank | Separates declarations from executable logic |
| 7 | `message = ...;` | Assigns text to the variable |
| 8 | blank | Improves readability |
| 9 | `dsply message;` | Displays the variable value to the current job interface |
| 10 | blank | Separates the main logic from program ending logic |
| 11 | `*inlr = *on;` | Sets the last-record indicator on for normal program ending behavior |
| 12 | `return;` | Returns control to the caller |

## Compile the program

Use the standardized Code for IBM i action when configured. The underlying command is:

```cl
CRTBNDRPG PGM(RPGACADEMY/HELLO)
           SRCFILE(RPGACADEMY/QRPGLESRC)
           SRCMBR(HELLO)
           OPTION(*EVENTF)
           DBGVIEW(*SOURCE)
           REPLACE(*YES)
```

### Compile command explanation

| Parameter | Purpose |
|---|---|
| `PGM` | Names the program object to create |
| `SRCFILE` | Identifies the source physical file |
| `SRCMBR` | Identifies the source member |
| `OPTION(*EVENTF)` | Produces event information that client tooling can use for diagnostics |
| `DBGVIEW(*SOURCE)` | Retains source-level debug information |
| `REPLACE(*YES)` | Replaces an existing program object after a successful compile |

## Verify and run

```cl
WRKOBJ OBJ(RPGACADEMY/HELLO) OBJTYPE(*PGM)

CALL PGM(RPGACADEMY/HELLO)
```

Expected output:

```text
Welcome to The RPG Blend Academy.
```

## Intentional error exercise

Remove the semicolon from the assignment statement and compile again. Review the first useful diagnostic in the VS Code Problems panel or compile output. Restore the semicolon, save, and recompile.

## Common beginner mistakes

| Mistake | What happens | Fix |
|---|---|---|
| Member was not saved | Compiler uses the older source | Save before compiling |
| Wrong library or member | A different object is compiled or no source is found | Verify qualified names |
| Missing semicolon | Compile fails with syntax diagnostics | Correct the first meaningful error and recompile |
| Assuming warnings equal failure | Student cannot tell whether a program was created | Review completion message and verify the `*PGM` |
| Calling before compiling | Old program runs or object is missing | Compile successfully and verify the object first |

## Manager’s perspective

Compile actions should be standardized and version controlled where possible. New developers should know the command behind the action so they understand the build, but they should not invent personal compile options for shared applications.

## Final sip

A recipe change does not alter the coffee already in the pot. Save the source, compile it, verify the new program, and only then serve the result.
