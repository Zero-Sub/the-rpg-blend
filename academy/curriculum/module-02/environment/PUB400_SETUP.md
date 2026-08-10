# Module 2 PUB400 Environment Setup

**Validation status:** reviewed, not yet smoke-tested  
**Target:** PUB400 IBM i 7.5  
**Primary client:** Visual Studio Code  
**Extensions:** Code for IBM i and Db2 for IBM i

PUB400 currently provides each user with a profile and two private libraries. The Academy does not create a shared course library for learners. Each learner uses one of the libraries assigned to their PUB400 profile as the Module 2 schema.

## Learner values to record

Before running SQL, record:

- PUB400 user profile: `____________`
- learner library/schema: `____________`
- connection nickname in VS Code: `____________`
- Db2 for IBM i connection verified: yes / no
- date and time verified: `____________`

Do not record the password, private key, token, or other authentication secret.

## Naming rule

All course scripts use the placeholder `YOURSCHEMA`.

Before execution, replace `YOURSCHEMA` with the learner's assigned private PUB400 library. Example:

```sql
select PRODUCT_ID, PRODUCT_NAME
from YOURSCHEMA.PRODUCT;
```

becomes, for a fictional user whose library is `RPGLEARN1`:

```sql
select PRODUCT_ID, PRODUCT_NAME
from RPGLEARN1.PRODUCT;
```

Do not replace the placeholder with a library owned by another user or a system library.

## Preflight

1. Connect to PUB400 through Code for IBM i.
2. Verify the host and user profile.
3. Open the Db2 for IBM i extension.
4. Verify that the learner can browse the assigned private library/schema.
5. Create a new `.sql` file in the local Academy workspace.
6. Run a read-only catalog query or browse the schema to confirm the connection.
7. Stop if the learner is not certain which schema is safe.

## Course execution order

Run the scripts in this order:

1. `code/sql/01_create_catalog.sql`
2. `code/sql/02_seed_catalog.sql`
3. `code/sql/03_select_practice.sql`
4. `code/sql/04_join_practice.sql`
5. `code/sql/05_aggregation_practice.sql`
6. `code/sql/06_safe_data_changes.sql`
7. `code/sql/07_views_and_indexes.sql`
8. `code/sql/99_reset.sql` only when the learner intentionally resets the module

## Safety boundary

The module authorizes changes only to objects created by these scripts in the learner's assigned private library.

Never run Module 2 DDL or DML against:

- QSYS or another system library
- another PUB400 user's library
- an employer's development, test, or production database
- customer or patient data
- any schema whose ownership and purpose are unclear

## ACS role

IBM i Access Client Solutions Run SQL Scripts remains useful for deeper database inspection, Visual Explain, saved SQL scripts, and troubleshooting. The Academy still teaches the primary workflow in VS Code so the learner's database work stays alongside the modern source workflow.

## Reset behavior

`99_reset.sql` drops only the Module 2 objects and does so in dependency order. Review every object name before running it. A reset is destructive by design, even in training.
