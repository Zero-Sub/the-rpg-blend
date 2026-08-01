# The RPG Blend Academy

The RPG Blend Academy is a structured learning platform for IBM i and RPG development, from first exposure through modernization and technical leadership.

## Mission

Prepare developers to understand, support, develop, and modernize real IBM i business applications using RPG, Db2 for i SQL, disciplined engineering practices, and responsible AI assistance.

## Founder and Lead Instructor

**George Van Eaton** is an IBM i engineering leader with more than 30 years of experience in RPG, Db2 for i, SQL, software architecture, modernization, and production support. He is the author of *The RPG Blend* and a contributing author to the IBM Redbooks work-in-progress publication *Modernizing IBM i Applications*.

## Primary Audiences

- Associate RPG developers
- Junior IBM i developers
- Developers transitioning from another language
- Experienced RPG developers modernizing their skills
- Team leads and technical mentors

## Learning Model

Every lesson teaches **why before how** and connects technical syntax to business value, production support, maintainability, and professional growth.

Each lesson follows the Academy lesson standard and includes concepts, architecture, DDS when applicable, SQL DDL, legacy RPG recognition, modern free-form RPG, embedded SQL, common mistakes, production guidance, a lab, a challenge, a manager's perspective, and a coffee-centered closing.

## Academy Levels

| Level | Name | Outcome |
|---|---|---|
| 000 | Orientation | Understand IBM i, RPG, development tools, and the business context |
| 100 | Associate Foundations | Complete supervised RPG changes safely |
| 200 | Professional RPG Development | Build maintainable modular RPG and SQL applications |
| 300 | IBM i Modernization | Modernize legacy applications incrementally and responsibly |
| 400 | Technical Leadership | Lead standards, architecture, mentoring, and modernization strategy |

## Academy Operating Standards

Every module is governed by these standards:

- [Lesson Standard](standards/LESSON_STANDARD.md)
- [Lab Standard](standards/LAB_STANDARD.md)
- [Assessment Standard](standards/ASSESSMENT_STANDARD.md)
- [Code Standard](standards/CODE_STANDARD.md)
- [Source Validation Standard](standards/SOURCE_VALIDATION_STANDARD.md)

These files define the required structure, validation gates, safety expectations, source authority, and definition of done for Academy content.

## Repository Map

```text
academy/
├── blueprint/
│   ├── ACADEMY_BLUEPRINT.md
│   └── SOURCE_TO_CURRICULUM_MAP.md
├── standards/
│   ├── LESSON_STANDARD.md
│   ├── LAB_STANDARD.md
│   ├── ASSESSMENT_STANDARD.md
│   ├── CODE_STANDARD.md
│   └── SOURCE_VALIDATION_STANDARD.md
├── curriculum/
│   ├── level-000/
│   ├── level-100/
│   ├── level-200/
│   ├── level-300/
│   └── level-400/
├── sample-application/
├── labs/
├── assessments/
├── instructor-materials/
└── assets/
```

## Current Milestone

The first release is **Level 000, Module 0: Getting Started with RPG (and Coffee)**. It will serve as the pilot for the lesson, lab, workbook, assessment, and publishing model.

The immediate next step is to evaluate Module 0 against all five operating standards, close its gaps, validate its code and setup instructions, and prepare the complete student and instructor package.

## Source Guidance

The [Source-to-Curriculum Map](blueprint/SOURCE_TO_CURRICULUM_MAP.md) defines the Academy's reference hierarchy, source ownership, lesson alignment, and revalidation rules.

IBM manuals, Redbooks, and COMMON Boot Camp materials are research and verification sources. Their copyrighted content should not be copied into this repository unless redistribution rights are clear. Academy explanations and examples must be original, technically reviewed, compile-tested where applicable, and validated against current IBM i documentation.

Several available IBM manuals are IBM i 7.1-era references. They remain valuable for stable language and database concepts, but current IBM documentation governs release-sensitive tooling, commands, syntax, support, and security guidance.
