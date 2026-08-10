# Lesson 2.3 — Build the Coffee Catalog Schema

## Lesson Metadata

- **Module:** 2 — Db2 for i + SQL
- **Lesson:** 2.3
- **Estimated time:** 90 minutes
- **Prerequisites:** Lessons 2.1–2.2
- **Required tools:** VS Code, Db2 for IBM i extension
- **Required files:** `../code/sql/01_create_catalog.sql`
- **Sample application:** CATEGORY, PRODUCT, INVENTORY
- **Validation status:** source/static validated; execution validation pending
- **Target:** PUB400 IBM i 7.5 learner library

## Today's Coffee

A coffee recipe is easier to repeat when the cup size, coffee dose, water amount, and brew time are defined before the barista starts. Database design works the same way. DDL defines the shape and rules of data before applications depend on it.

## Learning Objectives

The learner can:

1. Explain the purpose of Data Definition Language (DDL).
2. Create a table with deliberate column names and data types.
3. Explain `NOT NULL`, `DEFAULT`, `PRIMARY KEY`, `UNIQUE`, `FOREIGN KEY`, and `CHECK` at an introductory level.
4. Choose character, integer, decimal, date, and timestamp types for the Coffee Catalog.
5. Read a complete CREATE TABLE statement before running it.
6. Verify that the intended objects were created in the intended schema.
7. Explain what the PRODUCT/INVENTORY keys do—and do not—enforce.

## Why This Matters

Weak database definitions push business rules into every program that touches the data. Strong definitions make invalid states harder to create and make application behavior easier to reason about.

For new development, the Academy prefers SQL DDL for relational database objects because it expresses data types, keys, constraints, defaults, and relationships explicitly. DDS remains important maintenance literacy and appears later when learners compare existing systems with newer designs.

## DDL Mental Model

DDL changes object definitions. Examples include:

- `CREATE`
- `ALTER`
- `DROP`
- `COMMENT`
- `LABEL`

Module 2 focuses on `CREATE TABLE`, then later introduces `CREATE VIEW` and `CREATE INDEX`.

## The Coffee Catalog

```text
CATEGORY
   1
   |
   | one category can have many products
   v
PRODUCT
   1
   |
   | zero or one inventory row per product is allowed by this schema
   v
INVENTORY
```

The foreign key on `INVENTORY.PRODUCT_ID` requires every inventory row to reference an existing product. Making that same column the INVENTORY primary key prevents more than one inventory row for the same product. These rules enforce **zero or one** inventory row per product—not “exactly one.” The Module 2 seed data intentionally supplies one inventory row for each of the five products.

This is intentionally small. The point is to understand relational structure, not to build the entire application in one module.

## SQL DDL Walkthrough

From `01_create_catalog.sql`:

```sql
create table YOURSCHEMA.CATEGORY (
    CATEGORY_ID    integer      not null,
    CATEGORY_NAME  varchar(40)  not null,
    ACTIVE         char(1)      not null default 'Y',
    constraint PK_CATEGORY primary key (CATEGORY_ID),
    constraint UQ_CATEGORY_NAME unique (CATEGORY_NAME),
    constraint CK_CATEGORY_ACTIVE check (ACTIVE in ('Y', 'N'))
);
```

### Read it in groups

| Section | Meaning |
|---|---|
| `create table YOURSCHEMA.CATEGORY` | Create the CATEGORY table in the explicitly named learner schema |
| `CATEGORY_ID integer not null` | Every category requires an integer identifier |
| `CATEGORY_NAME varchar(40) not null` | Names vary in length but cannot be absent |
| `ACTIVE char(1) ... default 'Y'` | One-character status with a default |
| `primary key` | The identifier must uniquely identify a row and cannot be null |
| `unique` | Category names cannot be duplicated in this model |
| `check` | Only the allowed status values are accepted |

## Data-Type Choices

### `INTEGER`

Use for whole numbers when the business domain fits. The training IDs and quantities use integers for clarity.

### `VARCHAR(n)`

