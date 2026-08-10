# Module 2 Master Course Package

## Db2 for i + SQL

**Status:** content-complete development build; technical execution validation pending  
**Canonical module:** 2 of 8  
**Canonical source:** lesson Markdown and supporting source in this directory  
**Branch:** `academy/module-2-db2-sql`

This file is the package manifest. It does not replace the canonical lesson files. Coursebook, workbook, slides, video, PDF, and other delivery formats must be generated or adapted from the canonical source so the Academy does not create competing technical versions.

## Module Promise

After RPG Fundamentals, learners make Db2 for i a first-class part of their IBM i development mental model. They learn to define relational objects, protect data integrity, ask precise SQL questions, combine and summarize data, perform controlled changes, and gather evidence before Module 3 connects RPG to database access.

## Prerequisites

Learner has completed:

- Module 0 — Getting Started
- Module 1 — RPG Fundamentals

Learner can already:

- connect to a non-production IBM i from VS Code
- verify host/profile/library context
- navigate an Academy workspace
- run a basic SQL statement in the Db2 for IBM i extension
- use Git at the introductory level
- use IBM Bob under Academy safety rules

## Required Environment

- Visual Studio Code
- Code for IBM i
- Db2 for IBM i extension
- Git/GitHub workflow from prior modules
- IBM Bob when licensed/approved
- PUB400 learner-owned private library/schema or equivalent non-production IBM i
- ACS optional where its database tooling is appropriate

## Canonical Lessons

1. `lessons/02-01-db2-for-i-platform.md`
2. `lessons/02-02-native-and-sql-terms.md`
3. `lessons/02-03-build-coffee-catalog-schema.md`
4. `lessons/02-04-keys-constraints-defaults-null.md`
5. `lessons/02-05-select-precise-question.md`
6. `lessons/02-06-joins.md`
7. `lessons/02-07-aggregation-group-by-having.md`
8. `lessons/02-08-safe-data-changes.md`
9. `lessons/02-09-views-indexes-next-layer.md`
10. `lessons/02-10-module-lab.md`

## SQL Assets

- `code/sql/01_create_catalog.sql`
- `code/sql/02_seed_catalog.sql`
- `code/sql/03_select_practice.sql`
- `code/sql/04_join_practice.sql`
- `code/sql/05_aggregation_practice.sql`
- `code/sql/06_safe_data_changes.sql`
- `code/sql/07_views_and_indexes.sql`
- `code/sql/99_reset.sql`
- `code/sql/README.md`

All SQL is currently marked **reviewed** rather than **validated** until executed end-to-end on the documented training environment.

## IBM Bob Assets

- `code/bob/module2_prompts.md`

Bob is integrated into explanation, review, diagnostics, test design, and safety review. Each lesson retains an independent learner task and a human evidence requirement.

## Learner Materials

- `workbook/student-workbook.md`
- `lab/module-02-lab.md`
- `assessment/module-02-assessment.md`

## Instructor Materials

- `instructor-notes/instructor-guide.md`
- `lab/instructor-solution.md`
- `assessment/module-02-answer-key.md`

## Environment and Safety

- `environment/PUB400_SETUP.md`

Core safety boundary:

- learner-owned non-production schema only
- schema-qualified objects
- read/predict first
- preview before UPDATE/DELETE
- verify after every change
- no broad authority escalation to bypass training failures
- no secrets, PHI, customer data, or production data
- no blind AI-generated SQL

## Sources and Verification

- `sources/source-register.md`

Supplemental sources validate terminology and coverage. Current IBM documentation and current tooling documentation govern release-sensitive claims.

## Assessment Model

Recommended overall weighting:

| Component | Weight |
|---|---:|
| Knowledge/practical assessment | 40% |
| Coffee Catalog capstone | 50% |
| Instructor defense | 10% |

Passing requires:

- at least 80% on the assessment
- successful capstone behavior
- cleanup/reproducibility
- no critical safety failure
- independent explanation

## Delivery Sequence

```text
Platform mental model
        ↓
Native / SQL terminology
        ↓
DDL and relational model
        ↓
Keys + constraints + NULL
        ↓
SELECT
        ↓
JOIN
        ↓
GROUP BY / HAVING
        ↓
Safe INSERT / UPDATE / DELETE
        ↓
Views + indexes
        ↓
Independent Coffee Catalog capstone
        ↓
Module 3 — Files + Data Access
```

## Publication Conversion Plan

After technical validation, generate from canonical source:

- learner coursebook / PDF
- branded instructor guide
- branded learner workbook
- branded slide deck
- video lesson scripts
- LMS lesson pages
- downloadable SQL starter package
- public article adaptations where useful

Do not manually maintain conflicting technical prose in each format. Corrections flow into canonical Markdown first.

## Quality Gates

### Content

- [x] Module purpose defined
- [x] Lessons drafted
- [x] Original SQL assets drafted
- [x] Bob activities integrated
- [x] Independent tasks included
- [x] Production safety included throughout
- [x] Learner workbook drafted
- [x] Capstone lab drafted
- [x] Instructor solution drafted
- [x] Assessment drafted
- [x] Answer key drafted
- [x] Instructor guide drafted
- [x] Source register drafted

### Technical

- [ ] Execute setup on clean PUB400 learner library
- [ ] Execute every SQL statement successfully or record intentional failure
- [ ] Capture actual SQLSTATE/messages for negative tests
- [ ] Verify all expected result rows/counts
- [ ] Verify view/index creation
- [ ] Verify reset and clean rebuild
- [ ] Verify Db2 extension workflow/screenshots against current version
- [ ] Independent technical reviewer repeat run

### Instructional

- [ ] First-time learner pilot
- [ ] Timing captured
- [ ] Ambiguities corrected
- [ ] Assessment difficulty reviewed
- [ ] Independent defense observed

### Publication

- [ ] Branded coursebook generated
- [ ] Branded instructor guide generated
- [ ] Branded workbook generated
- [ ] Branded slide deck generated
- [ ] Release manifest frozen
- [ ] GitHub release created

## Definition of Done

Module 2 is release-ready only when the source package is technically validated on the documented IBM i environment, an independent reviewer can reproduce it from setup through reset, a learner can complete the capstone without hidden knowledge, and publication assets are generated from the validated canonical source.
