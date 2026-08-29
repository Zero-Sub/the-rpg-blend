-- The RPG Blend Academy
-- Module 2: Db2 for i + SQL
-- Lesson 2.7 practice
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- Replace YOURSCHEMA before running.

-- 1. Whole-table aggregates.
select count(*) as PRODUCT_COUNT,
       min(PRICE) as LOWEST_PRICE,
       max(PRICE) as HIGHEST_PRICE,
       decimal(avg(PRICE), 9, 2) as AVERAGE_PRICE
from YOURSCHEMA.PRODUCT;

-- 2. Group products by category.
select C.CATEGORY_NAME,
       count(*) as PRODUCT_COUNT,
       decimal(avg(P.PRICE), 9, 2) as AVERAGE_PRICE
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID
group by C.CATEGORY_NAME
order by C.CATEGORY_NAME;

-- 3. HAVING filters groups after grouping.
select C.CATEGORY_NAME,
       count(*) as PRODUCT_COUNT
from YOURSCHEMA.PRODUCT P
join YOURSCHEMA.CATEGORY C
  on C.CATEGORY_ID = P.CATEGORY_ID
group by C.CATEGORY_NAME
having count(*) >= 2
order by PRODUCT_COUNT desc, C.CATEGORY_NAME;

-- 4. Inventory summary by category.
select C.CATEGORY_NAME,
       sum(I.QTY_ON_HAND) as TOTAL_ON_HAND,
       sum(I.REORDER_POINT) as TOTAL_REORDER_POINT
from YOURSCHEMA.CATEGORY C
join YOURSCHEMA.PRODUCT P
  on P.CATEGORY_ID = C.CATEGORY_ID
join YOURSCHEMA.INVENTORY I
  on I.PRODUCT_ID = P.PRODUCT_ID
group by C.CATEGORY_NAME
order by C.CATEGORY_NAME;

-- Independent task starter:
-- Return only categories whose total quantity on hand is below 30.
