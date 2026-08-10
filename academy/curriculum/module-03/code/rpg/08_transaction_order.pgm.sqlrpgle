**free
ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

// DO NOT RUN until TRANSACTION_PREFLIGHT.md is satisfied.
exec sql
    set option commit = *chg,
               closqlcsr = *endmod;

dcl-c TransactionOrder 5950;
dcl-s forceFailure ind inz(*off);
dcl-s existing int(10) inz(0);
dcl-s msg char(52);

exec sql
    select count(*)
      into :existing
      from YOURSCHEMA.ORDER_HEADER
     where ORDER_ID = :TransactionOrder;

if SQLCOD <> 0 or existing <> 0;
    dsply 'Transaction order key not clean - stop';
    *inlr = *on;
    return;
endif;

exec sql
    insert into YOURSCHEMA.ORDER_HEADER
        (ORDER_ID, ORDER_DATE, CUSTOMER_NAME, STATUS, TOTAL_AMOUNT)
    values
        (:TransactionOrder, current_date, 'Module 3 Tx Lab', 'NEW', 14.95);

if SQLCOD < 0;
    dsply 'Header insert failed - transaction stopped';
    exec sql rollback;
    *inlr = *on;
    return;
endif;

if forceFailure;
    exec sql
        insert into YOURSCHEMA.ORDER_LINES
            (ORDER_ID, LINE_NO, PRODUCT_ID, QUANTITY, UNIT_PRICE, LINE_AMOUNT)
        values
            (:TransactionOrder, 1, 9999, 1, 14.95, 14.95);
else;
    exec sql
        insert into YOURSCHEMA.ORDER_LINES
            (ORDER_ID, LINE_NO, PRODUCT_ID, QUANTITY, UNIT_PRICE, LINE_AMOUNT)
        values
            (:TransactionOrder, 1, 1001, 1, 14.95, 14.95);
endif;

if SQLCOD < 0;
    exec sql rollback;
    msg = 'Transaction rolled back';
else;
    exec sql commit;
    msg = 'Transaction committed';
endif;

dsply msg;
*inlr = *on;
return;