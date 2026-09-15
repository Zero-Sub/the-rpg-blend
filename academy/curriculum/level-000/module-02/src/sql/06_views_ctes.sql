-- The RPG Blend Academy
-- Module 2: views, CTEs, and the Data Service boundary
-- Development source: live IBM i validation pending.

-- Stable relational interface for later application logic.
-- This view returns facts. It does not decide whether an order is allowed.
CREATE VIEW RPGBA_CC.V_PRODUCT_SNAPSHOT AS
SELECT PRODUCT_ID,
       UNIT_PRICE,
       QUANTITY_AVAILABLE,
       ACTIVE
  FROM RPGBA_CC.PRODUCT;

COMMENT ON VIEW RPGBA_CC.V_PRODUCT_SNAPSHOT IS
    'Module 2 Data Service interface: product facts for application logic';

-- Prove the contract.
SELECT PRODUCT_ID, UNIT_PRICE, QUANTITY_AVAILABLE, ACTIVE
  FROM RPGBA_CC.V_PRODUCT_SNAPSHOT
 ORDER BY PRODUCT_ID;

-- CTE example: calculate stored order totals from order-line facts.
WITH ORDER_TOTALS AS (
    SELECT ORDER_ID,
           DECIMAL(SUM(QUANTITY * UNIT_PRICE), 13, 2) AS STORED_ORDER_TOTAL
      FROM RPGBA_CC.ORDER_ITEM
     GROUP BY ORDER_ID
)
SELECT O.ORDER_ID,
       O.ORDER_STATUS,
       T.STORED_ORDER_TOTAL
  FROM RPGBA_CC.ORDER_HEADER O
  JOIN ORDER_TOTALS T
    ON T.ORDER_ID = O.ORDER_ID
 ORDER BY O.ORDER_ID;

-- CTE chain example: summarize by customer without hiding the grain.
WITH ORDER_TOTALS AS (
    SELECT ORDER_ID,
           DECIMAL(SUM(QUANTITY * UNIT_PRICE), 13, 2) AS STORED_ORDER_TOTAL
      FROM RPGBA_CC.ORDER_ITEM
     GROUP BY ORDER_ID
),
CUSTOMER_TOTALS AS (
    SELECT O.CUSTOMER_ID,
           COUNT(*) AS ORDER_COUNT,
           DECIMAL(SUM(T.STORED_ORDER_TOTAL), 15, 2) AS STORED_TOTAL_VALUE
      FROM RPGBA_CC.ORDER_HEADER O
      JOIN ORDER_TOTALS T
        ON T.ORDER_ID = O.ORDER_ID
     GROUP BY O.CUSTOMER_ID
)
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       COALESCE(T.ORDER_COUNT, 0) AS ORDER_COUNT,
       COALESCE(T.STORED_TOTAL_VALUE, 0.00) AS STORED_TOTAL_VALUE
  FROM RPGBA_CC.CUSTOMER C
  LEFT JOIN CUSTOMER_TOTALS T
    ON T.CUSTOMER_ID = C.CUSTOMER_ID
 ORDER BY C.CUSTOMER_ID;

-- Subquery example: customers that have at least one open order.
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME
  FROM RPGBA_CC.CUSTOMER C
 WHERE C.CUSTOMER_ID IN (
       SELECT O.CUSTOMER_ID
         FROM RPGBA_CC.ORDER_HEADER O
        WHERE O.ORDER_STATUS = 'OPEN'
 )
 ORDER BY C.CUSTOMER_ID;

-- Boundary reminder:
-- Do not add ORDER_ALLOWED, DISCOUNT_PERCENT, APPROVAL_CODE, or similar
-- domain decisions to V_PRODUCT_SNAPSHOT. Module 3 owns those decisions.
