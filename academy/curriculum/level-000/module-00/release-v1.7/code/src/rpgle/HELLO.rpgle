**free
ctl-opt dftactgrp(*no) actgrp(*caller) option(*srcstmt:*nodebugio);

// RPGBA-101 Module 0 starter program.
// Purpose: prove the edit -> compile -> run -> evidence loop.

dcl-s learner varchar(40) inz('RPG Blend learner');
dcl-s courseKeyword varchar(30) inz('safe workflow');
dcl-s message varchar(120);

message = 'Hello from IBM i, ' + %trim(learner) + '. Keyword: ' + %trim(courseKeyword) + '.';
dsply message;

*inlr = *on;
return;
