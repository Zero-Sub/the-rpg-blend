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

subtotal = quantity * unitPrice;

// Deliberate Lesson 3 conversion example: %DEC does not half-adjust.
// With 599.97 at 5%, the raw discount is 29.9985 and this conversion
// produces 29.99. Compare this behavior with %DECH before using a
// conversion rule for monetary business logic.
discount = %dec(subtotal * discountRate : 11 : 2);
finalTotal = subtotal - discount;

normalizedName = %upper(%trim(customerName));
nameLength = %len(%trim(normalizedName));

// Keep each DSPLY message within the RPG 52-byte training limit.
dsply ('Name: ' + %trim(normalizedName));
dsply ('Characters: ' + %char(nameLength));
dsply ('Subtotal: ' + %char(subtotal));
dsply ('Discount: ' + %char(discount));
dsply ('Final: ' + %char(finalTotal));

*inlr = *on;
