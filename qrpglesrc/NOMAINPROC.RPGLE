**free

ctl-opt main(MainProc) dftactgrp(*no);

dcl-proc MainProc;
   dcl-s name varchar(50);
   dcl-s result varchar(50);

   name = 'George';
   result = Greet(name);
   dsply result;
end-proc;

dcl-proc Greet;
   dcl-pi *n varchar(50);
      name varchar(50);
   end-pi;

   return 'Hello, ' + %trim(name) + '!';
end-proc;
