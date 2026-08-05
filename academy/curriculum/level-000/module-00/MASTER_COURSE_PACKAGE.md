# The RPG Blend Academy

## Module 0: Getting Started with RPG (and Coffee)

**Estimated time:** 2-3 hours  
**Experience required:** None  
**Primary development environment:** Visual Studio Code with Code for IBM i  
**Supplemental operational tool:** IBM i Access Client Solutions  
**Verified:** July 31, 2026

The Academy uses a **VS Code-first workflow**. Students connect to IBM i through Code for IBM i, browse native objects, open and edit source members, run IBM i commands, compile RPG, review diagnostics, and execute the resulting program without leaving VS Code. ACS remains available for 5250 and other operational tasks but is not the primary coding environment.

## Module outcomes

- Explain IBM i as the operating system and IBM Power as the current hardware family.
- Explain RPG, RPG IV/ILE RPG, legacy RPG III, and fully free-form RPG.
- Recognize AS/400, iSeries, and System i as historical platform names.
- Understand libraries, objects, source physical files, members, and the library list.
- Install and configure Visual Studio Code with Code for IBM i.
- Connect to IBM i through SSH from VS Code.
- Use the Code for IBM i Object Browser and terminal.
- Create `RPGACADEMY/QRPGLESRC(HELLO)` from the VS Code terminal.
- Edit the `HELLO` source member in the VS Code editor.
- Compile `RPGACADEMY/HELLO` and review diagnostics in the Problems panel.
- Run the program from the VS Code IBM i terminal.

## VS Code-first development cycle

1. Open VS Code.
2. Connect to the training partition with Code for IBM i.
3. Open the IBM i Object Browser.
4. Create or locate the training library and source physical file.
5. Open the RPGLE source member in the VS Code editor.
6. Save the member.
7. Compile from a standardized Code for IBM i action or run the explicit command in the VS Code terminal.
8. Review diagnostics in the Problems panel and terminal output.
9. Verify the resulting `*PGM` object.
10. Run the program from the VS Code terminal.

## First RPG program

```rpgle
**free

ctl-opt dftactgrp(*no);

dcl-s message varchar(52);

message = 'Welcome to The RPG Blend Academy.';

dsply message;

*inlr = *on;
return;
```

## Create the workspace from the VS Code terminal

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

After running these commands, refresh the Code for IBM i Object Browser and open:

`RPGACADEMY` → `QRPGLESRC` → `HELLO`

## Compile in VS Code

The preferred classroom workflow is a standardized Code for IBM i compile action. Students must also see the underlying command at least once:

```cl
CRTBNDRPG PGM(RPGACADEMY/HELLO)
           SRCFILE(RPGACADEMY/QRPGLESRC)
           SRCMBR(HELLO)
           OPTION(*EVENTF)
           DBGVIEW(*SOURCE)
           REPLACE(*YES)
```

`OPTION(*EVENTF)` allows client tooling to surface compile diagnostics in the VS Code Problems panel.

## Run in VS Code

```cl
CALL PGM(RPGACADEMY/HELLO)
```

Run the command from the Code for IBM i terminal. The expected message is:

`Welcome to The RPG Blend Academy.`

## Role of ACS

ACS is supplemental in this course. It may be used for:

- A 5250 session when required by the organization.
- Password-change or operational workflows that are not exposed through the VS Code connection.
- Run SQL Scripts in later database lessons.
- Data transfer, printer output, and other IBM i client functions.

Students should not use SEU, a 5250 editor, or RDi as the primary Module 0 coding path unless an internal adaptation explicitly changes the Academy standard.

## Guided lab

Create the training library and source file, add the `HELLO` member, enter the RPG source, compile it, verify the `*PGM`, and call it. Then introduce a missing semicolon, recompile, review the first diagnostic in VS Code, correct the source, and compile successfully again.

## Challenge

Create `HELLO2` and personalize the welcome message with a student name. The program must use fully free-form RPG, declare at least two variables, display the personalized message, and end cleanly.

## Knowledge check

Students should be able to explain:

1. The difference between IBM i and IBM Power.
2. Why AS/400 remains common conversational terminology.
3. The purpose of a library.
4. The relationship among a source physical file, a member, and a program object.
5. The edit-compile-diagnose-run cycle.
6. Why qualified names are used in the module.
7. Why VS Code with Code for IBM i is the Academy standard.

## Manager's perspective

A strong onboarding environment gives new developers least-privilege access, a predictable training library, standard compile actions, clear source naming, and a non-production partition. The goal is not merely to get one program to run. The goal is to teach a repeatable workflow that supports code review, maintainability, and safe production habits.

## Preparation for Module 1

**Module 1: Reading and Writing Modern RPG — Program Structure, Variables, Data Types, and Expressions**

Module 1 continues in the same VS Code workspace and expands the shared **RPG Blend Coffee Company Order Management System**.
