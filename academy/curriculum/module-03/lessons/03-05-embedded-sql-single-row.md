# Lesson 3.5 — Embedded SQL: Single-Row Access

## Metadata

- **Estimated time:** 90 minutes
- **Required source:** `05_sql_product_lookup.pgm.sqlrpgle`
- **Validation status:** source reviewed; SQL precompile/compile pending

## Learning Objectives

The learner can:

1. Recognize SQLRPGLE source and embedded `exec sql` statements.
2. Use RPG variables as SQL host variables.
3. Write/read a single-row `SELECT ... INTO`.
4. Handle success and no-data deliberately.
5. Explain why a query expected to return one row needs a uniqueness reason.
6. Verify SQL target qualification and compile action.

## Source Form

The file uses the SQL RPG source extension expected by the validated Code for IBM i workspace, for example:

`05_sql_product_lookup.pgm.sqlrpgle`

The build action must invoke the SQL RPG compile path rather than treating the source as plain RPGLE. Exact action/command behavior is a release/tooling validation gate.

## Host Variables

RPG variables become application inputs/outputs when prefixed with `:` inside SQL:

```rpgle
dcl-s productId int(10) inz(1001);
dcl-s productName varchar(80);
dcl-s price packed(9 : 2);

exec sql
    select PRODUCT_NAME, PRICE
      into :productName, :price
      from YOURSCHEMA.PRODUCT
     where PRODUCT_ID = :productId;
```

The SELECT list and INTO host variables must be compatible and in the intended order.

## Why One Row?

A static `SELECT INTO` is a single-row operation. The learner should be able to point to the primary key/unique condition that makes `PRODUCT_ID = :productId` a one-row-or-no-row question.

If a business query can legitimately return many rows, use a multi-row technique such as a cursor rather than hoping SELECT INTO behaves like a loop.

## No Data Is a Condition to Handle

A missing key is not automatically a program crash. After the SQL statement, the program checks SQL condition information and chooses an explicit path. The next lessons develop SQLSTATE/SQLCODE handling in more depth.

For this lesson the learner distinguishes:

- success — one product returned
- no data — product not found
- error — statement did not complete successfully

## Target Discipline

The Academy source uses a schema placeholder that the learner replaces in a controlled training copy/build path. Do not compile the same source against an ambiguous default schema and then assume the runtime target.

## Guided Lab

Compile and run:

- an existing PRODUCT_ID
- a missing PRODUCT_ID

For each record:

- expected SQL condition
- expected product values or unchanged/default output
- actual SQLSTATE/SQLCODE evidence
- run result

## Bob-Assisted Activity

Ask Bob to map SELECT columns to host variables and identify type/length/null risks. Do not let Bob invent table definitions; compare its assumptions to the actual Module 2 DDL.

## Independent Task

Without Bob, add one more selected column that is NOT NULL in the Module 2 schema, add a compatible RPG host variable, and explain the mapping before compiling.

## Completion Criteria

The learner compiles a SQLRPGLE program, retrieves one uniquely identified row through host variables, and distinguishes success, no-data, and error paths.