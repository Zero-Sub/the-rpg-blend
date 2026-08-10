-- The RPG Blend Academy
-- Module 3 reset — removes Module 3 order objects only.
-- Validation status: reviewed; target execution pending
-- Replace YOURSCHEMA and review every target before running.

drop table if exists YOURSCHEMA.ORDER_LINES;
drop table if exists YOURSCHEMA.ORDER_HEADER;

-- Module 2 CATEGORY, PRODUCT, INVENTORY are intentionally preserved.
select TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
from QSYS2.SYSTABLES
where TABLE_SCHEMA = 'YOURSCHEMA'
  and TABLE_NAME in ('ORDER_HEADER', 'ORDER_LINES',
                     'CATEGORY', 'PRODUCT', 'INVENTORY')
order by TABLE_NAME;