-- The RPG Blend Academy
-- Module 2: Db2 for i + SQL
-- Purpose: load deterministic fictional training data
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- Replace YOURSCHEMA before running.

insert into YOURSCHEMA.CATEGORY
    (CATEGORY_ID, CATEGORY_NAME, ACTIVE)
values
    (10, 'Coffee',      'Y'),
    (20, 'Equipment',   'Y'),
    (30, 'Merchandise', 'Y');

insert into YOURSCHEMA.PRODUCT
    (PRODUCT_ID, CATEGORY_ID, SKU, PRODUCT_NAME, ROAST_LEVEL, PRICE, ACTIVE, INTRO_DATE)
values
    (1001, 10, 'COF-MORN-12', 'Morning Blend 12 oz', 'Medium', 14.95, 'Y', date('2026-01-15')),
    (1002, 10, 'COF-MIDN-12', 'Midnight Roast 12 oz', 'Dark',   16.95, 'Y', date('2026-02-01')),
    (1003, 10, 'COF-DECF-12', 'House Decaf 12 oz',    'Medium', 15.95, 'Y', date('2026-03-10')),
    (2001, 20, 'GEAR-POUR-01', 'Pour Over Starter Kit', null,    24.95, 'Y', date('2026-01-20')),
    (3001, 30, 'MER-MUG-01',   'RPG Blend Logo Mug',   null,    12.00, 'Y', date('2026-04-01'));

insert into YOURSCHEMA.INVENTORY
    (PRODUCT_ID, QTY_ON_HAND, REORDER_POINT)
values
    (1001, 42, 12),
    (1002, 18, 10),
    (1003,  7,  8),
    (2001,  5,  5),
    (3001, 26, 10);

-- Evidence: these counts should be 3, 5, and 5.
select count(*) as CATEGORY_COUNT from YOURSCHEMA.CATEGORY;
select count(*) as PRODUCT_COUNT from YOURSCHEMA.PRODUCT;
select count(*) as INVENTORY_COUNT from YOURSCHEMA.INVENTORY;
