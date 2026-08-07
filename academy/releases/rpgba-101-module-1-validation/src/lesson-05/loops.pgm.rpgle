**free
ctl-opt dftactgrp(*no) actgrp(*new) option(*srcstmt : *nodebugio);

dcl-s amounts packed(11 : 2) dim(5);
dcl-s index   int(10);
dcl-s total   packed(13 : 2) inz(0);
dcl-s highest packed(11 : 2) inz(0);

amounts(1) = 125.00;
amounts(2) = 499.99;
amounts(3) = 500.00;
amounts(4) = 750.00;
amounts(5) = 1000.00;

for index = 1 to %elem(amounts);
    total += amounts(index);
    if amounts(index) > highest;
        highest = amounts(index);
    endif;
endfor;

dsply ('Count: ' + %char(%elem(amounts)));
dsply ('Total: ' + %char(total));
dsply ('Highest: ' + %char(highest));
*inlr = *on;
