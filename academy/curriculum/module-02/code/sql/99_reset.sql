-- The RPG Blend Academy
-- Module 2 reset script
-- Validation status: source/static validated; PUB400 IBM i 7.5 execution pending
-- DESTRUCTIVE TRAINING ACTION: replace YOURSCHEMA and review every object name.

-- IBM i 7.5 supports IF EXISTS on DROP. This keeps a partial or repeated
-- training reset from failing only because one Academy object is already gone.
-- Drop dependent objects before base tables.
drop view if exists YOURSCHEMA.ACTIVE_PRODUCT_SUMMARY;
drop index if exists YOURSCHEMA.IX_PRODUCT_CATEGORY;
drop table if exists YOURSCHEMA.INVENTORY;
drop table if exists YOURSCHEMA.PRODUCT;
drop table if exists YOURSCHEMA.CATEGORY;

-- IF EXISTS makes this script repeatable; it does not make a wrong schema safe.
-- Never broaden the target or drop the learner library/schema itself.
