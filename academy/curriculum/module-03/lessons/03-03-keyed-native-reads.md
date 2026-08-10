# Lesson 3.3 — Keyed Native Reads

## Metadata

- **Estimated time:** 90 minutes
- **Required sources:** `03_native_lookup.pgm.rpgle` plus Module 3 seed data
- **Validation status:** source reviewed; runtime validation pending

## Learning Objectives

The learner can:

1. Use `CHAIN` for a direct keyed lookup.
2. Test the lookup with `%FOUND(file)`.
3. Explain `SETLL` as positioning rather than record retrieval.
4. Use `READE` to read records equal to a key and stop correctly.
5. Explain the role of `%EOF` for read operations.
6. Predict record counts before executing a keyed-read loop.

## Direct Lookup with CHAIN

A direct keyed lookup should begin with the key and expected outcome:

```rpgle
orderId = 5001;
chain orderId ORDHDR;

if %found(ORDHDR);
    // use externally described fields
else;
    // explicit not-found path
endif;
```

The important behavior is not the number of characters typed. The developer has made a claim: a record with this key either exists or does not. `%FOUND(ORDHDR)` provides file-specific status evidence for the relevant operation.

## Positioned Reads with SETLL and READE

For a keyed group, the pattern is different:

```rpgle
setll orderId ORDLINE;
reade orderId ORDLINE;

dow not %eof(ORDLINE);
    // process current line
    reade orderId ORDLINE;
enddo;
```

`SETLL` positions the file. `READE` retrieves records whose key equals the search argument. `%EOF` becomes the loop termination evidence after the read reaches the end/equal-key boundary.

During validation we will prove the exact record counts for each seeded order and ensure the loop cannot continue with stale field values after end-of-data.

## Why File-Specific BIFs Matter

In a program with more than one file, `%FOUND` or `%EOF` without a file parameter can invite ambiguity because another relevant operation may have set the global status. Module 3 examples prefer the file parameter when teaching database I/O.

## Relationship vs Access Path

A key enables an access pattern. It does not by itself explain the business relationship. Before reading order lines by order ID, the learner should be able to say:

> ORDER_LINE belongs to ORDER_HEADER through ORDER_ID, and the order-line primary key begins with ORDER_ID.

That explanation comes from the data model, not from `READE` syntax.

## Guided Lab

Run lookup cases after compile validation:

- existing order ID
- missing order ID
- order with one line
- order with multiple lines

For each case record:

- key
- expected found/not-found
- expected line count
- actual found status
- actual line count
- final `%EOF` state

## Bob-Assisted Activity

Ask Bob to trace the native-read flow and identify possible infinite-loop or stale-data mistakes. Require it to explain what operation changes `%FOUND` and what operations affect `%EOF`; verify those claims against current RPG documentation.

## Independent Task

Without Bob, change only the lookup key in a disposable copy of the example to test one missing order and one order with multiple lines. Predict both outcomes before execution.

## Common Mistakes

- Treating `SETLL` as if it returned a record.
- Checking `%FOUND` after a sequence where another operation has changed the status.
- Forgetting to issue the next `READE` inside the loop.
- Assuming every header has at least one line without checking model/rules.
- Using a record value after end-of-data without proving it is current.

## Completion Criteria

The learner can perform and explain a keyed single-record lookup and a keyed equal-record loop, including not-found/end-of-data behavior and expected record counts.