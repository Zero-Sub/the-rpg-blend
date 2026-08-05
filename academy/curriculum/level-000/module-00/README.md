# Module 0 — Getting Started with RPG (and Coffee)

- **Level:** 000 — Orientation
- **Estimated time:** 2–3 hours
- **Prerequisites:** None
- **Primary development environment:** Visual Studio Code with Code for IBM i
- **Supplemental operational tool:** IBM i Access Client Solutions
- **Student experience:** No prior RPG or IBM i knowledge required

## Module outcome

Students complete a full VS Code-first IBM i development cycle: connect, browse native objects, create or locate source, edit fully free-form RPG, compile with `CRTBNDRPG`, review diagnostics, verify the resulting `*PGM`, and run it.

## Lesson plan

| Lesson | Title | Estimated time |
|---|---|---:|
| 0.1 | Welcome to The RPG Blend Academy | 10 minutes |
| 0.2 | What Is IBM i? | 20 minutes |
| 0.3 | AS/400, iSeries, System i, and IBM i | 15 minutes |
| 0.4 | What Is RPG? | 20 minutes |
| 0.5 | Libraries, Objects, Source Files, and Members | 25 minutes |
| 0.6 | Your Development Tools | 15 minutes |
| 0.7 | Connecting to IBM i | 20 minutes |
| 0.8 | The RPG Development Cycle | 20 minutes |
| 0.9 | Your First RPG Program | 30 minutes |
| 0.10 | Review and Readiness | 15 minutes |
| Lab and challenge | Build, diagnose, and extend `HELLO` | 35–45 minutes |
| Assessment | Ten-question knowledge check | 15 minutes |

## Source layout

```text
module-00/
├── README.md
├── MASTER_COURSE_PACKAGE.md
├── lessons/
│   ├── 00-01-welcome-and-ibm-i.md
│   ├── 00-04-rpg-and-ibmi-objects.md
│   ├── 00-06-vscode-and-connection.md
│   ├── 00-08-development-cycle-and-first-program.md
│   └── 00-10-review-and-readiness.md
├── code/
│   ├── rpg/
│   │   ├── HELLO.rpgle
│   │   └── HELLO2-starter.rpgle
│   └── cl/
│       ├── setup-training-workspace.cl
│       ├── compile-hello.cl
│       └── run-hello.cl
├── lab/
│   └── module-00-lab.md
├── assessment/
│   └── module-00-assessment.md
├── workbook/
│   └── student-workbook.md
├── instructor-notes/
│   └── instructor-guide.md
└── sources/
    └── source-register.md
```

## Classroom standard

1. Connect to IBM i from VS Code with Code for IBM i.
2. Browse libraries, source files, and members in Object Browser.
3. Edit RPG source in the VS Code editor.
4. Compile with a Code for IBM i action or the explicit IBM i command.
5. Review compile diagnostics in the Problems panel and terminal.
6. Run and verify the program from the IBM i terminal.

ACS is not the primary coding environment for this module.

## Curriculum status

- [x] Complete lesson sequence added
- [x] Guided lab added
- [x] Independent challenge added
- [x] Student workbook added
- [x] Assessment and answer key added
- [x] Instructor guide and rubric added
- [x] VS Code-first workflow established
- [x] RPG and IBM i command source added
- [x] Technical source register added
- [ ] Compile source on the target IBM i training release
- [ ] Complete beginner pilot review
- [ ] Capture sanitized screenshots and final diagrams
- [ ] Incorporate pilot feedback
- [ ] Publish generated PDF, slide, and video adaptations
