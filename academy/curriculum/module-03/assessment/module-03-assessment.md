# Module 3 Assessment — Files + Data Access

**Passing standard:** 80% plus capstone and no critical safety failure  
**AI:** no solution generation; Bob review allowed only after the learner submits an initial answer

## Part A — Concepts — 20 points

1. **4 points:** Explain the difference between `EXTDESC` and runtime file resolution in the Academy DCL-F pattern.
2. **4 points:** What does `CHAIN` attempt to do, and what evidence should the learner check afterward?
3. **4 points:** What does `SETLL` do differently from `READE`?
4. **4 points:** Why is a single-row `SELECT INTO` appropriate for a primary-key lookup but not an arbitrary many-row query?
5. **4 points:** Explain why native I/O and embedded SQL can both be valid in a modern IBM i application.

## Part B — Read and Reason — 20 points

6. **5 points:** A READE loop never performs another READE inside the loop. Identify the defect/risk.
7. **5 points:** A cursor FETCH returns no data. What must the program avoid doing with its host variables?
8. **5 points:** An SQL program receives a negative SQLCODE. Why is treating it as cursor end-of-data unsafe?
9. **5 points:** A program compiled successfully using one external file definition. What does that fail to prove about runtime target and business correctness?

## Part C — Safety / Operations — 20 points

10. **5 points:** A second session cannot update a record you just read for update. List the evidence you would gather before taking action.
11. **5 points:** Transaction preflight cannot prove the order files are journaled. What should the learner do?
12. **5 points:** Bob says `ROLLBACK` makes an UPDATE safe. Explain why that statement is incomplete.
13. **5 points:** A native DELETE fails because child records exist. A developer suggests removing the foreign key. Explain the correct response.

## Part D — Practical — 40 points

14. **10 points:** Write/complete a native keyed lookup for one order header, including explicit found/not-found handling.
15. **10 points:** Write/complete a partial-key SETLL/READE loop that counts lines for one order and terminates correctly.
16. **8 points:** Write an embedded SQL primary-key SELECT INTO and describe success/no-data/error behavior.
17. **8 points:** Given a cursor skeleton, place OPEN/FETCH/test/FETCH/CLOSE in a safe sequence and explain the end condition.
18. **4 points:** Write a transaction decision table for header + line creation with one success and two failure points. State expected database state after rollback.

## Required Defense

Instructor asks one native-I/O question, one embedded-SQL question, one lock/transaction question, and one access-choice question without Bob open.

## Critical Failure Conditions

- wrong/unknown target accepted without stopping
- destructive action against non-disposable/shared data
- authority escalation used as first-line troubleshooting
- transaction exercise run without validated prerequisites
- lock cleared by harming another user's work
- AI answer submitted without learner understanding

Learner: ____________________  Date: ____________________