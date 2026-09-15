-- The RPG Blend Academy
-- Module 2: SELECT practice
-- All statements in this file are read-only.
-- Predict the result before execution.

-- 1. Full product catalog facts.
SELECT PRODUCT_ID, SKU, PRODUCT_NAME, UNIT_PRICE, QUANTITY_AVAILABLE, ACTIVE
  FROM RPGBA_CC.PRODUCT
 ORDER BY PRODUCT_ID;

-- 2. Active products only.
SELECT PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE
  FROM RPGBA_CC.PRODUCT
 WHERE ACTIVE = 'Y'
 ORDER BY UNIT_PRICE, PRODUCT_ID;

-- 3. Products in a price range.
SELECT PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE
  FROM RPGBA_CC.PRODUCT
 WHERE UNIT_PRICE BETWEEN 10.00 AND 20.00
 ORDER BY UNIT_PRICE;

-- 4. Inventory facts with a calculated inventory value.
-- This is arithmetic over stored facts, not an order-eligibility rule.
SELECT PRODUCT_ID,
       PRODUCT_NAME,
       UNIT_PRICE,
       QUANTITY_AVAILABLE,
       DECIMAL(UNIT_PRICE * QUANTITY_AVAILABLE, 13, 2) AS INVENTORY_VALUE
  FROM RPGBA_CC.PRODUCT
 ORDER BY INVENTORY_VALUE DESC;

-- 5. Customers with missing optional email data.
SELECT CUSTOMER_ID, CUSTOMER_NAME
  FROM RPGBA_CC.CUSTOMER
 WHERE EMAIL IS NULL
 ORDER BY CUSTOMER_ID;

-- 6. Demonstrate why NULL is not tested with ordinary equality.
-- The correct predicate is IS NULL, as shown above.

-- 7. Orders in a controlled date window.
SELECT ORDER_ID, CUSTOMER_ID, ORDER_TIMESTAMP, ORDER_STATUS
  FROM RPGBA_CC.ORDER_HEADER
 WHERE DATE(ORDER_TIMESTAMP) BETWEEN DATE('2026-09-01') AND DATE('2026-09-05')
 ORDER BY ORDER_TIMESTAMP;

-- 8. String expression example.
SELECT CUSTOMER_ID,
       UPPER(CUSTOMER_NAME) AS CUSTOMER_NAME_UPPER,
       COALESCE(EMAIL, '(no email)') AS EMAIL_DISPLAY
  FROM RPGBA_CC.CUSTOMER
 ORDER BY CUSTOMER_ID;

-- 9. Boolean grouping / precedence exercise.
-- Requirement: active products that are either under $13 or have fewer than 10 units.
SELECT PRODUCT_ID, PRODUCT_NAME, UNIT_PRICE, QUANTITY_AVAILABLE
  FROM RPGBA_CC.PRODUCT
 WHERE ACTIVE = 'Y'
   AND (UNIT_PRICE < 13.00 OR QUANTITY_AVAILABLE < 10)
 ORDER BY PRODUCT_ID;

-- 10. DISTINCT exercise.
SELECT DISTINCT ORDER_STATUS
  FROM RPGBA_CC.ORDER_HEADER
 ORDER BY ORDER_STATUS;
