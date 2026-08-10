# Module 2 Assessment — Instructor Answer Key

**Instructor-only source**  
**Validation status:** source/static validated; practical output validation on PUB400 pending

## Part A — Knowledge and Terminology — 20 points

### 1 — 2 points

**Correct:** C.

Db2 for i is the database manager integrated with IBM i. SQL is a language/interface for defining and working with relational data. A is incorrect because the course source basis treats Db2 for i as integrated rather than an unrelated optional server. B confuses a database manager with a language. D is false because Db2 for i supports SQL access from multiple interfaces and languages.

**Objective:** 1.

### 2 — 3 points

Expected answer: A schema is a useful SQL namespace counterpart to a library for database work, but an IBM i library can contain many IBM i object types beyond relational SQL objects. The mapping helps communication but should not erase platform-specific behavior.

Accept equivalent wording.

**Objective:** 2–3.

### 3 — 2 points

**Correct:** C — `ROAST_LEVEL is null`.

NULL represents absence of a value and uses `IS NULL` / `IS NOT NULL` tests.

**Objective:** 6.

### 4 — 3 points

Expected: It prevents a PRODUCT row from referring to a category key that does not exist in CATEGORY, protecting the parent/dependent relationship from orphan product rows.

**Objective:** 6.

### 5 — 2 points

**Correct:** B — request result ordering.

**Objective:** 5.

### 6 — 4 points

Expected elements:

- `DEFAULT 'Y'`: supplies `Y` when the insert omits the column and the default applies.
- `NOT NULL`: prevents absence/NULL for ACTIVE.
- `CHECK (ACTIVE in ('Y','N'))`: limits non-null stored values to the allowed domain.

Partial credit: roughly 1 point per accurate definition plus 1 point for explaining that the three rules solve different problems.

**Objective:** 6.

### 7 — 4 points

Expected: Result grain defines what one result row represents, such as one product, one category, or one whole selected set. Stating the grain helps detect grouping or join mistakes and prevents the developer from interpreting a category-level metric as product-level data or vice versa.

**Objective:** 8.

## Part B — SQL Reading — 20 points

### 8 — 4 points

Expected: The query returns categories containing at least two active products, with a count of those active products, ordered by count descending and category name as a tie-breaker.

### 9 — 4 points

Expected:

- WHERE removes non-active product rows before grouping.
- HAVING removes grouped categories whose active-product count is less than two.

### 10 — 4 points

Expected: one row per qualifying category.

### 11 — 4 points

Expected: Without the relationship predicate, products and categories can be combined into unrelated pairs, multiplying rows (Cartesian-product behavior) and corrupting counts/totals. The exact row count depends on source rows.

### 12 — 4 points

Expected: inspect join predicates, relationship cardinality, uniqueness assumptions, duplicate source data, and whether the business relationship legitimately produces multiple rows. `DISTINCT` should not be used to conceal an unexplained multiplication problem.

## Part C — Safety and Troubleshooting — 20 points

### 13 — 5 points

Full-credit response: stop before UPDATE; verify the schema, data, key assumptions, and predicate; determine why two rows qualify; revise the plan only after the intended target is unambiguous. Do not simply add an arbitrary predicate to force one row.

### 14 — 5 points

Expected: keep the foreign key; determine whether the category ID is wrong or the required parent row has not been created. The constraint is correctly protecting referential integrity. Removing it to make an invalid test pass weakens the model.

### 15 — 5 points

Expected: No. Five rows are inadequate for a meaningful production claim. Need relevant data volume/distribution, representative query workload, optimizer/access-plan evidence (for example Visual Explain), repeatable timings/metrics, and consideration of index maintenance cost and other access paths.

### 16 — 5 points

Any four or more, well explained:

- correct host/system
- correct user/profile
- correct schema/library
- correct table
- business requirement
- exact WHERE predicate
- preview SELECT result set
- expected row count
- constraints/side effects
- verification query
- journaling/commitment-control/rollback context where applicable
- cleanup or recovery plan
- required approval/change-control context

