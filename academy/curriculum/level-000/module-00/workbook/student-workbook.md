# Module 0 Student Workbook

## Student information

- Name: ______________________________
- Date started: _______________________
- Training system: ____________________
- Assigned training library: __________

Do not record passwords or other authentication information in this workbook.

## Part 1 — Platform vocabulary

Complete each statement in your own words.

1. IBM i is:  
   ________________________________________________________________

2. IBM Power is:  
   ________________________________________________________________

3. A partition is:  
   ________________________________________________________________

4. People still say AS/400 because:  
   ________________________________________________________________

5. One business workload that may run on IBM i is:  
   ________________________________________________________________

## Part 2 — Object model

Label the following model:

```text
____________________ library
|
+-- ____________________ *FILE
|   |
|   +-- ____________________ source member
|
+-- ____________________ *PGM
```

Explain the difference between the member and the `*PGM`:

________________________________________________________________

________________________________________________________________

## Part 3 — Tool roles

| Tool | What I use it for in Module 0 |
|---|---|
| Visual Studio Code | |
| Code for IBM i | |
| ACS | |
| Git | |

## Part 4 — Connection readiness

- [ ] VS Code installed
- [ ] Code for IBM i installed
- [ ] Approved training account available
- [ ] Training environment confirmed
- [ ] Object Browser opened
- [ ] IBM i terminal opened

Describe one connection problem and the correct escalation path:

________________________________________________________________

## Part 5 — Command worksheet

Write the purpose of each command.

| Command | Purpose |
|---|---|
| `CRTLIB` | |
| `CRTSRCPF` | |
| `ADDPFM` | |
| `CRTBNDRPG` | |
| `WRKOBJ` | |
| `CALL` | |

## Part 6 — Source walkthrough

For each line, explain what it does.

```rpgle
**free
ctl-opt dftactgrp(*no);
dcl-s message varchar(52);
message = 'Welcome to The RPG Blend Academy.';
dsply message;
*inlr = *on;
return;
```

| Code | My explanation |
|---|---|
| `**free` | |
| `ctl-opt dftactgrp(*no);` | |
| `dcl-s message varchar(52);` | |
| Assignment statement | |
| `dsply message;` | |
| `*inlr = *on;` | |
| `return;` | |

## Part 7 — Compile record

- Source member: __________________________________________
- Compile command or action: ______________________________
- Compile date and time: __________________________________
- Successful: Yes / No
- Program object: _________________________________________
- Object type: ____________________________________________

## Part 8 — Diagnostic exercise

- Intentional error introduced: ____________________________
- First useful diagnostic: _________________________________
- Why it occurred: ________________________________________
- Correction made: ________________________________________
- Recompile successful: Yes / No

## Part 9 — Challenge planning

Before writing `HELLO2`, complete this plan.

- First variable name: _____________________________________
- First variable purpose: __________________________________
- Second variable name: ____________________________________
- Second variable purpose: _________________________________
- Expected output: _________________________________________

## Part 10 — Readiness check

I can:

- [ ] Explain IBM i and IBM Power.
- [ ] Translate AS/400 terminology without confusion.
- [ ] Explain libraries, objects, source files, and members.
- [ ] Connect through VS Code with Code for IBM i.
- [ ] Locate a source member in Object Browser.
- [ ] Compile RPG source.
- [ ] Review a compile diagnostic.
- [ ] Verify a `*PGM` object.
- [ ] Run the program.
- [ ] Explain what Module 1 will add.

### Reflection

The concept that became clearest during this module was:

________________________________________________________________

The area where I still need help is:

________________________________________________________________
