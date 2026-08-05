# Lessons 0.1–0.3 — Welcome, IBM i, and the Platform Names

## Course position

- **Academy level:** 000 — Orientation
- **Module:** 0 — Getting Started with RPG and IBM i
- **Lessons:** 0.1, 0.2, and 0.3
- **Estimated time:** 45–55 minutes
- **Prerequisites:** None
- **Required tools:** None for the concept sections

## Today’s coffee

**Coffee:** Breakfast blend  
**Roast:** Medium  
**Tasting notes:** Toasted nuts, cocoa, and a clean finish  
**Why it fits:** Module 0 should establish balance before adding complexity. The goal is orientation, not overload.

## Opening context

A new developer joins an IBM i team and hears four names before lunch: AS/400, iSeries, System i, and IBM i. Someone mentions a partition. Someone else talks about Power hardware. Then a support ticket says an “AS/400 program” failed even though the current server was installed recently.

Nothing is wrong with the developer. The vocabulary reflects decades of platform history. These lessons build a clean mental model before the student touches code.

## Learning objectives

By the end of these lessons, the student can:

- Explain the purpose of The RPG Blend Academy.
- Describe IBM i as an operating system and business platform.
- Distinguish IBM i from IBM Power hardware.
- Recognize AS/400, iSeries, System i, and IBM i as names from different points in the platform’s history.
- Communicate accurately without dismissing legacy terminology.

## Lesson 0.1 — Welcome to the Academy

The Academy teaches one connected application across the curriculum: the **RPG Blend Coffee Company Order Management System**. Early modules use small programs. Later modules add customers, inventory, orders, billing, APIs, testing, and modernization practices.

Each lesson follows a repeatable pattern:

1. Learn the concept.
2. See a practical example.
3. Perform a guided walkthrough.
4. Complete a lab.
5. Attempt an independent challenge.
6. Review the work from a manager and production-support perspective.

Success in Module 0 does not mean memorizing every command. It means being able to explain the platform, connect through VS Code, find source, compile a basic program, and understand what happened.

## Lesson 0.2 — What is IBM i?

IBM i is an operating system and integrated business-computing environment that runs on IBM Power hardware. It combines operating-system services, security, database capabilities, object management, job management, and application runtime support.

### Visual model

```text
Users and external systems
            |
Applications: RPG, CL, COBOL, Java, SQL, services
            |
IBM i operating system and integrated services
            |
Db2 for i | Security | Jobs | Objects | Networking
            |
IBM Power hardware or virtualized partition
```

A company may use IBM i for order processing, patient accounting, manufacturing, banking, distribution, insurance, retail, or other transaction-heavy workloads. The business value comes from the applications and data that have accumulated over years, not from the age of the original platform name.

### IBM i versus IBM Power

| Term | Meaning |
|---|---|
| IBM i | Operating system and integrated application platform |
| IBM Power | Current processor and server hardware family |
| Partition or LPAR | A virtualized system environment running an operating system |
| Db2 for i | The integrated relational database on IBM i |

A single Power server can host multiple partitions. One partition may run IBM i while another runs AIX or Linux.

## Lesson 0.3 — AS/400, iSeries, System i, and IBM i

The platform evolved through several product names. People often use the name they learned first.

| Name | How to interpret it today |
|---|---|
| AS/400 | Historical system name introduced in 1988; still common conversational shorthand |
| iSeries | Later branding used during the platform’s evolution |
| System i | Later combined system branding |
| IBM i | Current operating-system name |
| IBM Power | Current hardware family on which IBM i runs |

### Practical communication rule

Use **IBM i** when writing current technical documentation. Understand older names when reading tickets, source comments, job descriptions, or vendor documents. Do not dismiss a business user because they say “AS/400.” Translate the term, confirm the system they mean, and continue solving the problem.

## Common beginner mistakes

| Mistake | What happens | Correction |
|---|---|---|
| Treating IBM i as hardware | The student mixes operating-system and server concepts | Separate IBM i from IBM Power |
| Assuming “legacy” means obsolete | The student underestimates business value and risk | Evaluate application value, supportability, and architecture separately |
| Correcting every use of AS/400 | Communication becomes argumentative | Use current terms in documentation and translate older terms in conversation |
| Assuming every IBM i environment is identical | Setup instructions fail | Confirm release, partition, security, and company standards |

## Knowledge check

1. Is IBM i hardware or an operating system?
2. What is IBM Power?
3. Why do people still say AS/400?
4. What is a partition?
5. Why can an old application still have high business value?

## Manager’s perspective

Good onboarding starts with language. New developers should not spend their first week pretending they understand terms that no one has explained. Teams should maintain a short glossary, identify the current platform names, and explain which older terms still appear in tickets and code.

## Final sip

A coffee label may change while the beans and craft continue to evolve. IBM i has changed names and hardware generations, but the business systems built on it still deserve clear thinking and professional care.
