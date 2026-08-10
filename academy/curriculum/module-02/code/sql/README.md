# Module 2 SQL Assets

All SQL in this folder is original Academy training code.

**Current validation status:** reviewed — execution on PUB400 IBM i 7.5 pending.

Replace every `YOURSCHEMA` placeholder with your assigned PUB400 private library before execution. Run one script at a time in the documented order from `environment/PUB400_SETUP.md`.

The dataset is deliberately small and fictional. No script requires production or customer data.

## Expected base rows after seeding

- `CATEGORY`: 3 rows
- `PRODUCT`: 5 rows
- `INVENTORY`: 5 rows

`06_safe_data_changes.sql` temporarily creates product `2999`, changes it, verifies it, and deletes it again. The base dataset should therefore return to the counts above.

## Release gate

Do not mark these scripts `validated` until a reviewer runs them from a clean learner library on PUB400, records statement outcomes and row counts, runs the reset script, and successfully repeats the setup.
