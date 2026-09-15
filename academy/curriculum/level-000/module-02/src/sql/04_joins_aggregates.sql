-- The RPG Blend Academy
-- Module 2: joins, cardinality, aggregation, and result grain
-- All statements are read-only.

-- 1. Orders with customer names.
-- Grain: one row per order.
SELECT O.ORDER_ID,
       O.ORDER_TIMESTAMP,
       O.ORDER_STATUS,
       C.CUSTOMER_ID,
       C.CUSTOMER_NAME
  FROM RPGBA_CC.ORDER_HEADER O
  JOIN RPGBA_CC.CUSTOMER C
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
 ORDER BY O.ORDER_ID;

-- 2. Order-line detail with product facts.
-- Grain: one row per order line.
SELECT I.ORDER_ID,
       I.LINE_NO,
       P.PRODUCT_ID,
       P.PRODUCT_NAME,
       I.QUANTITY,
       I.UNIT_PRICE,
       DECIMAL(I.QUANTITY * I.UNIT_PRICE, 13, 2) AS LINE_TOTAL
  FROM RPGBA_CC.ORDER_ITEM I
  JOIN RPGBA_CC.PRODUCT P
    ON P.PRODUCT_ID = I.PRODUCT_ID
 ORDER BY I.ORDER_ID, I.LINE_NO;

-- 3. Customer order count.
-- Grain: one row per customer that has at least one order.
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       COUNT(*) AS ORDER_COUNT
  FROM RPGBA_CC.CUSTOMER C
  JOIN RPGBA_CC.ORDER_HEADER O
    ON O.CUSTOMER_ID = C.CUSTOMER_ID
 GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
 ORDER BY C.CUSTOMER_ID;

-- 4. Include customers with no orders.
-- Grain: one row per customer.
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME,
       COUNT(O.ORDER_ID) AS ORDER_COUNT
  FROM RPGBA_CC.CUSTOMER C
  LEFT JOIN RPGBA_CC.ORDER_HEADER O
    ON O.CUSTOMER_ID = C.CUSTOMER_ID
 GROUP BY C.CUSTOMER_ID, C.CUSTOMER_NAME
 ORDER BY C.CUSTOMER_ID;

-- 5. Units ordered by product.
-- Grain: one row per product represented in order items.
SELECT P.PRODUCT_ID,
       P.PRODUCT_NAME,
       SUM(I.QUANTITY) AS UNITS_ORDERED
  FROM RPGBA_CC.PRODUCT P
  JOIN RPGBA_CC.ORDER_ITEM I
    ON I.PRODUCT_ID = P.PRODUCT_ID
 GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
 ORDER BY UNITS_ORDERED DESC, P.PRODUCT_ID;

-- 6. Products with at least two units represented in order lines.
-- HAVING filters grouped results; WHERE filters input rows.
SELECT P.PRODUCT_ID,
       P.PRODUCT_NAME,
       SUM(I.QUANTITY) AS UNITS_ORDERED
  FROM RPGBA_CC.PRODUCT P
  JOIN RPGBA_CC.ORDER_ITEM I
    ON I.PRODUCT_ID = P.PRODUCT_ID
 GROUP BY P.PRODUCT_ID, P.PRODUCT_NAME
HAVING SUM(I.QUANTITY) >= 2
 ORDER BY UNITS_ORDERED DESC, P.PRODUCT_ID;

-- 7. Customers with no orders: unmatched-row pattern.
SELECT C.CUSTOMER_ID,
       C.CUSTOMER_NAME
  FROM RPGBA_CC.CUSTOMER C
  LEFT JOIN RPGBA_CC.ORDER_HEADER O
    ON O.CUSTOMER_ID = C.CUSTOMER_ID
 WHERE O.ORDER_ID IS NULL
 ORDER BY C.CUSTOMER_ID;

-- Instructor break-it exercise:
-- remove or damage a join predicate on a disposable copy of a query,
-- predict the row multiplication, execute, explain, then restore the correct join.
