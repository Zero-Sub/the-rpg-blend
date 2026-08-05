# Module 0 Assessment

## Student instructions

Answer all ten questions. A passing score is 80%. Questions 8–10 require short written explanations.

## Questions

1. Which statement is correct?
   - A. IBM i is the hardware server.
   - B. IBM i is an operating system and integrated business platform.
   - C. IBM Power is an RPG compiler.
   - D. AS/400 is the current operating-system name.

2. Why do people still use the term AS/400?
   - A. IBM i no longer exists.
   - B. It is a historical name that remains familiar in many organizations.
   - C. It is the name of every RPG program.
   - D. It means the same thing as Db2 for i.

3. What is the Academy’s primary Module 0 development environment?
   - A. SEU
   - B. RDi only
   - C. VS Code with Code for IBM i
   - D. A text editor with no IBM i connection

4. What is a library on IBM i?
   - A. A printed manual
   - B. An object that groups and names other objects
   - C. A source-code comment
   - D. A compiler listing

5. Which item is editable source code?
   - A. `RPGACADEMY/HELLO *PGM`
   - B. `RPGACADEMY/QRPGLESRC(HELLO)`
   - C. `CALL PGM(RPGACADEMY/HELLO)`
   - D. `IBM Power`

6. What does `CRTBNDRPG` do in this module?
   - A. Creates a source physical file
   - B. Connects VS Code to IBM i
   - C. Compiles and binds RPG source into an ILE program object
   - D. Creates a user profile

7. Why does the module use qualified names such as `RPGACADEMY/HELLO`?
   - A. To make the command longer
   - B. To identify the exact library and object
   - C. To avoid compiling source
   - D. To replace object authority

8. Explain the difference between a source member and a program object.

9. List the basic development cycle in order.

10. A compile fails after you remove a semicolon. Describe the correct response.

---

# Instructor answer key

1. **B** — IBM i is the operating system and integrated business platform.
2. **B** — AS/400 remains common historical shorthand.
3. **C** — VS Code with Code for IBM i.
4. **B** — A library is an IBM i object used to group and name other objects.
5. **B** — The member in `QRPGLESRC` is editable source.
6. **C** — `CRTBNDRPG` creates the ILE program from RPG source.
7. **B** — Qualification identifies the intended library and object.
8. Expected answer: A source member contains editable source text. A program object is the executable result of a successful compile and bind. Editing source does not change the existing program until compilation succeeds.
9. Expected answer: Connect or locate the workspace, edit source, save, compile, review diagnostics, correct errors when needed, verify the program object, run, and verify output.
10. Expected answer: Save the source, review the first meaningful diagnostic, restore the required semicolon, save, recompile, verify success, and run the corrected program. The student should not ignore the error or assume the old program changed.

## Scoring guidance

- Questions 1–7: 1 point each.
- Questions 8–10: 1 point each when the essential concept is present.
- Passing score: 8 of 10.
- A student who cannot distinguish source from the program object should repeat the related lesson and lab checkpoint even if the numerical score passes.
