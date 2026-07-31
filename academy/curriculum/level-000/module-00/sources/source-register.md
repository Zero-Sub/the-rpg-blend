# Module 0 Source and Manual Register

**Verification date:** July 31, 2026

| Source | Category | Release/date | Module 0 use | Status |
|---|---|---|---|---|
| ILE RPG Programmer's Guide | IBM official documentation | IBM i 7.1, 2010 | Source physical files, `CRTBNDRPG`, compiler listings, program creation | Authoritative for 7.1; legacy reference for the 2026 course |
| ILE RPG Language Reference | IBM official documentation | IBM i 7.1, 2010 | RPG syntax, compiler directives, program flow | Authoritative for 7.1; current documentation required for release-sensitive details |
| Who Knew You Could Do That with RPG IV? | IBM Redbooks | Second edition, 2016 | Modern RPG context and modernization framing | Supplemental |
| Introducing RPG | COMMON Boot Camp | Publication date not stated in uploaded copy | RPG history, IBM i orientation, first-program learning sequence | Supplemental training source |
| Getting Started - How an RPG Program Is Put Together | COMMON Boot Camp | Publication date not stated in uploaded copy | Files, members, tables, and program structure | Supplemental training source |
| SQL Programming | IBM official documentation | IBM i 7.1, 2010 | IBM i SQL objects and terminology; reserved for later database modules | Authoritative for 7.1 |
| Embedded SQL Programming | IBM official documentation | IBM i 7.1, 2010 | Reserved for embedded SQL modules | Authoritative for 7.1 |
| SQL Messages and Codes | IBM official documentation | IBM i 7.1, 2010 | Reserved for SQL diagnostics and error-handling modules | Authoritative for 7.1 |
| Code for IBM i documentation | Project documentation | Revalidated July 31, 2026 | VS Code connection, Object Browser, terminal, compile actions, Problems panel | Current setup authority; recheck before each cohort |
| IBM i Access Client Solutions documentation | IBM support documentation | Revalidated July 31, 2026 | Supplemental 5250 and operational tooling | Current setup authority; recheck before each cohort |

## Technical decisions

- VS Code with Code for IBM i is the Academy's primary Module 0 development environment.
- ACS is supplemental and is not the primary code editor.
- Students use qualified IBM i object names during Module 0.
- The starter workspace uses `RPGACADEMY`, `QRPGLESRC`, and member `HELLO`.
- The source physical file uses `RCDLEN(112)`.
- The first program uses fully free-form RPG and is compiled with `CRTBNDRPG`.
- `OPTION(*EVENTF)` is included to support client-tool integrated compile diagnostics.

## Release-sensitive items to revalidate

- Minimum IBM i release and technology refresh supported by Code for IBM i.
- SSHD, PASE, Bash, and user-shell requirements.
- Current VS Code and Code for IBM i interface labels.
- ACS current supported package and security remediation levels.
- Organization-specific access, ports, authentication, and authority standards.
- Compile-action variables and command definitions used in the classroom.
