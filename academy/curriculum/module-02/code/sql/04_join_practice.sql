-- The RPG Blend Academy
-- Module 2: Db2 for i + SQL
-- Lesson 2.6 practice
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- Replace YOURSCHEMA before running.

-- 1. Products with their category names.
select P.PRODUCT_ID,
       P.SKU,
       P.PRODUCT_NAME,
       C.CATEGORY_NAME,
       P.PRICE
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID
order by P.PRODUCT_ID;

-- 2. Products with current inventory.
select P.SKU,
       P.PRODUCT_NAME,
       I.QTY_ON_HAND,
       I.REORDER_POINT
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID
order by P.SKU;

-- 3. Three-table join: category, product, and inventory.
select C.CATEGORY_NAME,
       P.SKU,
       P.PRODUCT_NAME,
       I.QTY_ON_HAND
from YOURSCHEMA.CATEGORY C
join YOURSCHEMA.PRODUCT P
  on P.CATEGORY_ID = C.CATEGORY_ID
join YOURSCHEMA.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID
order by C.CATEGORY_NAME, P.SKU;

-- Error-analysis exercise: do not execute blindly.
-- Removing an ON predicate can multiply unrelated rows.
-- Before running any changed join, predict the row count and explain the relationship.

-- Independent task starter:
-- Show PRODUCT_NAME, CATEGORY_NAME, QTY_ON_HAND, and REORDER_POINT
-- only for products at or below their reorder point.
