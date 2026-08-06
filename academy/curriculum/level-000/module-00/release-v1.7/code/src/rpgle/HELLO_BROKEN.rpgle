**free
ctl-opt dftactgrp(*no) actgrp(*caller) option(*srcstmt:*nodebugio);

// Intentional troubleshooting example for Lab 5.
// The learner should predict and then verify the diagnostic.

dcl-s learner varchar(40) inz('RPG Blend learner');
dcl-s message varchar(120);

message = 'Hello from IBM i, ' + %trim(learner) + '.'
dsply message;

*inlr = *on;
return;
