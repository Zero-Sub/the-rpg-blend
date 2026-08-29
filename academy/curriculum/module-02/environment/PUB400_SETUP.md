# Module 2 PUB400 Environment Setup

**Validation status:** current documentation/source validated; live learner smoke test pending  
**Target:** PUB400 IBM i 7.5  
**Primary client:** Visual Studio Code  
**Extensions:** Code for IBM i and Db2 for IBM i

As of the 2026-08-10 validation pass, PUB400 advertises IBM i 7.5 and two private libraries for each user profile. PUB400 currently runs SSH on port `2222`, not the default port 22. These service details are delivery-sensitive and must be rechecked before a course release or pilot.

The Academy does not create a shared course library for learners. Each learner uses one of the private libraries assigned to the PUB400 profile as the Module 2 schema.

## Learner values to record

Before running SQL, record:

- PUB400 user profile: `____________`
- learner library/schema: `____________`
- connection nickname in VS Code: `____________`
- SSH port: `2222` / reverified value: `____________`
- Code for IBM i version: `____________`
- Db2 for IBM i extension version: `____________`
- Db2 for IBM i connection verified: yes / no
- date and time verified: `____________`

Do not record the password, private key, token, or other authentication secret.

## Connection note

Code for IBM i connects to IBM i through SSH. For the current PUB400 configuration, specify port `2222` in the connection rather than assuming port 22.

The Db2 for IBM i extension currently requires a per-user server component. When the extension connects through Code for IBM i, it can ask the learner to confirm installation or update of that component under the user's `$HOME/.vscode` directory. That expected extension-managed prompt is different from a request for broad IBM i authority. If the install/update cannot complete with the learner's normal authority, stop and investigate rather than expanding authority as a shortcut.

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

1. Confirm PUB400's current IBM i release and SSH port from the service documentation.
2. Connect to PUB400 through Code for IBM i using the assigned profile and current SSH port.
3. Verify the host, user profile, and connection nickname.
4. Record the Code for IBM i and Db2 for IBM i extension versions.
5. Open the Db2 for IBM i extension and complete only its expected per-user server-component installation/update prompt if one appears.
6. Verify that the learner can add/browse the assigned private library in the Db2 for IBM i Schema Browser.
7. Create or open a `.sql` file in the local Academy workspace.
8. Run a read-only catalog/current-context query to confirm the SQL job and connection.
9. Stop if the learner is not certain which schema is safe.

A schema browser showing no tables does not by itself prove that the schema is wrong; a new learner library can legitimately contain no relational objects yet. Verify the library name and ownership/context separately.

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

PUB400 is a public learning system, not an enterprise production-equivalent environment. The purpose of using it here is to practice safe development habits in learner-owned objects, not to imply that its security, journaling, availability, backup, or change-management configuration represents a production IBM i.

## ACS role

IBM i Access Client Solutions Run SQL Scripts remains useful for deeper database inspection, Visual Explain, saved SQL scripts, and troubleshooting. The Academy still teaches the primary workflow in VS Code so the learner's database work stays alongside the modern source workflow.

## Reset behavior

`99_reset.sql` drops only the Module 2 view, index, and tables in dependency order. IBM i 7.5 supports `DROP ... IF EXISTS`, so the reset can be rerun when one or more Academy objects are already absent. `IF EXISTS` does not protect against a wrong schema name. Review every substituted object name before running the reset.
