-- The RPG Blend Academy
-- Module 2: controlled DML and transaction evidence
-- Development source: live IBM i transaction validation pending.
--
-- IMPORTANT:
-- Run statement by statement only in the approved training environment.
-- Do not use this file until the instructor has verified journaling,
-- commitment-control behavior, and client connection settings.

-- Baseline: exactly one product should match.
SELECT PRODUCT_ID, PRODUCT_NAME, QUANTITY_AVAILABLE
  FROM RPGBA_CC.PRODUCT
 WHERE PRODUCT_ID = 2003;

-- Prediction before execution:
-- expected affected rows = 1
UPDATE RPGBA_CC.PRODUCT
   SET QUANTITY_AVAILABLE = 10
 WHERE PRODUCT_ID = 2003;

-- Verify changed state inside the current transaction context.
SELECT PRODUCT_ID, PRODUCT_NAME, QUANTITY_AVAILABLE
  FROM RPGBA_CC.PRODUCT
 WHERE PRODUCT_ID = 2003;

-- First pass is a recovery proof, not the final change.
ROLLBACK;

-- Prove restoration to the seed-data baseline (8 units).
SELECT PRODUCT_ID, PRODUCT_NAME, QUANTITY_AVAILABLE
  FROM RPGBA_CC.PRODUCT
 WHERE PRODUCT_ID = 2003;

-- Repeat the same controlled change only after rollback has been proven.
UPDATE RPGBA_CC.PRODUCT
   SET QUANTITY_AVAILABLE = 10
 WHERE PRODUCT_ID = 2003;

-- Recheck exactly one row and the intended value.
SELECT PRODUCT_ID, PRODUCT_NAME, QUANTITY_AVAILABLE
  FROM RPGBA_CC.PRODUCT
 WHERE PRODUCT_ID = 2003;

-- Commit only when the lab explicitly calls for the final persisted change.
COMMIT;

-- Final proof.
SELECT PRODUCT_ID, PRODUCT_NAME, QUANTITY_AVAILABLE
  FROM RPGBA_CC.PRODUCT
 WHERE PRODUCT_ID = 2003;

-- Instructor reset for the next learner must be executed deliberately
-- under the same verified transaction conditions. It is not embedded here
-- as an automatic cleanup statement.
