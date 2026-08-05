# Lesson 0.10 — Review, Readiness, and the Next Cup

## Course position

- **Estimated time:** 15–20 minutes
- **Prerequisites:** Lessons 0.1–0.9 and guided lab

## Today’s coffee

**Coffee:** Pour-over  
**Roast:** Medium  
**Tasting notes:** Caramel, citrus, and a clean finish  
**Why it fits:** A pour-over reveals whether each step was handled with care. This review does the same for the student’s first IBM i development cycle.

## Opening context

The first program is small on purpose. The real accomplishment is not the message on the screen. It is the student’s ability to move from an unfamiliar platform to a repeatable development workflow.

## Learning objectives

The student can:

- Summarize the major Module 0 concepts.
- Demonstrate the complete VS Code-first development cycle.
- Identify areas requiring more practice.
- Explain what Module 1 will add.

## Terminology review

| Term | Essential meaning |
|---|---|
| IBM i | Operating system and integrated business platform |
| IBM Power | Hardware family |
| AS/400 | Historical platform name still used conversationally |
| RPG | Business programming language used extensively on IBM i |
| Library | Object that groups and names other objects |
| Source physical file | File object that contains source members |
| Member | Named source or data subdivision within a file |
| `*PGM` | Executable program object |
| Code for IBM i | VS Code extension used for IBM i development workflow |
| Compile | Translation and binding of source into a runnable object |

## Hands-on readiness demonstration

Without copying the lab steps, the student should be able to:

1. Connect to the approved training system.
2. Locate the assigned library in Object Browser.
3. Open `QRPGLESRC(HELLO)`.
4. Explain each line at a beginner level.
5. Save and compile the member.
6. Confirm whether the compile succeeded.
7. Verify the resulting `HELLO *PGM`.
8. Run the qualified program.
9. Explain where a compile error would appear.

## Troubleshooting checklist

When the result is unexpected, check in this order:

1. Am I connected to the correct training system?
2. Am I editing the intended library, file, and member?
3. Did I save the member?
4. Did I compile the same member I edited?
5. What is the first meaningful diagnostic?
6. Did compilation complete successfully?
7. Does the expected `*PGM` exist?
8. Am I calling the intended qualified program?

## Module completion criteria

- [ ] Guided lab complete.
- [ ] Intentional compile error diagnosed and corrected.
- [ ] `HELLO` runs successfully.
- [ ] `HELLO2` challenge attempted.
- [ ] Assessment score is at least 80%.
- [ ] Student explains source versus program object.
- [ ] Instructor or mentor confirms hands-on readiness.

## Preparation for Module 1

Module 1 introduces:

- Program structure.
- Naming and formatting standards.
- Stand-alone variables.
- Character, numeric, date, time, timestamp, and indicator data types.
- Constants and initialization.
- Assignment and expressions.
- Built-in functions.
- A stronger version of the RPG Blend Coffee Company application.

Keep the VS Code connection and training library. Module 1 builds from the same environment.

## Manager’s perspective

Orientation is complete when the developer can perform the workflow safely and explain it—not when the setup checklist is merely marked complete. Managers should pair the new developer with a mentor, preserve the training environment, and require the same qualified, repeatable workflow in early assignments.

## Final sip

The first cup proves the equipment works. The next cups build technique. Module 0 gives the student a working station and a reliable process; Module 1 begins the craft of writing RPG well.
