# Lessons 0.6–0.7 — VS Code, Code for IBM i, and Connecting to IBM i

## Course position

- **Estimated time:** 35–45 minutes
- **Prerequisites:** Lessons 0.1–0.5
- **Required tools:** Visual Studio Code, Code for IBM i, and an approved IBM i training account

## Today’s coffee

**Coffee:** Cold brew concentrate  
**Roast:** Dark  
**Tasting notes:** Cocoa, molasses, and a smooth finish  
**Why it fits:** These tools concentrate the development workflow into one workspace.

## Opening context

Module 0 uses Visual Studio Code with Code for IBM i so students begin with a modern editor, object browsing, terminal access, compile actions, and diagnostics in one place.

## Learning objectives

The student can:

- Explain the roles of VS Code, Code for IBM i, and ACS.
- Connect to an approved IBM i training environment.
- Browse a library, source physical file, and member.
- Open an IBM i terminal inside VS Code.
- Recognize common connection failures and follow the correct escalation path.

## Tool roles

| Tool | Module 0 role |
|---|---|
| Visual Studio Code | Primary editor and development workspace |
| Code for IBM i | IBM i connection, object browsing, member editing, actions, terminal, and diagnostics |
| IBM i Access Client Solutions | Supplemental 5250 and operational tooling |
| Git | Version control for Academy repository source |
| RDi | Enterprise alternative used by some organizations |

## Before connecting

The instructor or system administrator must provide the approved training-system address, user profile, network requirements, training library convention, and authority needed for the lab. Authentication details must be handled through the organization’s approved process and must never be stored in course files or Git.

## Hands-on walkthrough

1. Install Visual Studio Code from the approved source.
2. Open the Extensions view.
3. Search for **Code for IBM i**.
4. Install the approved extension.
5. Open the Code for IBM i connection view.
6. Create a connection using the training-system information supplied by the instructor.
7. Connect through the approved authentication prompt.
8. Confirm the status area identifies the intended training system.
9. Open Object Browser.
10. Open the Code for IBM i terminal.

> Interface labels can change. Instructors must revalidate screenshots and wording before each cohort.

## Expected result

The student sees an active IBM i connection and can open both Object Browser and an IBM i terminal. No production object is changed during connection testing.

## Connection model

```text
VS Code
  |
Code for IBM i
  |
Approved secure connection
  |
IBM i training partition
  |
Training library and objects
```

## Common beginner mistakes

| What the student sees | Likely cause | Response |
|---|---|---|
| System cannot be reached | Network, address, VPN, port, or service issue | Recheck the approved connection instructions |
| Sign-in fails | Account or authentication issue | Stop and contact the instructor or administrator |
| Connection works but objects are missing | Wrong system, filter, library, or authority | Verify the connection and Object Browser filter |
| Command is not recognized | Command entered in the wrong terminal context | Confirm the terminal type and command syntax |
| Source is read-only | Authority, lock, or environment policy | Do not bypass controls; ask the instructor |

## Pro tips

- Name the connection clearly, such as `TRAINING-IBM-I`.
- Confirm the environment before running a command.
- Use least-privilege access.
- Keep training and production connections clearly distinguishable.

## Knowledge check

1. What is the Academy’s primary development environment?
2. What role does ACS have in Module 0?
3. What should be confirmed before running a command?
4. Why should credentials never appear in Git?
5. Who should resolve an account or authority problem?

## Manager’s perspective

Tool setup is part of onboarding architecture. A mature team documents supported versions, required extensions, connection standards, compile actions, authority boundaries, and escalation paths.

## Final sip

Good equipment does not replace skill, but it removes friction. A standardized VS Code workspace lets the developer focus on learning the platform instead of reconstructing someone else’s setup.
