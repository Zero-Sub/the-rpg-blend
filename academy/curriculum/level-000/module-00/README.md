# Module 0 — Getting Started with RPG (and Coffee)

- **Level:** 000 — Orientation
- **Estimated time:** 2–3 hours
- **Prerequisites:** None
- **Primary development environment:** Visual Studio Code with Code for IBM i
- **Supplemental operational tool:** IBM i Access Client Solutions
- **Student experience:** No prior RPG or IBM i knowledge required

## Module Outcome

Students complete a full VS Code-first IBM i development cycle: connect, browse native objects, create or locate source, edit fully free-form RPG, compile with `CRTBNDRPG`, review diagnostics, verify the resulting `*PGM`, and run it.

## Source Layout

```text
module-00/
├── README.md
├── MASTER_COURSE_PACKAGE.md
├── code/
│   ├── rpg/
│   │   ├── HELLO.rpgle
│   │   └── HELLO2-starter.rpgle
│   └── cl/
│       ├── setup-training-workspace.cl
│       ├── compile-hello.cl
│       └── run-hello.cl
└── sources/
    └── source-register.md
```

The master course package contains the complete learner guide, guided lab, challenge, workbook, quiz and answer key, instructor notes, production asset checklists, Module 1 handoff, and technical source register.

## Classroom Standard

1. Connect to IBM i from VS Code with Code for IBM i.
2. Browse libraries, source files, and members in Object Browser.
3. Edit RPG source in the VS Code editor.
4. Compile with a Code for IBM i action or the explicit IBM i command.
5. Review compile diagnostics in the Problems panel and terminal.
6. Run and verify the program from the IBM i terminal.

ACS is not the primary coding environment for this module.

## Pilot Definition of Done

- [x] Complete course source added
- [x] VS Code-first workflow established
- [x] RPG and IBM i command source added
- [x] Technical source register added
- [ ] Compile source on the target IBM i training release
- [ ] Complete beginner pilot review
- [ ] Capture sanitized screenshots
- [ ] Incorporate pilot feedback
