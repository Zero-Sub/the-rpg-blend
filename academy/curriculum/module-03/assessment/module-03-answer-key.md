# Module 3 Assessment — Instructor Answer Key

**Instructor only**  
**Status:** conceptual key complete; executable examples require target validation

## Part A

1. `EXTDESC` identifies the external file used to obtain the external description at compile time. Runtime resolution is controlled separately; the Academy training pattern uses `EXTFILE(*EXTDESC)` to intentionally open the same identified file at runtime.
2. CHAIN performs a keyed retrieval attempt. Check file-specific `%FOUND` and then use returned fields only on the found path.
3. SETLL positions the keyed file at a lower-limit location; READE retrieves the next record equal to the specified key and establishes EOF when no equal record can be returned.
4. SELECT INTO expects a one-row result shape. A PK equality predicate supports one-or-none. A many-row requirement needs a cursor or other appropriate multi-row technique.
5. Both are supported Db2 for i access approaches. Choice depends on existing contracts, access shape, clarity, relationships, locks/transactions, diagnostics, testing, and evidence—not labels such as legacy/modern.

## Part B

6. The program can loop forever or repeatedly process the same current record because it never advances the file/read state.
7. Do not process the previous/stale host-variable values as a new row.
8. Negative SQLCODE represents an unsuccessful SQL execution, not normal +100 no-data. Stop/handle error and capture diagnostics.
9. Compile proves the compiler found a compatible external description and accepted source. It does not prove runtime resolution, authority, correct business data, expected locks, or result correctness.

## Part C

10. Identify current job/session, target file/key, operation used to obtain record, lock owner/state using approved tooling, whether commitment control is active, transaction status, expected duration, and approved recovery path. Do not kill a job casually.
11. Stop executable transaction work and follow the alternate environment/design-evidence path. Do not create journals or request broad authority merely to pass the lab.
12. Rollback affects changes that actually participate in commitment control. Journaling, commitment context/scope, compile/runtime options, and current transaction state must be proven.
13. Keep the FK and determine whether the delete order is wrong or child data should legitimately remain. The constraint is protecting referential integrity.

## Part D Representative Guidance

14. Expect a schema-specific DCL-F plus `chain key OHDRR; if %found(ORDHDR); ... else; ... endif;`. Equivalent validated forms accepted.
15. Expect `setll (orderId) OLINER; reade (orderId) OLINER; dow not %eof(ORDLINE); ...; reade (orderId) OLINER; enddo;` or a technically equivalent verified pattern.
16. SELECT columns INTO compatible host variables with a unique-key predicate. Handle 0, +100/no data, and errors distinctly.
17. DECLARE, OPEN, first FETCH, test/process while success, next FETCH, distinguish +100 from other conditions, CLOSE.
18. Full credit identifies business unit header + lines and states that every failure before commit should leave none of that disposable transaction after rollback in a properly configured transaction environment.

## Overall

Score 80+ plus lab, defense, and safety gates. Never use numeric score to waive a critical safety failure.