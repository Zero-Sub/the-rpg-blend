**free
ctl-opt dftactgrp(*no) actgrp(*new) option(*srcstmt : *nodebugio);

dcl-s orderAmount packed(11 : 2) inz(500.00);
dcl-s discountRate packed(5 : 4) inz(0);
dcl-s statusMessage varchar(80);

if orderAmount <= 0;
    statusMessage = 'Order amount must be greater than zero';
    discountRate = 0;
elseif orderAmount >= 1000;
    statusMessage = 'Preferred discount applied';
    discountRate = 0.1000;
elseif orderAmount >= 500;
    statusMessage = 'Standard discount applied';
    discountRate = 0.0500;
else;
    statusMessage = 'No discount applied';
    discountRate = 0;
endif;

dsply (%trim(statusMessage) + ' | rate: ' + %char(discountRate));
*inlr = *on;
