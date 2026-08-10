**free

// RPGBA-101 Module 2, Lesson 1
// Academy-original training source.
// Development draft: IBM i compile/runtime validation pending.

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-ds customer qualified;
   id packed(7 : 0) inz(1001);
   name varchar(40) inz('Avery Reed');
   city varchar(30) inz('Franklin');
   stateCode char(2) inz('TN');
   postalCode char(10) inz('37064');
   preferred ind inz(*on);
end-ds customer;

dcl-s message varchar(52);

message = %trim(customer.name) + ' | ' + %trim(customer.city);
dsply message;

*inlr = *on;
