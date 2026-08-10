**free
ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

// Disposable native WRITE -> UPDATE -> DELETE cycle.
// Replace YOURSCHEMA before compile. Do not use a permanent seed key.
dcl-f ORDHDR usage(*update : *output : *delete)
              keyed
              extdesc('YOURSCHEMA/ORDHDR')
              extfile(*extdesc);

dcl-c DisposableOrder 5901;
dcl-s msg char(52);

// Prove the key is unused before WRITE.
chain DisposableOrder OHDRR;
if %found(ORDHDR);
    dsply 'Disposable order already exists - stop';
    *inlr = *on;
    return;
endif;

ORDID = DisposableOrder;
ORDDATE = %date();
CUSTNAME = 'Module 3 Native Lab';
STATUS = 'NEW';
TOTALAMT = 0;
CRTDTS = %timestamp();
write OHDRR;

// Read the same record, then change one value.
chain DisposableOrder OHDRR;
if not %found(ORDHDR);
    dsply 'WRITE verification failed - stop';
    *inlr = *on;
    return;
endif;

STATUS = 'READY';
update OHDRR;

// Re-read and prove the intended state before cleanup.
chain DisposableOrder OHDRR;
if not %found(ORDHDR) or STATUS <> 'READY';
    dsply 'UPDATE verification failed - stop';
    *inlr = *on;
    return;
endif;

delete OHDRR;

chain DisposableOrder OHDRR;
if %found(ORDHDR);
    msg = 'DELETE verification failed';
else;
    msg = 'Native disposable change cycle passed';
endif;

dsply msg;
*inlr = *on;
return;