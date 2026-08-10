**free
ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

// Replace YOURSCHEMA with the assigned learner library before compile.
dcl-f ORDLINE usage(*input)
               keyed
               extdesc('YOURSCHEMA/ORDLINE')
               extfile(*extdesc);

dcl-s lookupOrder int(10) inz(5003);
dcl-s lineCount int(10) inz(0);
dcl-s msg char(52);

setll (lookupOrder) OLINER;
reade (lookupOrder) OLINER;

dow not %eof(ORDLINE);
    lineCount += 1;
    reade (lookupOrder) OLINER;
enddo;

msg = 'Order ' + %char(lookupOrder) + ' line count ' + %char(lineCount);
dsply msg;
*inlr = *on;
return;