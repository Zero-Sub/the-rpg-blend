**free
ctl-opt dftactgrp(*no) actgrp(*new) option(*srcstmt : *nodebugio);

dcl-s customerName varchar(50) inz('  Avery Jones  ');
dcl-s quantity int(10) inz(3);
dcl-s unitPrice packed(11 : 2) inz(199.99);
dcl-s discountRate packed(5 : 4) inz(0.0500);
dcl-s subtotal packed(11 : 2);
dcl-s discount packed(11 : 2);
dcl-s finalTotal packed(11 : 2);
dcl-s normalizedName varchar(50);
dcl-s nameLength     int(10);
dcl-s summary        varchar(150);

subtotal = quantity * unitPrice;
discount = %dec(subtotal * discountRate : 11 : 2);
finalTotal = subtotal - discount;

normalizedName = %upper(%trim(customerName));
nameLength = %len(%trim(normalizedName));

summary = normalizedName
        + ' | characters: ' + %char(nameLength)
        + ' | final total: ' + %char(finalTotal);

dsply summary;
dsply ('Final total: ' + %char(finalTotal));
*inlr = *on;
