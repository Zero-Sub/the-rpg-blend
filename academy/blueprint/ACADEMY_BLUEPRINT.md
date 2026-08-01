# The RPG Blend Academy Blueprint

## Vision

Create the definitive learning pathway for IBM i and RPG developers, combining practical instruction, modernization guidance, production discipline, and technical leadership.

## Founder and Lead Instructor

The RPG Blend Academy was created by **George Van Eaton**, an IBM i engineering leader with more than 30 years of experience in RPG, Db2 for i, SQL, software architecture, modernization, and production support. He is the author of *The RPG Blend* and a contributing author to the IBM Redbooks work-in-progress publication *Modernizing IBM i Applications*.

The Academy is designed to translate that technical and leadership experience into a structured learning system for new developers, experienced modernizers, mentors, and engineering leaders.

## Success Criteria

The Academy is successful when it provides:

- A complete five-level curriculum roadmap
- A consistent lesson and lab standard
- One sample business application expanded throughout the curriculum
- Production-quality RPG, DDS, CL, and SQL examples
- Student workbooks, assessments, instructor notes, and presentation assets
- A public publishing path and an internal onboarding adaptation
- Measurable student progression from beginner to independent contributor
- Traceable alignment between lessons and authoritative technical sources

## Learning Progression

```text
IBM i newcomer
    ↓
RPG code reader
    ↓
Supervised associate developer
    ↓
Independent RPG and SQL developer
    ↓
Modernization engineer
    ↓
Technical mentor and platform leader
```

## Design Principles

1. Explain the concept before introducing syntax.
2. Teach business and production value, not only language mechanics.
3. Show legacy code for recognition and modern code as the preferred direction.
4. Use one connected sample application instead of disconnected examples.
5. Require hands-on practice, review, and measurable completion outcomes.
6. Keep lessons modular enough to become articles, PDFs, videos, workshops, and internal training.
7. Validate technical guidance against IBM documentation and current platform behavior.
8. Record source title, release, section, and verification date for every completed lesson.
9. Use VS Code and Code for IBM i as the primary learning workflow while preserving RDi and 5250 knowledge where operationally relevant.
10. Treat AI as an engineering assistant that requires review, testing, security controls, and professional accountability.

## IBM Alignment Standard

The Academy teaches modern IBM i development consistent with current IBM guidance while preserving the knowledge required to understand and maintain legacy applications. Students learn how existing systems work, how to support them safely, and how to modernize them responsibly.

Current IBM documentation is the final authority for release-sensitive behavior. IBM manuals, IBM Redbooks, and COMMON training provide the technical and instructional foundation described in the [Source-to-Curriculum Map](SOURCE_TO_CURRICULUM_MAP.md).

## Deliverable Standard

A module is complete only when it includes:

- Module overview
- Lesson manuscripts
- Source code and database definitions
- Student lab
- Challenge exercise
- Knowledge check
- Answer key
- Instructor notes
- Workbook-ready content
- Publication-ready content
- Source register and release-sensitive verification checklist

## Sample Application

The curriculum uses one connected application: **The RPG Blend Coffee Company Order Management System**.

The application grows across the curriculum through:

- Customer Master
- Coffee Product Catalog
- Inventory
- Order Entry
- Pricing and Discounts
- Billing
- Shipping Status
- Reporting
- APIs and integration

Every lesson should extend or explain part of this system rather than introduce an unrelated sample without a documented reason.

## Initial Release

**Level 000 — Module 0: Getting Started with RPG (and Coffee)**

The pilot will establish the final production process for every future module, including the VS Code-first workflow, lesson standard, lab model, assessments, source validation, and publishing process.

## Immediate Build Sequence

1. Complete and validate Module 0.
2. Build Module 1: Reading and Writing Modern RPG.
3. Produce the Level 100 source pack for variables, control flow, built-in functions, and native I/O.
4. Build the SQL foundation sequence covering DDS versus DDL and basic relational access.
5. Build the ILE sequence covering procedures, modules, binding, and service programs.
6. Establish the modernization track covering Git, DevOps, testing, AI, architecture, database modernization, performance, and security.
