-- The RPG Blend Academy
-- Module 2 reset script
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- DESTRUCTIVE TRAINING ACTION: replace YOURSCHEMA and review every object name.

-- Drop dependent objects before base tables.
drop view YOURSCHEMA.ACTIVE_PRODUCT_SUMMARY;
drop index YOURSCHEMA.IX_PRODUCT_CATEGORY;
drop table YOURSCHEMA.INVENTORY;
drop table YOURSCHEMA.PRODUCT;
drop table YOURSCHEMA.CATEGORY;

-- If an object does not exist, Db2 for i can return an error for that statement.
-- That does not authorize changing the script to target a different object.
