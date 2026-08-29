# Lesson 2.9 — Views, Indexes, and the Next Layer

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.9
- **Estimated time:** 60 minutes
- **Prerequisites:** Lessons 2.5–2.8
- **Required file:** `../code/sql/07_views_and_indexes.sql`
- **Validation status:** source reviewed; execution validation pending

## Today's Coffee

A café menu is a curated view of a much larger operation. Customers do not need the supplier invoice, storage-bin map, and every recipe detail to order a drink. A database view can present a useful relational shape without copying all underlying data.

## Learning Objectives

The learner can:

1. Explain what an SQL view is.
2. Explain that a normal view is a named query definition rather than a copied data table.
3. Create and query a simple view.
4. Explain the introductory purpose of an index.
5. Avoid promising that a specific index will automatically improve a query.
6. Distinguish a logical business interface from a physical access aid.
7. Explain what Module 3 will add to this database knowledge.

## Why This Matters

Views can give applications and users a stable, purposeful interface to data. Indexes can support efficient access paths. They solve different problems.

Confusing them leads to bad design conversations: a view is not primarily a performance object, and an index is not a place to centralize business presentation logic.

## Views

IBM describes a view as a named specification of a result table. The underlying SELECT is effectively used when the view is referenced.

Module 2 creates:

```sql
create view YOURSCHEMA.ACTIVE_PRODUCT_SUMMARY as
    select P.PRODUCT_ID,
           P.SKU,
           P.PRODUCT_NAME,
           C.CATEGORY_NAME,
           P.PRICE,
           I.QTY_ON_HAND,
           I.REORDER_POINT
    from YOURSCHEMA.PRODUCT P
    join YOURSCHEMA.CATEGORY C
      on C.CATEGORY_ID = P.CATEGORY_ID
    join YOURSCHEMA.INVENTORY I
      on I.PRODUCT_ID = P.PRODUCT_ID
    where P.ACTIVE = 'Y';
```

The view centralizes:

- the category/product relationship
- the product/inventory relationship
- the active-product filter
- a selected set of columns

It does **not** automatically become a separate copy of every row.

## Query the View

```sql
select SKU,
       PRODUCT_NAME,
       CATEGORY_NAME,
       PRICE,
       QTY_ON_HAND
from YOURSCHEMA.ACTIVE_PRODUCT_SUMMARY
order by CATEGORY_NAME, SKU;
```

A consumer can ask a simpler question without rewriting the joins every time.

## View Design Caution

A view is still an interface decision. Ask:

- What business meaning does it represent?
- Which columns should consumers see?
- Which filters are universal versus use-case-specific?
- Are consumers depending on a stable contract?
- Are updates through the view expected or should it be treated as read-oriented?

Module 2 does not explore every updatable-view rule.

## Indexes

An index defines keys that Db2 for i can use as an access path for ordering, grouping, joining, and retrieval decisions.

The training example:

```sql
create index YOURSCHEMA.IX_PRODUCT_CATEGORY
    on YOURSCHEMA.PRODUCT (CATEGORY_ID);
```

This makes an access path available on the category key. It does **not** prove that the optimizer will use it for every query or that performance will improve measurably in a five-row training table.

## Why the Lesson Does Not Benchmark Five Rows

Performance claims require realistic workload, data volume, optimizer evidence, and repeatable measurement. A tiny training table is useful for syntax and object concepts but not for proving production index value.

Later Academy material covers Visual Explain, access plans, index advice, and performance review in a more appropriate context.

## Native Recognition

Existing IBM i applications may use logical files and keyed logical files to provide derived views and access paths. The terms can help bridge understanding, but do not automatically replace every logical file with an SQL view or every keyed logical file with a simple index without analyzing behavior.

## Guided Practice

1. Run `07_views_and_indexes.sql` after verifying `YOURSCHEMA`.
2. Browse the created view and index in the database tooling.
3. Query the view.
4. Explain which logic moved behind the view name.
5. Explain what data still lives in the base tables.
6. State what evidence would be needed before claiming the index improved a real workload.

## IBM Bob-Assisted Activity

Ask Bob to explain the view's contract and the index's possible role. Reject answers that claim:

- the view stores an independent duplicate copy of all result rows
- the index guarantees faster execution
- the index changes the business content of PRODUCT

## Independent Task

Without Bob, write a short design note answering:

1. When would a view improve maintainability for the Coffee Catalog?
2. What would make a view too broad or unstable as an application interface?
3. What evidence would you require before approving a new production index?

## Common Mistakes

- Treating a view as a copied table.
- Assuming every view is automatically updateable.
- Creating indexes by habit rather than workload evidence.
- Assuming more indexes are always better.
- Using a view to hide an incorrect underlying data model.
- Claiming a performance improvement from a tiny lab dataset.

## Pro Tips

- Name views for the business shape they expose, not the internal query technique.
- Keep interface stability in mind when applications depend on a view.
- Treat indexes as optimizer/access-path tools that have maintenance cost as data changes.
- Use performance evidence rather than folklore.

## Manager's Perspective

Views can reduce duplicated SQL and create clearer integration boundaries. Indexes can improve important workloads but also add maintenance overhead. Teams need design standards for both so developers do not create permanent database objects as local fixes without review.

## Knowledge Check

1. What is an SQL view?
2. Does a normal view automatically duplicate all result data?
3. What does an index provide to Db2 for i?
4. Does creating an index guarantee that the optimizer will use it?
5. Why is a five-row table poor evidence for a performance claim?
6. How can a view improve application maintainability?
7. Why should logical-file modernization be analyzed rather than mechanically converted?

## Completion Criteria

The learner creates and queries the training view and index, explains their different purposes, and refuses unsupported performance claims.

## Final Sip

A menu and a grinder both help the café run, but they solve different problems. Good database design keeps interfaces and access paths just as distinct.

## References

See M2-IBM-05, current IBM Db2 for i index documentation, M2-SUP-01, and M2-SUP-03 in the source register.
