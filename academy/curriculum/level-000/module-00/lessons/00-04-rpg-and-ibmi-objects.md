# Lessons 0.4–0.5 — What Is RPG, and How IBM i Organizes Work

## Course position

- **Estimated time:** 40–50 minutes
- **Prerequisites:** Lessons 0.1–0.3
- **Required tools:** None for the concept sections

## Today’s coffee

**Coffee:** House blend  
**Roast:** Medium-dark  
**Tasting notes:** Cocoa, caramel, and roasted almond  
**Why it fits:** RPG and IBM i objects are the house standards of the platform. Learn the structure once, and later lessons become easier to navigate.

## Opening context

A developer opens a production ticket and sees a program, a physical file, a source member, and a library with nearly the same names. The source is not the executable program, the file is not necessarily a PC-style file, and the library is not simply a folder. IBM i becomes less intimidating once these relationships are clear.

## Learning objectives

The student can:

- Explain what RPG is used for.
- Distinguish RPG III, RPG/400, RPG IV, and modern fully free-form RPG.
- Explain libraries, objects, object types, source physical files, and members.
- Describe the role of the library list.
- Trace source code through compilation to a program object.

## Lesson 0.4 — What is RPG?

RPG is a business programming language with deep integration into IBM i. It is commonly used for transaction processing, database applications, batch processing, reports, interfaces, services, and business rules.

The name originally meant **Report Program Generator**, but modern RPG is a general-purpose language. Current code can use procedures, data structures, APIs, embedded SQL, service programs, JSON, XML, and other enterprise techniques.

### RPG generations

| Generation | What a new developer should know |
|---|---|
| RPG II | Historical; may still appear in very old environments |
| RPG III | Fixed-column language associated with System/38 and early AS/400 applications |
| RPG/400 | IBM i predecessor-era implementation commonly encountered in legacy applications |
| RPG IV / ILE RPG | Major redesign introduced with ILE; foundation of modern RPG |
| Fully free-form RPG | Modern source style used as the Academy default |

The Academy teaches modern RPG first while giving students enough legacy awareness to read production systems safely.

### Modern source example

```rpgle
**free

ctl-opt dftactgrp(*no);

dcl-s message varchar(52);

message = 'Welcome to The RPG Blend Academy.';
dsply message;

*inlr = *on;
return;
```

The student will compile this program later in the module.

## Lesson 0.5 — Libraries and objects

IBM i manages named objects. A library groups objects and provides a namespace for finding them.

```text
RPGACADEMY library
|
+-- QRPGLESRC *FILE
|   |
|   +-- HELLO RPGLE source member
|
+-- HELLO *PGM
```

### Core terms

| Term | Beginner definition |
|---|---|
| Library | An IBM i object that groups and names other objects |
| Object | A managed system resource with a name and object type |
| Object type | Identifies what the object is, such as `*PGM`, `*FILE`, or `*CMD` |
| Physical file | A database or source container created as an IBM i file object |
| Logical file | A keyed, selected, or ordered access path over physical data |
| Source physical file | A physical file intended to contain source members |
| Member | A named subdivision inside a database or source physical file |
| Program object | Executable object created by compiling and binding source |

### Source is not the program

`RPGACADEMY/QRPGLESRC(HELLO)` is the source member.  
`RPGACADEMY/HELLO *PGM` is the compiled executable object.

Changing the source does not change the program object until the source is compiled successfully.

### Qualified names

A qualified object name identifies both the library and object:

```text
RPGACADEMY/HELLO
```

Qualified names reduce ambiguity during training and production support.

### The library list

A job’s library list is an ordered search path. When a command uses an unqualified object name, IBM i searches libraries in the list. The wrong library list can cause a job to use the wrong program or file.

For Module 0, commands use qualified names so the student can see exactly which object is involved.

## Common beginner mistakes

| Mistake | What happens | Fix |
|---|---|---|
| Calling a source member a program | The student confuses editable text with an executable object | Identify the source location and the `*PGM` separately |
| Treating a library exactly like a folder | Object types, authorities, and naming behavior are missed | Use the folder comparison only as a starting analogy |
| Forgetting the library qualifier | A command finds the wrong object or no object | Use `LIBRARY/OBJECT` during training |
| Assuming all files contain source | Database files and source physical files are confused | Check the file purpose and member type |
| Editing legacy code without identifying its generation | Syntax and compiler assumptions are mixed | Label the RPG generation before changing code |

## Pro tips

- In production support, record the library, object name, object type, and member when reporting a problem.
- Never assume two objects with the same name are equivalent if they are in different libraries.
- Review the compile listing or event-file diagnostics before concluding that a compile succeeded.

## Knowledge check

1. What business work is RPG commonly used for?
2. Which RPG style is the Academy default?
3. What is the difference between a source member and a program object?
4. Why are qualified names useful?
5. What does a library list do?

## Manager’s perspective

A team standard should define source libraries, object libraries, naming conventions, compile options, and promotion rules. New developers need a sandbox where they can see these relationships without risking production objects.

## Final sip

The recipe card is not the cup of coffee. Source code is the recipe; the compiled program is what the system can serve. Professional developers keep both organized and know exactly which version is running.
