-- The RPG Blend Academy
-- Module 2: Db2 for i + SQL
-- Lesson 2.5 practice
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- Replace YOURSCHEMA before running.

-- 1. Explicit columns. Predict five rows before execution.
select PRODUCT_ID, SKU, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT
order by PRODUCT_ID;

-- 2. Filter a set. Predict which products satisfy the price test.
select SKU, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT
where PRICE >= 15.00
order by PRICE desc, SKU;

-- 3. Use an expression and an alias.
select SKU,
       PRODUCT_NAME,
       PRICE,
       decimal(PRICE * 1.0925, 9, 2) as PRICE_WITH_SAMPLE_TAX
from YOURSCHEMA.PRODUCT
order by PRICE_WITH_SAMPLE_TAX desc;

-- 4. NULL requires IS NULL, not = NULL.
select SKU, PRODUCT_NAME, ROAST_LEVEL
from YOURSCHEMA.PRODUCT
where ROAST_LEVEL is null
order by SKU;

-- 5. Limit exploratory output when a result can be larger than needed.
select PRODUCT_ID, PRODUCT_NAME, PRICE
from YOURSCHEMA.PRODUCT
order by PRODUCT_ID
fetch first 3 rows only;

-- Independent task starter:
-- Return SKU, PRODUCT_NAME, and PRICE for active products cheaper than 16.00.
-- Sort from lowest to highest price, then by SKU.
