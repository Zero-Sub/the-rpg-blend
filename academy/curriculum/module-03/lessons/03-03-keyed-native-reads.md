# Lesson 3.3 — Keyed Native Reads

## Metadata

- **Estimated time:** 90 minutes
- **Required sources:** `03_native_header_lookup.pgm.rpgle`, `03_native_line_scan.pgm.rpgle`
- **Validation status:** source reviewed; runtime validation pending

## Learning Objectives

Use `CHAIN` for direct keyed lookup; test with `%FOUND(file)`; explain `SETLL`; use `READE` and `%EOF`; use a partial key deliberately; predict record counts before execution.

## Direct Lookup

```rpgle
chain lookupOrder OHDRR;
if %found(ORDHDR);
    // current header fields are valid for the found record
else;
    // explicit not-found path
endif;
```

The learner is making a one-record claim and must test the relevant file status before using returned data.

## Positioned Equal-Key Reads

`ORDER_LINES` has SQL primary key `(ORDER_ID, LINE_NO)`. Native `ORDLINE` therefore has a keyed order whose leading key is ORDER_ID. Module 3 uses ORDER_ID as a partial search key:

```rpgle
setll (lookupOrder) OLINER;
reade (lookupOrder) OLINER;

dow not %eof(ORDLINE);
    lineCount += 1;
    reade (lookupOrder) OLINER;
enddo;
```

`SETLL` positions. `READE` retrieves the next record equal to the specified search argument. When no equal record can be returned, the EOF condition is set for the read. Runtime validation will confirm the external key metadata and result counts.

## Expected Static Seed Counts

- 5001 → 1 line
- 5002 → 1 line
- 5003 → 2 lines
- missing order → 0

These are static expectations from `11_seed_orders.sql`, not runtime proof.

## File-Specific Status

Use `%FOUND(ORDHDR)` and `%EOF(ORDLINE)` in teaching examples so another file operation cannot silently make the learner reason about the wrong status.

## Bob Activity

Ask Bob to trace which operations set the status being tested and identify stale-record/infinite-loop risk. Validate the claims against current RPG documentation and actual execution.

## Independent Task

Test one missing header and one multi-line order in a disposable source copy. Predict before running.

## Common Mistakes

- treating SETLL as a retrieval
- forgetting the next READE
- processing fields after end-of-data
- assuming line existence merely because a header exists
- adding DISTINCT/SQL thinking to a native key problem without understanding the access path

## Completion Criteria

Learner demonstrates found/not-found and equal-key loop behavior and explains partial-key/termination evidence.