Use for variable-length text up to a defined limit. Product names and SKUs have meaningful maximum lengths.

### `CHAR(n)`

Use when a fixed length is intentional. The training `ACTIVE` flag is a single character.

### `DECIMAL(p,s)`

Use exact decimal types for currency-like business values. `DECIMAL(9,2)` gives nine total digits, two after the decimal point.

### `DATE` and `TIMESTAMP`

Use date-aware types when the value represents a date or precise point in time. Avoid storing temporal values as arbitrary text.

## Naming and System Names

SQL names can be more descriptive than traditional 10-character IBM i system names. Db2 for i can maintain a system name for SQL-created objects when required by non-SQL interfaces. This module uses short object names so learners can focus on the relational model; later modules will revisit cross-interface naming.

## DDS Recognition

A DDS physical file can also define stored database data on IBM i. This lesson does not ask the learner to create DDS. The maintenance lesson is simply: when you encounter a physical file in an existing application, do not assume it lacks relational importance merely because it was not created with SQL.

## Guided Lab

1. Open `01_create_catalog.sql`.
2. Replace every `YOURSCHEMA` placeholder with the assigned learner library.
3. Before running anything, point out every table and constraint that will be created.
4. Run the three `CREATE TABLE` statements in order.
5. Run the catalog verification query.
6. Browse the objects with the Db2 for IBM i extension.
7. Record the object names and types.
8. Explain why the schema allows a PRODUCT row to exist before an INVENTORY row is added.

## IBM Bob-Assisted Activity

Ask Bob to review one CREATE TABLE definition for data types, nullability, and constraints. Do not let Bob rewrite the whole schema first.

For each suggestion, ask: **Which business rule does this protect?** If no business rule exists, the suggestion may be unnecessary.

## Independent Task

Add one new column to a scratch copy of a table definition—not the live table—and justify:

- name
- data type
- size/precision
- nullability
- default, if any

Do not ask Bob to choose the definition. After you finish, Bob may review it.

## Common Mistakes

- Running DDL before replacing `YOURSCHEMA`.
- Choosing data lengths from sample values instead of business limits.
- Using approximate numeric types for exact prices without understanding the tradeoff.
- Allowing NULL by accident.
- Creating a table without a key because the sample data happens to be unique.
- Assuming a foreign key in INVENTORY forces every PRODUCT to have an inventory row.
- Treating a successful CREATE as proof that the design is good.

## Pro Tips

- Read the entire DDL statement before execution, including constraints at the bottom.
- Name constraints so diagnostics are easier to understand.
- Prefer database-enforced rules for universal data integrity rules.
- Describe cardinality from what the constraints actually enforce, not only from what the sample rows happen to contain.
- Keep training DDL deterministic so reset/rebuild cycles are easy to reproduce.

## Manager's Perspective

Database design review should happen before application code hardens around a weak model. A five-minute conversation about nullability, key choice, or cardinality can prevent years of defensive logic across RPG, SQL, APIs, and reports.

## Knowledge Check

1. What does DDL change?
2. Why is `DECIMAL(9,2)` appropriate for a simple price example?
3. What does `NOT NULL` prevent?
4. Why would you name a constraint?
5. What is the difference between a column default and a value supplied explicitly by an INSERT?
6. What does the INVENTORY primary-key/foreign-key design enforce about the number of inventory rows per product?
7. Why does it not enforce that every product has an inventory row?
8. Why should the learner verify the created object through metadata after CREATE succeeds?
9. Why does the Academy prefer SQL DDL for new relational objects while still teaching DDS recognition?

## Completion Criteria

The learner creates CATEGORY, PRODUCT, and INVENTORY in the assigned schema, explains every major DDL clause, accurately states the PRODUCT/INVENTORY cardinality enforced by the schema, and verifies the objects independently.

## Final Sip

A good schema is like a good brew recipe: the definition carries the quality forward before anyone starts improvising.

## References

See M2-IBM-02, M2-IBM-03, M2-SUP-04, and M2-ENV-01 in the source register.
