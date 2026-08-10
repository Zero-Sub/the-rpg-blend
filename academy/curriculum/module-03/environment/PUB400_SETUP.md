# Module 3 PUB400 Environment Setup

**Status:** source-reviewed setup; live Module 3 smoke test pending  
**Target:** PUB400 IBM i 7.5 for ordinary Module 3 labs  
**Primary client:** VS Code + Code for IBM i + Db2 for IBM i

Module 3 assumes the learner already completed the Module 2 PUB400 setup and has one assigned private library/schema.

## Do Not Disrupt Module 2 Validation

If Module 2 is still being validated, do not edit its canonical SQL or expected data. Module 3 adds only its own order objects to the learner library after Module 2 base objects are confirmed.

Required Module 2 objects for the integrated path:

- `CATEGORY`
- `PRODUCT`
- `INVENTORY`

## Learner Record

- host / connection nickname: `____________`
- user profile: `____________`
- learner library/schema: `____________`
- SSH port: `____________`
- Code for IBM i version: `____________`
- Db2 for IBM i extension version: `____________`
- IBM i release observed: `____________`
- current Git branch: `____________`
- date/time verified: `____________`

Never record passwords, private keys, tokens, or other secrets.

## Preflight

1. Confirm the current PUB400 connection settings from the service documentation.
2. Connect through Code for IBM i using the learner profile.
3. Verify host/profile and the assigned library.
4. Confirm Module 2 base tables exist and have the expected validated state for this lab.
5. Open the local Module 3 branch/workspace.
6. Verify the Db2 for IBM i connection and schema browser.
7. Confirm the learner can create objects only where the course authorizes work.
8. Run a read-only context/catalog query before any DDL.
9. Stop if the target library or Module 2 prerequisite state is uncertain.

## Build Sequence

1. Run `code/sql/10_create_order_access.sql` after replacing `YOURSCHEMA`.
2. Run `code/sql/11_seed_orders.sql`.
3. Compile/run the native and SQLRPGLE examples one at a time.
4. Run the transaction preflight before Lesson 3.8.
5. Run `code/sql/19_reset_module3.sql` only when reset is intentional.

## Compile-Time vs Runtime Target

Module 3 native examples use explicit `EXTDESC('YOURSCHEMA/ORDHDR')` / `EXTFILE(*EXTDESC)` style definitions after the placeholder is replaced with the actual learner library. The point is to make both compile-time external description and runtime file target visible for training.

That approach is intentionally stricter than relying on an unqualified file and current library list. Enterprise standards may use different override/configuration patterns; learners should understand those patterns later rather than infer that one course technique is universal.

## Actions

`environment/actions-module3.example.json` is a reference, not an instruction to overwrite an existing workspace `.vscode/actions.json`. Merge only the actions required by the validated Academy workspace and preserve existing canonical actions.

## Transaction Exception

Normal Module 3 read/change labs may run in learner-owned PUB400 objects. The transaction lab is different: it requires validated journaling and commitment-control prerequisites.

Read `TRANSACTION_PREFLIGHT.md`. If the environment does not satisfy it under approved normal authority, do not create journals, start journaling, or ask for broader authority merely to complete the exercise. Use the instructor-provided non-production transaction environment for the executable portion.

## Safety Boundary

Never use Module 3 examples against:

- QSYS or system objects
- another public user's library
- an employer system without explicit authorization
- production/customer/patient data
- a table/file whose target resolution is uncertain

The learner must be able to state both the compile target and runtime target before native data-changing operations.