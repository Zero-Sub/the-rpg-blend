# PUB400 Setup for RPGBA-101 Module 1

Use this guide when a learner does not have an employer or school IBM i environment.

## 1. Create the PUB400 account

Register for one individual account at PUB400. Do not create multiple accounts for the same learner.

PUB400 currently provides:

- one `*PGMR` user profile
- two private libraries for learner objects
- a third library intended for save files
- an IFS home directory
- a shared IBM i 7.5 learning system

PUB400 is not an Academy-controlled system. It has no regular backup and no availability guarantee. Git remains the authoritative copy of all Academy source.

## 2. Record the learner environment

After first sign-on, record these values in the learner evidence record:

```text
Host: pub400.com
SSH port: 2222
User profile: <learner PUB400 ID>
Primary build library: <actual assigned private library>
Secondary private library: <actual assigned private library>
Save-file library: <actual assigned save-file library>
IFS home: /home/<learner ID>
Module 1 IFS path: /home/<learner ID>/rpgba-101/module-1
```

PUB400 documentation uses names such as `MYUSER1`, `MYUSER2`, and `MYUSERB` as examples. Verify the actual account values rather than assuming them.

## 3. Configure Code for IBM i

Create a connection using:

```text
Connection name: PUB400 - <learner ID>
Host: pub400.com
SSH port: 2222
User: <learner ID>
```

Use the learner's own authentication method. Do not put the password or private key in Git, course notes, screenshots, Bob prompts, or learner evidence.

After connection, verify:

- host is `pub400.com`
- connected user is the expected learner ID
- current library is the learner's approved primary build library
- user library list contains only the libraries required for the lab
- home directory resolves to the learner's PUB400 area

## 4. Clone or open the Academy repository locally

The local Git workspace is the source of truth. Do not treat files copied to PUB400 as the master copy.

Create a local `.env` file from `.env.example` and set the current/build library to the learner's actual assigned private library.

Example only:

```text
CURLIB=MYUSER1
LIBL=MYUSER1 MYUSER2
```

Never commit `.env`.

## 5. Set the deploy directory

Use an IFS directory owned by the learner, preferably:

```text
/home/<learner ID>/rpgba-101/module-1
```

Create it only inside the learner's own home directory.

## 6. Verify the compile Action before first use

Open `.vscode/actions.json` and verify the validation Action.

The Action should prompt for:

- Build library - defaulted from `&BUILDLIB`
- Program object
- Source path - defaulted from `&FULLPATH`

For each compile, verify the prompt before execution.

Suggested object names:

```text
M1L1MAP
M1L1IND
M1L2DATA
M1L3EXPR
M1L4DEC
M1L5LOOP
M1L6PROC
M1CAPST
M1CAPSOL
```

## 7. Smoke test

Run these checks before beginning the course:

1. Open `src/lesson-01/program_map.pgm.rpgle`.
2. Run the `RPGBA-101 Validate CRTBNDRPG` Action.
3. Enter the learner's primary build library.
4. Enter program object `M1L1MAP`.
5. Confirm the source path points to the learner's deployed Module 1 path.
6. Confirm the compile completes successfully.
7. Prove `M1L1MAP` exists in the learner's build library.
8. Run the call Action for `M1L1MAP`.
9. Verify the output contains `Welcome Avery to RPGBA-101`.
10. Run `git status` locally and confirm no unexpected source changes occurred.

If any step fails, stop and record the issue before continuing to later lessons.

## 8. PUB400-specific safety rules

- Work only in the learner's own libraries and IFS home path.
- Do not scan system objects or other users' objects.
- Do not alter system values, security configuration, or shared system settings.
- Do not run load, stress, or long-running experiments on the shared service.
- Do not place employer code, client data, PHI, credentials, or confidential information on PUB400.
- Keep source in Git because PUB400 does not provide regular backup.
- If PUB400 is unavailable, pause the lab. Do not substitute a production IBM i environment.

## 9. Academy validation boundary

PUB400 is appropriate for development fundamentals, source compilation, basic RPG execution, SQL learning, and Git/VS Code workflow practice.

It is not the Academy environment for exercises that require system administration, elevated authority, production-like security configuration, or changes that could affect other users.

## Current-source review

PUB400 operational facts in this guide were rechecked against PUB400's current public site on August 7, 2026. Code for IBM i Action syntax was rechecked against the current Code for IBM i documentation on the same date. Both are version-sensitive and must be revalidated before future major Academy releases.
