-- The RPG Blend Academy
-- Module 2: Db2 for i + SQL
-- Lesson 2.9 practice
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- Replace YOURSCHEMA before running.

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

-- Introductory index: supports access by category key.
-- This lesson explains why an index may help; it does not promise that this
-- specific index will be chosen by the optimizer for every query.
create index YOURSCHEMA.IX_PRODUCT_CATEGORY
    on YOURSCHEMA.PRODUCT (CATEGORY_ID);

select PRODUCT_ID,
       SKU,
       PRODUCT_NAME,
       CATEGORY_NAME,
       PRICE,
       QTY_ON_HAND
from YOURSCHEMA.ACTIVE_PRODUCT_SUMMARY
order by CATEGORY_NAME, SKU;

-- Reflection:
-- 1. What logic did the view centralize?
-- 2. Why is the view not a copy of the underlying data?
-- 3. What evidence would you need before claiming an index improved performance?
