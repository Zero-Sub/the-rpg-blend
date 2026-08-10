# Module 3 Transaction Preflight

## Purpose

Lesson 3.8 teaches commitment control without pretending every training environment is prepared for transactions.

A COMMIT or ROLLBACK is meaningful only for changes that are actually operating under commitment control. Journal and commitment-definition requirements are platform/environment concerns, not syntax decorations.

## Gate A — Environment Evidence

Before running the transaction program, record:

- IBM i host: `____________`
- library/schema: `____________`
- user profile: `____________`
- journaled order tables confirmed: yes / no
- journal and receiver identified by instructor/admin: `____________`
- commitment-control start method confirmed: `____________`
- commitment scope confirmed: `____________`
- isolation/commit setting for SQLRPGLE program confirmed: `____________`
- authority sufficient under normal learner role: yes / no

Do not record secrets.

## Gate B — Allowed Outcome

Proceed with executable transaction testing only when all prerequisites are confirmed by direct evidence or an instructor/admin-provided environment record.

If any prerequisite is unknown or unavailable:

1. stop before data-changing transaction code
2. do not request special authority as a shortcut
3. complete the transaction design, expected-result matrix, and error-path reasoning
4. review the provided instructor execution evidence
5. perform the live exercise later on an approved journaled non-production IBM i

That alternate path is an intentional Academy safety feature, not a failed lab.

## What Must Be Demonstrated in a Validated Environment

The transaction scenario changes an order header and one or more order lines as one business unit.

Positive path:

1. prove initial state
2. start/use the approved commitment context
3. insert the order header
4. insert the order line(s)
5. verify intermediate state is within the current transaction
6. COMMIT
7. verify the committed order

Failure path:

1. begin from a clean state
2. insert the header
3. force a controlled line failure that does not require corrupting production-like data
4. detect the SQL condition
5. ROLLBACK
6. prove neither partial header nor line remains from that unit of work

## Lock Observation

If the instructor environment permits a two-session lock demonstration, it must be deliberately coordinated and time-bounded. Learners should observe what a blocked/conflicting access attempt looks like, then release the transaction promptly.

Do not create artificial long-held locks on shared public systems.

## Validation Note

Exact commands, journal names, commitment scope, SQL commit option, and lock behavior are recorded during target validation. Learner-facing publication must not hard-code environment-specific values until that validation is complete.