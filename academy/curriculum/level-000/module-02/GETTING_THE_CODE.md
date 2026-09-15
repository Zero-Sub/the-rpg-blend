# Getting the Module 2 Code

Module 2 source lives under:

```text
academy/curriculum/level-000/module-02/
```

## Clone or update the repository

If you do not already have the Academy repository:

```bash
git clone https://github.com/Zero-Sub/the-rpg-blend.git
cd the-rpg-blend
```

For the current development build, use the Module 2 branch assigned by the instructor. During development that branch is:

```bash
git fetch origin
git switch academy/module-02-db2-sql-centered
```

If you already have the repository:

```bash
git status
git fetch origin
git switch academy/module-02-db2-sql-centered
git pull --ff-only
```

Do not switch branches with uncommitted learner work unless you understand what will happen to those changes.

## Source layout

```text
src/sql/01_create_schema.sql
src/sql/02_seed_data.sql
src/sql/03_select_practice.sql
src/sql/04_joins_aggregates.sql
src/sql/05_dml_transactions.sql
src/sql/06_views_ctes.sql
src/rpg/product_data_demo.rpgle
```

## Important environment rule

The scripts use the Academy training schema name `RPGBA_CC` as a readable reference. Your instructor may require a learner-specific schema to avoid collisions.

Before running any DDL or DML, confirm the exact schema/library you are authorized to change. Do not blindly search-and-replace schema names across unrelated files.

## SQL workflow

Use the Db2 for IBM i extension in Visual Studio Code as the primary SQL workflow. ACS Run SQL Scripts may be used when the instructor needs ACS-only or especially strong database inspection features.

The `.sql` files are source-controlled artifacts. Exploratory SQL may begin in a scratch editor, but the final reproducible query or change belongs in the repository when the exercise requires evidence.

## RPG data-access demonstration

`product_data_demo.rpgle` is development source intended to be precompiled as SQL RPG on the designated training IBM i. The exact Code for IBM i Action / `CRTSQLRPGI` command must be validated for the training release before Module 2 becomes a release candidate.