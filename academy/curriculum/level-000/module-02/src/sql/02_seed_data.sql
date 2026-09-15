-- The RPG Blend Academy
-- Module 2 Coffee Company seed data
-- Development source: live IBM i validation pending.
-- Run only after 01_create_schema.sql in an approved training schema.

INSERT INTO RPGBA_CC.CUSTOMER
    (CUSTOMER_ID, CUSTOMER_NAME, EMAIL, LOYALTY_TIER, ACTIVE)
VALUES
    (1001, 'Avery Chen',   'avery@example.invalid',  'STANDARD', 'Y'),
    (1002, 'Jordan Patel', 'jordan@example.invalid', 'GOLD',     'Y'),
    (1003, 'Riley Morgan', NULL,                      'STANDARD', 'Y'),
    (1004, 'Casey Brooks', 'casey@example.invalid',  'STANDARD', 'N');

INSERT INTO RPGBA_CC.PRODUCT
    (PRODUCT_ID, SKU, PRODUCT_NAME, UNIT_PRICE, QUANTITY_AVAILABLE, ACTIVE)
VALUES
    (2001, 'HB-12', 'House Blend Beans', 12.50, 80, 'Y'),
    (2002, 'DR-12', 'Dark Roast Beans',  13.75, 25, 'Y'),
    (2003, 'CB-KIT', 'Cold Brew Kit',     28.00,  8, 'Y'),
    (2004, 'MUG-LG', 'Legacy Mug',         9.50,  0, 'N'),
    (2005, 'ES-12', 'Espresso Beans',     15.25,  4, 'Y');

INSERT INTO RPGBA_CC.ORDER_HEADER
    (ORDER_ID, CUSTOMER_ID, ORDER_TIMESTAMP, ORDER_STATUS)
VALUES
    (5001, 1001, TIMESTAMP('2026-09-01-09.15.00'), 'SUBMITTED'),
    (5002, 1002, TIMESTAMP('2026-09-03-14.30.00'), 'FULFILLED'),
    (5003, 1001, TIMESTAMP('2026-09-05-08.05.00'), 'OPEN'),
    (5004, 1003, TIMESTAMP('2026-09-07-16.45.00'), 'CANCELLED');

INSERT INTO RPGBA_CC.ORDER_ITEM
    (ORDER_ID, LINE_NO, PRODUCT_ID, QUANTITY, UNIT_PRICE)
VALUES
    (5001, 1, 2001, 2, 12.50),
    (5001, 2, 2003, 1, 28.00),
    (5002, 1, 2002, 3, 13.75),
    (5002, 2, 2005, 2, 15.25),
    (5003, 1, 2005, 1, 15.25),
    (5004, 1, 2001, 1, 12.50);

-- Baseline evidence.
SELECT 'CUSTOMER' AS TABLE_NAME, COUNT(*) AS ROW_COUNT FROM RPGBA_CC.CUSTOMER
UNION ALL
SELECT 'PRODUCT', COUNT(*) FROM RPGBA_CC.PRODUCT
UNION ALL
SELECT 'ORDER_HEADER', COUNT(*) FROM RPGBA_CC.ORDER_HEADER
UNION ALL
SELECT 'ORDER_ITEM', COUNT(*) FROM RPGBA_CC.ORDER_ITEM
ORDER BY TABLE_NAME;

-- Expected baseline counts:
-- CUSTOMER      4
-- PRODUCT       5
-- ORDER_HEADER  4
-- ORDER_ITEM    6

-- Negative integrity cases belong in the lab and validation matrix.
-- Do not leave failing statements uncommented in the shared seed script.
