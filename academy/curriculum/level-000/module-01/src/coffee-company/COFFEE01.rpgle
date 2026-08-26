**free
ctl-opt dftactgrp(*no);

// The RPG Blend Academy - Coffee Company
// Module 1: RPG Foundations
// Release Candidate teaching source; validate on the designated IBM i environment.

dcl-pr CalculateDiscount packed(9 : 2);
   orderAmount packed(9 : 2) const;
end-pr;

dcl-s orderAmount packed(9 : 2) inz(750.00);
dcl-s discount packed(9 : 2) inz(0);
dcl-s finalTotal packed(9 : 2) inz(0);
dcl-s message varchar(52);

if orderAmount <= 0;
   message = 'INVALID ORDER';
else;
   discount = CalculateDiscount(orderAmount);
   finalTotal = orderAmount - discount;
   message = 'Coffee order total: ' + %char(finalTotal);
endif;

dsply message;

*inlr = *on;
return;

dcl-proc CalculateDiscount;
   dcl-pi *n packed(9 : 2);
      orderAmount packed(9 : 2) const;
   end-pi;

   dcl-s discountRate packed(5 : 4) inz(0);

   select;
      when orderAmount >= 1000;
         discountRate = 0.1000;
      when orderAmount >= 500;
         discountRate = 0.0500;
      other;
         discountRate = 0;
   endsl;

   return %dech(orderAmount * discountRate : 9 : 2);
end-proc;
