**free
ctl-opt dftactgrp(*no) actgrp(*new) option(*srcstmt : *nodebugio);

dcl-pr CalculateDiscount packed(11 : 2);
    amount packed(11 : 2) const;
    rate   packed(5 : 4) const;
end-pr;

dcl-s orderAmount packed(11 : 2) inz(750.00);
dcl-s discountRate packed(5 : 4) inz(0.0500);
dcl-s discount packed(11 : 2);

discount = CalculateDiscount(orderAmount : discountRate);
dsply ('Discount: ' + %char(discount));

*inlr = *on;

dcl-proc CalculateDiscount;
    dcl-pi *n packed(11 : 2);
        amount packed(11 : 2) const;
        rate   packed(5 : 4) const;
    end-pi;

    return %dec(amount * rate : 11 : 2);
end-proc;
