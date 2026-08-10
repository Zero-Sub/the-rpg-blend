# The RPG Blend Academy — Module 3 Learner Workbook

## Files + Data Access

**Status:** development workbook; runtime evidence fields intentionally blank

Use this workbook to record predictions and actual evidence. Do not enter credentials, PHI, customer production data, private keys, tokens, or unrestricted dumps.

## Environment Record

| Item | Learner record |
|---|---|
| Host / connection | |
| User profile | |
| Learner schema/library | |
| Build library | |
| Branch / commit | |
| Code for IBM i version | |
| Db2 for IBM i version | |
| IBM i release | |

## Prerequisite Proof

| Module 2 object | Expected state | Actual evidence |
|---|---|---|
| CATEGORY | Exists | |
| PRODUCT | Exists, base data reconciled | |
| INVENTORY | Exists, base data reconciled | |

---

# 3.1 — Two Access Models

For each requirement choose **native**, **SQL**, or **either/mixed**, then explain why.

| Requirement | Choice | Reason / evidence needed |
|---|---|---|
| One order by known key | | |
| Low inventory across product + inventory | | |
| Update one known disposable order | | |
| Category inventory totals | | |

Bob assumption you rejected or narrowed:

>

---

# 3.2 — DCL-F

Annotate the training definition:

| Element | My explanation |
|---|---|
| ORDHDR | |
| USAGE | |
| KEYED | |
| EXTDESC | |
| EXTFILE(*EXTDESC) | |

Compile-time external file: ____________________  
Runtime external file strategy: ____________________  
Build library/program: ____________________

Compile expected: __________  Actual: __________

---

# 3.3 — Keyed Native Reads

## CHAIN

| Test | Key | Expected found? | Actual | Evidence |
|---|---:|---|---|---|
| Existing header | 5001 | Yes | | |
| Missing header | | No | | |

What operation's status is `%FOUND(ORDHDR)` testing?

>

## SETLL / READE

| Order | Expected lines | Actual lines | Final condition evidence |
|---|---:|---:|---|
| 5001 | 1 | | |
| 5003 | 2 | | |
| missing | 0 | | |

Why must the next READE occur inside the loop?

>

---

# 3.4 — Native Changes and Locks

Disposable order key: __________

| Step | Expected | Actual / evidence |
|---|---|---|
| Pre-CHAIN | Not found | |
| WRITE | 1 disposable header | |
| Verify WRITE | Found / NEW | |
| UPDATE | READY | |
| Verify UPDATE | READY | |
| DELETE | Removed | |
| Final CHAIN | Not found | |

Lock observation performed? yes / no / alternate discussion: __________

What would make you stop rather than force a lock-related operation?

>

---

# 3.5 — SELECT INTO

Product ID: __________

| Host variable | SQL column | Type/null concern |
|---|---|---|
| productId | | |
| productName | | |
| price | | |

Existing-key expected condition: __________  Actual: __________  
Missing-key expected condition: __________  Actual: __________

What schema rule makes the lookup one-row-or-none?

>

---

# 3.6 — Cursor

Write the lifecycle from memory:

1. __________
2. __________
3. __________
4. __________

Base low-inventory expected rows: __________  Actual: __________

What prevents stale host variables from being processed after the final FETCH?

>

---

# 3.7 — Diagnostics

| Scenario | SQLSTATE | SQLCODE | ROW_COUNT / message | My interpretation |
|---|---|---:|---|---|
| SELECT success | | | | |
| SELECT no data | | | | |
| Cursor end | | | | |
| Controlled constraint error | | | | |

Which value did Bob explain, and what IBM/runtime evidence verified it?

>

---

# 3.8 — Transaction Preflight

| Requirement | Confirmed? | Evidence / alternate path |
|---|---|---|
| Journaled files | | |
| Commitment control method | | |
| Commit setting | | |
| Normal authority sufficient | | |
| Cleanup/recovery plan | | |

If any item is unknown, execution decision: **STOP / ALTERNATE ENVIRONMENT**

Positive transaction expected final state:

>

Failure + rollback expected final state:

>

Actual execution evidence (only if approved environment):

>

---

# 3.9 — Engineering Choice

Requirement: display one order header and all lines with product name and quantity on hand.

My access choice: ____________________

- data shape:
- target resolution:
- expected cardinality:
- errors:
- locks/transactions:
- tests:
- performance evidence available/not available:

Bob review disposition:

>

---

# 3.10 — Capstone

- [ ] Module 2 prerequisite proven
- [ ] Order objects created and metadata verified
- [ ] Native CHAIN tested
- [ ] Native keyed line scan tested
- [ ] Disposable native change tested/cleaned
- [ ] SQL SELECT INTO tested
- [ ] Cursor tested
- [ ] Diagnostic captured
- [ ] Transaction preflight completed
- [ ] Approved transaction/alternate path completed
- [ ] Git diff/status reviewed
- [ ] Bob evidence recorded
- [ ] Independent defense completed
- [ ] Module 3 cleanup proven where required

## Final Reflection

What is the biggest difference between “the program compiled” and “the data access is proven correct”?

>

Learner: ____________________  Reviewer: ____________________  Date: ____________________