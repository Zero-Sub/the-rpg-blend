THE RPG BLEND ACADEMY

RPGBA-101 Installation Quick Start

Install Visual Studio Code, Code for IBM i, Db2 for IBM i tooling, Git,
and approved AI assistance before the first connection.

Version 1.4 | Module 0 Addendum | The RPG Blend Academy

# Purpose

This addendum makes installation an explicit part of Module 0. Learners
should not be asked to connect to IBM i until the local workstation
toolchain has been installed, verified, and recorded in the evidence
log.

| Tool | Module 0 use | Verification evidence |
|---|---|---|
| Visual Studio Code | Primary editor and local workspace | VS Code opens; version recorded |
| Code for IBM i | IBM i connection, object browser, actions, terminal access | IBM i activity icon and command palette entries visible |
| Db2 for IBM i extension | SQL work from VS Code when approved | Database tooling visible and enabled |
| Git | Local change tracking and repository workflow | `git --version` recorded |
| IBM Bob | AI-assisted explanation and review when licensed | Approved extension/access confirmed without sharing secrets |
| IBM i Access Client Solutions | 5250, Run SQL Scripts, spooled files, IFS/admin tasks where appropriate | ACS launch verified when used by the course |

# Instructor timing

Add this as the first Module 0 segment. Recommended timing: 25–30
minutes when software is preapproved and mostly installed; 45–60 minutes
when learners must install everything live.

## 1. Preflight before installation

- Confirm the learner is using an approved workstation or training VM.
- Confirm the learner has permission to install VS Code and the approved extension set.
- Confirm the approved non-production IBM i host name, learner profile, training library/schema, and training IFS path are available.
- Do not distribute passwords, private keys, MFA codes, or production host details in course notes or screenshots.

## 2. Install Visual Studio Code

- Install Visual Studio Code using the organization-approved installer or software portal.
- Open VS Code and record the version in the evidence record.
- Confirm the Extensions view is available.
- Disable or avoid unapproved extensions in regulated training environments.

## 3. Install the IBM i extension set

- Install Code for IBM i.
- Install the IBM i Development Pack when it is the Academy or team standard.
- Install the Db2 for IBM i extension when SQL work will be performed from VS Code.
- Install RPGLE language support when not already included in the approved extension pack.
- Install IBM Bob only when licensed and approved for the learner environment.

## 4. Install and verify Git

- Install Git through the organization-approved package manager or software portal.
- Open a terminal and run `git --version`.
- Record the version. Do not configure personal credentials during a shared classroom demo.
- Clone or open only the approved RPGBA-101 training repository.

## 5. Verify before first IBM i connection

- Confirm the IBM i activity icon appears in VS Code.
- Open the Command Palette and confirm IBM i connection commands are available.
- Confirm Db2 tooling is visible when the database extension is installed.
- Confirm the learner can locate the repository folder, labs folder, SQL folder, and evidence record template.
- Do not create a connection until the instructor confirms the approved host and authentication method.

# Installation Lab 0A: Workstation proof

Learner task: install or verify the required local tools, then complete
this evidence checklist before connecting to IBM i.

| Evidence item | Learner entry | Instructor check |
|---|---|---|
| VS Code version | | |
| Code for IBM i installed | | |
| Db2 for IBM i extension installed, if used | | |
| Git version | | |
| Approved training repo opened | | |
| IBM Bob access confirmed, if used | | |
| No secrets or production data captured | | |

# Troubleshooting

| Symptom | Likely cause | First recovery step |
|---|---|---|
| No IBM i activity icon | Extension not installed, disabled, or VS Code needs reload | Reload VS Code and verify the extension is enabled. |
| IBM i connection command missing | Wrong extension or failed install | Confirm publisher/name against the approved course list. |
| Git command not found | Git not installed or not on PATH | Install through approved channel and reopen terminal. |
| Bob unavailable | License, extension, sign-in, or policy issue | Do not work around policy. Continue the lab without Bob and record the issue. |
| Learner sees production details | Wrong host, profile, or saved connection | Stop. Close the connection. Notify the instructor before continuing. |

# Safety language for instructors

Modern tooling does not weaken IBM i security expectations. It makes the
workflow easier to see. The learner still owns the host, identity,
target library, source location, command, result, and evidence.

Installation is complete only when the learner can show the installed
tools and explain what each one is for. A successful extension install
is not authorization to browse or change production systems.

# Version note

Product names, extension names, supported releases, ports,
authentication options, and user-interface labels can change. Recheck
official product documentation before live delivery or publication.
