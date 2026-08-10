# Module 3 IBM Bob Prompts

Bob is an engineering assistant, not runtime evidence. Never paste secrets, PHI, client/customer production data, tokens, private keys, or unrestricted dumps.

For each Bob activity record: prompt, verified fact, assumption, accepted/corrected/rejected suggestion, evidence, and one missed risk.

## 3.1 — Access models

> Compare native RPG record-level access and embedded SQL for this requirement. Identify the data-access shape, target assumptions, lock/transaction questions, and evidence needed. Do not recommend a rewrite solely because one style is newer.

## 3.2 — DCL-F

> Explain this DCL-F definition. Separate compile-time external-description resolution from runtime file resolution. Identify anything you cannot prove without the actual IBM i build/run environment.

## 3.3 — Keyed reads

> Trace this CHAIN or SETLL/READE flow. State which operation sets the status being tested, how the loop terminates, and where stale-record or infinite-loop risk exists. Do not invent keys not present in the file definition.

## 3.4 — Native changes

> Review this disposable native WRITE/UPDATE/DELETE sequence for target, key, constraint, lock, verification, and cleanup risks. Do not suggest authority expansion or ending another job.

## 3.5 — SELECT INTO

> Map each selected SQL column to its RPG host variable, checking type, size, nullability, one-row assumptions, and no-data behavior. Use the supplied DDL; do not invent the schema.

## 3.6 — Cursor

> Trace DECLARE/OPEN/FETCH/CLOSE. Identify first-fetch placement, no-data handling, stale-host-variable risk, and any SQL error that could be mistaken for end-of-data. Do not rewrite the whole program.

## 3.7 — Diagnostics

> Explain this captured SQLSTATE/SQLCODE and suggest verification steps using current Db2 for i documentation. Separate what the code proves from what requires job/schema/runtime evidence.

## 3.8 — Transactions

> Review this transaction plan for partial-failure cases, missing verification, and lock/recovery concerns. Do not claim that journaling or commitment control is active unless I provide direct environment evidence. Do not suggest broad authority as a shortcut.

## 3.9 — Engineering choice

> Compare these native and SQL implementations against the requirement. Discuss clarity, set orientation, target resolution, maintainability, locking/transaction concerns, diagnostics, and testability. Do not claim performance without measurements.

## Capstone

Bob may review a learner-completed statement or explain a captured diagnostic. Bob may not generate the complete capstone or fabricate compile/run evidence.

Independent requirement: learner closes Bob and explains compile/runtime file target, keyed-read termination, SQL no-data handling, cursor lifecycle, transaction preconditions, and the final access-style decision.