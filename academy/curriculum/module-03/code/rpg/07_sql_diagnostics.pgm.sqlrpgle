**free
ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

exec sql
    set option commit = *none,
               closqlcsr = *endmod;

dcl-c DiagnosticCategory 9901;
dcl-s existing int(10) inz(0);
dcl-s diagState char(5);
dcl-s diagMessage varchar(256);
dcl-s affectedRows int(10) inz(0);
dcl-s msg char(52);

// Prove the disposable key/name do not collide with existing data.
exec sql
    select count(*)
      into :existing
      from YOURSCHEMA.CATEGORY
     where CATEGORY_ID = :DiagnosticCategory
        or CATEGORY_NAME = 'Module 3 Diagnostic Test';

if SQLCOD <> 0 or existing <> 0;
    dsply 'Diagnostic disposable key/name not clean - stop';
    *inlr = *on;
    return;
endif;

// Controlled failure: ACTIVE='X' should violate the Module 2 CHECK rule.
exec sql
    insert into YOURSCHEMA.CATEGORY
        (CATEGORY_ID, CATEGORY_NAME, ACTIVE)
    values
        (:DiagnosticCategory, 'Module 3 Diagnostic Test', 'X');

if SQLCOD < 0;
    exec sql
        get diagnostics condition 1
            :diagState = RETURNED_SQLSTATE,
            :diagMessage = MESSAGE_TEXT;

    msg = 'Expected SQLSTATE ' + diagState;
    dsply msg;
else;
    exec sql get diagnostics :affectedRows = ROW_COUNT;
    msg = 'Unexpected insert rows ' + %char(affectedRows);
    dsply msg;

    exec sql
        delete from YOURSCHEMA.CATEGORY
         where CATEGORY_ID = :DiagnosticCategory
           and CATEGORY_NAME = 'Module 3 Diagnostic Test';
endif;

*inlr = *on;
return;