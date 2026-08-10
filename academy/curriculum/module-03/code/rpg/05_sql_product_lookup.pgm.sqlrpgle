**free
ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

exec sql
    set option commit = *none,
               closqlcsr = *endmod;

dcl-s productId int(10) inz(1001);
dcl-s productName varchar(80);
dcl-s price packed(9 : 2);
dcl-s msg char(52);

exec sql
    select PRODUCT_NAME, PRICE
      into :productName, :price
      from YOURSCHEMA.PRODUCT
     where PRODUCT_ID = :productId;

select;
when SQLCOD = 0;
    msg = 'Found product ' + %char(productId) + ' price ' + %char(price);
when SQLCOD = 100;
    msg = 'Product ' + %char(productId) + ' not found';
other;
    msg = 'SQL error code ' + %char(SQLCOD);
endsl;

dsply msg;
*inlr = *on;
return;