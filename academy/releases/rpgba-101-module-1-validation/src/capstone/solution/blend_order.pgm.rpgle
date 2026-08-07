**free

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-pr CalculateDiscount packed(11 : 2);
    amount packed(11 : 2) const;
    rate   packed(5 : 4) const;
end-pr;

dcl-c StandardRate  0.0500;
dcl-c PreferredRate 0.1000;

dcl-s customerName   varchar(30) inz('Avery Jones');
dcl-s orderAmount    packed(11 : 2) inz(750.00);
dcl-s discountRate   packed(5 : 4) inz(0);
dcl-s discount       packed(11 : 2) inz(0);
dcl-s finalTotal     packed(11 : 2) inz(0);
dcl-s statusMessage  varchar(80);
dcl-s shippingClass  varchar(10);
dcl-s installment    int(10);
dcl-s installmentAmt packed(11 : 2);
dcl-s finalInstallment packed(11 : 2);

if orderAmount <= 0;
    statusMessage = 'INVALID ORDER AMOUNT';
    dsply ('Status: ' + %trim(statusMessage));
else;
    select;
    when orderAmount >= 1000;
        discountRate = PreferredRate;
        statusMessage = 'PREFERRED DISCOUNT';
    when orderAmount >= 500;
        discountRate = StandardRate;
        statusMessage = 'STANDARD DISCOUNT';
    other;
        discountRate = 0;
        statusMessage = 'NO DISCOUNT';
    endsl;

    discount = CalculateDiscount(orderAmount : discountRate);
    finalTotal = orderAmount - discount;

    if finalTotal >= 750;
        shippingClass = 'PRIORITY';
    else;
        shippingClass = 'STANDARD';
    endif;

    dsply ('Customer: ' + %trim(customerName));
    dsply ('Original: ' + %char(orderAmount));
    dsply ('Discount: ' + %char(discount));
    dsply ('Final: ' + %char(finalTotal));
    dsply ('Ship: ' + %trim(shippingClass));
    dsply ('Status: ' + %trim(statusMessage));

    installmentAmt = %dec(finalTotal / 3 : 11 : 2);
    finalInstallment = finalTotal - (installmentAmt * 2);

    for installment = 1 to 3;
        if installment < 3;
            dsply ('Installment ' + %char(installment)
                  + ': ' + %char(installmentAmt));
        else;
            dsply ('Installment ' + %char(installment)
                  + ': ' + %char(finalInstallment));
        endif;
    endfor;
endif;

*inlr = *on;


dcl-proc CalculateDiscount;
    dcl-pi *n packed(11 : 2);
        amount packed(11 : 2) const;
        rate   packed(5 : 4) const;
    end-pi;

    return %dech(amount * rate : 11 : 2);
end-proc;
