**free

// RPGBA-101 Module 2, Lesson 1
// Academy-original training source.
// Development draft: IBM i compile/runtime validation pending.

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-s customerId packed(7 : 0) inz(1001);
dcl-s customerName varchar(40) inz('Avery Reed');
dcl-s city varchar(30) inz('Franklin');
dcl-s stateCode char(2) inz('TN');
dcl-s postalCode char(10) inz('37064');
dcl-s preferredCustomer ind inz(*on);
dcl-s message varchar(52);

message = %trim(customerName) + ' | ' + %trim(city);
dsply message;

*inlr = *on;
