**free

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-c CourseName 'RPGBA-101';

dcl-s learnerName varchar(40) inz('Avery');
dcl-s message     varchar(52);

message = 'Welcome ' + %trim(learnerName)
        + ' to ' + CourseName;

dsply message;

*inlr = *on;
