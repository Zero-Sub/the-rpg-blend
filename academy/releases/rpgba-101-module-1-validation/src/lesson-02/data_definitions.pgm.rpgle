**free

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-c StandardRate 0.0500;

dcl-s customerName varchar(50) inz('Avery Jones');
dcl-s orderAmount  packed(11 : 2) inz(750.00);
dcl-s discount     packed(11 : 2) inz(0);
dcl-s finalTotal   packed(11 : 2) inz(0);
dcl-s isPreferred  ind inz(*off);
dcl-s orderDate    date;

orderDate = %date();
discount = orderAmount * StandardRate;
finalTotal = orderAmount - discount;

dsply (%trim(customerName) + ' final total: '
      + %char(finalTotal));

*inlr = *on;
