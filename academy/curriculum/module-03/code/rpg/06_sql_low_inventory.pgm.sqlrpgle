**free
ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

exec sql
    set option commit = *none,
               closqlcsr = *endmod;

dcl-s productId int(10);
dcl-s productName varchar(80);
dcl-s qtyOnHand int(10);
dcl-s reorderPoint int(10);
dcl-s rowCount int(10) inz(0);
dcl-s msg char(52);

exec sql
    declare LowInventory cursor for
        select P.PRODUCT_ID,
               P.PRODUCT_NAME,
               I.QTY_ON_HAND,
               I.REORDER_POINT
          from YOURSCHEMA.PRODUCT P
          join YOURSCHEMA.INVENTORY I
            on I.PRODUCT_ID = P.PRODUCT_ID
         where I.QTY_ON_HAND <= I.REORDER_POINT
         order by P.PRODUCT_ID;

exec sql open LowInventory;

if SQLCOD < 0;
    dsply 'Cursor open failed';
    *inlr = *on;
    return;
endif;

exec sql
    fetch next from LowInventory
     into :productId, :productName, :qtyOnHand, :reorderPoint;

dow SQLCOD = 0;
    rowCount += 1;
    msg = 'Low inventory product ' + %char(productId);
    dsply msg;

    exec sql
        fetch next from LowInventory
         into :productId, :productName, :qtyOnHand, :reorderPoint;
enddo;

if SQLCOD <> 100;
    msg = 'Cursor ended with SQLCODE ' + %char(SQLCOD);
    dsply msg;
endif;

exec sql close LowInventory;
msg = 'Low inventory rows ' + %char(rowCount);
dsply msg;
*inlr = *on;
return;