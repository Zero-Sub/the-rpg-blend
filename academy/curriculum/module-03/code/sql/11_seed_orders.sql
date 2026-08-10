-- The RPG Blend Academy
-- Module 3 deterministic fictional order data
-- Validation status: reviewed; target execution pending
-- Requires Module 2 PRODUCT seed data.

insert into YOURSCHEMA.ORDER_HEADER
    (ORDER_ID, ORDER_DATE, CUSTOMER_NAME, STATUS, TOTAL_AMOUNT)
values
    (5001, date('2026-08-01'), 'Avery Jones', 'NEW', 29.90),
    (5002, date('2026-08-02'), 'Jordan Lee', 'READY', 24.95),
    (5003, date('2026-08-03'), 'Morgan Chen', 'COMPLETE', 28.95);

insert into YOURSCHEMA.ORDER_LINES
    (ORDER_ID, LINE_NO, PRODUCT_ID, QUANTITY, UNIT_PRICE, LINE_AMOUNT)
values
    (5001, 1, 1001, 2, 14.95, 29.90),
    (5002, 1, 2001, 1, 24.95, 24.95),
    (5003, 1, 1002, 1, 16.95, 16.95),
    (5003, 2, 3001, 1, 12.00, 12.00);

select count(*) as ORDER_HEADER_COUNT from YOURSCHEMA.ORDER_HEADER;
select count(*) as ORDER_LINES_COUNT from YOURSCHEMA.ORDER_LINES;

select H.ORDER_ID,
       H.TOTAL_AMOUNT,
       sum(L.LINE_AMOUNT) as CALCULATED_LINE_TOTAL
from YOURSCHEMA.ORDER_HEADER H
join YOURSCHEMA.ORDER_LINES L
  on L.ORDER_ID = H.ORDER_ID
group by H.ORDER_ID, H.TOTAL_AMOUNT
order by H.ORDER_ID;