## Part D — Practical SQL — 40 points

Use the learner's actual schema name in place of `<schema>`.

### 17 — 8 points

Representative solution:

```sql
select SKU, PRODUCT_NAME, PRICE
from <schema>.PRODUCT
where ACTIVE = 'Y'
  and PRICE < 16.00
order by PRICE, SKU;
```

Expected base result count: 3.

Expected products:

- RPG Blend Logo Mug — 12.00
- Morning Blend 12 oz — 14.95
- House Decaf 12 oz — 15.95

Scoring:

- target/columns 2
- filters 2
- ordering 2
- prediction/evidence 2

### 18 — 8 points

Representative solution:

```sql
select P.PRODUCT_NAME,
       C.CATEGORY_NAME,
       I.QTY_ON_HAND,
       I.REORDER_POINT
from <schema>.PRODUCT P
join <schema>.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID
join <schema>.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID
where I.QTY_ON_HAND <= I.REORDER_POINT
order by P.PRODUCT_ID;
```

Relationships:

- PRODUCT.CATEGORY_ID → CATEGORY.CATEGORY_ID
- INVENTORY.PRODUCT_ID → PRODUCT.PRODUCT_ID

Cardinality explanation required for full credit: the INVENTORY primary key allows at most one inventory row for a product, and its foreign key requires every inventory row to reference a product. The schema does not require every product to have inventory. The base seed data happens to include one inventory row for every product.

Expected base row count: 2.

Expected products:

- House Decaf 12 oz
- Pour Over Starter Kit

### 19 — 8 points

Representative solution:

```sql
select C.CATEGORY_NAME,
       sum(I.QTY_ON_HAND) as TOTAL_ON_HAND
from <schema>.CATEGORY C
join <schema>.PRODUCT P
  on P.CATEGORY_ID = C.CATEGORY_ID
join <schema>.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID
group by C.CATEGORY_NAME
having sum(I.QTY_ON_HAND) < 30
order by C.CATEGORY_NAME;
```

Expected grain: one row per qualifying category.

Expected results:

- Equipment — 5
- Merchandise — 26

### 20 — 6 points

Accept any safe statement targeting an actual defined constraint. Representative foreign-key negative test:

```sql
insert into <schema>.PRODUCT
    (PRODUCT_ID, CATEGORY_ID, SKU, PRODUCT_NAME, PRICE)
values
    (9001, 9999, 'BAD-FK-01', 'Invalid Category Test', 10.00);
```

Expected rejection: foreign key, because category 9999 does not exist.

Do not award full credit for mere syntax errors or targeting a different schema.

### 21 — 10 points

Score the evidence chain rather than requiring a single identifier. Full credit requires:

- unused-key/SKU preview
- explicit INSERT column list
- post-insert verification
- exact one-row UPDATE preview
- narrow UPDATE
- post-update verification
- exact one-row DELETE preview
- narrow DELETE
- zero-row final verification
- learner explains the sequence and stops on any unexpected preview count

Deduct substantially if the learner changes a permanent seed row rather than a disposable row. A DELETE performed without the required target preview does not satisfy the Module 2 safety workflow even if it deletes the intended row.

## Capstone and Overall Passing

Recommended module weighting:

| Component | Weight |
|---|---:|
| Written/SQL assessment | 40% |
| Module capstone lab | 50% |
| Instructor defense / professional judgment | 10% |

The assessment document's 100-point internal score can be normalized to the 40% component.

Passing requires:

- at least 80% on knowledge/practical assessment
- successful capstone
- no unresolved critical safety failure
- independent explanation of the submitted work

## AI Review Guidance

If the learner used Bob during permitted review portions, require the prompt/output disposition record. Award no credit for an answer the learner cannot explain, even if the SQL happens to be correct.
