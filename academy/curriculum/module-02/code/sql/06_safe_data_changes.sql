-- The RPG Blend Academy
-- Module 2: Db2 for i + SQL
-- Lesson 2.8 practice
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- Replace YOURSCHEMA before running.
-- Run statements one at a time. Predict and verify the target set before each change.

-- PREVIEW: prove the temporary key is not already present.
select PRODUCT_ID, SKU, PRODUCT_NAME
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
   or SKU = 'LAB-TEMP-01';

-- INSERT: create one disposable training row.
insert into YOURSCHEMA.PRODUCT
    (PRODUCT_ID, CATEGORY_ID, SKU, PRODUCT_NAME, ROAST_LEVEL, PRICE, ACTIVE, INTRO_DATE)
values
    (2999, 20, 'LAB-TEMP-01', 'Temporary Lab Brewer', null, 19.95, 'Y', current_date);

-- VERIFY the insert before doing anything else.
select PRODUCT_ID, SKU, PRODUCT_NAME, PRICE, ACTIVE
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999;

-- PREVIEW the exact row that the update predicate should target.
select PRODUCT_ID, SKU, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';

-- UPDATE one disposable row.
update YOURSCHEMA.PRODUCT
set PRICE = 21.95,
    PRODUCT_NAME = 'Temporary Lab Brewer - Revised'
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';

-- VERIFY the update.
select PRODUCT_ID, SKU, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999;

-- PREVIEW the delete target. The expected row count is exactly 1.
select PRODUCT_ID, SKU, PRODUCT_NAME
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';

-- DELETE only the disposable row.
delete from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
  and SKU = 'LAB-TEMP-01';

-- VERIFY cleanup. Expected result: zero rows.
select PRODUCT_ID, SKU, PRODUCT_NAME
from YOURSCHEMA.PRODUCT
where PRODUCT_ID = 2999
   or SKU = 'LAB-TEMP-01';

-- Safety exercise, DO NOT RUN:
-- update YOURSCHEMA.PRODUCT set PRICE = PRICE * 1.10;
-- Explain why a syntactically valid statement with no WHERE clause is dangerous.
-- Module 3 will teach commitment control and transaction behavior in context.
