**free
ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

// Replace YOURSCHEMA with the assigned learner library before compile.
dcl-f ORDHDR usage(*input)
              keyed
              extdesc('YOURSCHEMA/ORDHDR')
              extfile(*extdesc);

dcl-s lookupOrder int(10) inz(5001);
dcl-s msg char(52);

chain lookupOrder OHDRR;

if %found(ORDHDR);
    msg = 'Found order ' + %char(ORDID) + ' status ' + %trim(STATUS);
else;
    msg = 'Order ' + %char(lookupOrder) + ' not found';
endif;

dsply msg;
*inlr = *on;
return;