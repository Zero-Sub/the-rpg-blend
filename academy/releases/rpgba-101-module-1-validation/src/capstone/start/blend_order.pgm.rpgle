**free

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-s customerName varchar(50) inz('Avery Jones');
dcl-s orderAmount  packed(11 : 2) inz(750.00);
dcl-s resultMessage varchar(200);

// TODO: validate the amount.
// TODO: determine discount rate.
// TODO: calculate discount in a procedure.
// TODO: classify shipping.
// TODO: produce three installment messages with a bounded loop.
// TODO: build and display the final result message.

resultMessage = %trim(customerName)
              + ' | order: ' + %char(orderAmount);

dsply resultMessage;

*inlr = *on;
