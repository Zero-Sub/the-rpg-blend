**free

Dcl-f CUSTFILE usage(*update:*output) keyed;

Dcl-s CUSID     Char(10);
Dcl-s CUSNAME   Char(30);
Dcl-s CUSPHONE  Char(15);
Dcl-s CUSCITY   Char(20);
Dcl-s CUSSTATE  Char(2);
Dcl-s CUSJOIN   Date;

// Search for customer
CUSID = 'CUST1001';
Chain CUSID CustFile;

If %Found(CustFile);
   CUSPHONE = '555-9876';
   Update CUSTRECORD;
Else;
   CUSNAME  = 'New Brew Co.';
   CUSPHONE = '555-2468';
   CUSCITY  = 'Nashville';
   CUSSTATE = 'TN';
   CUSJOIN  = %date();
   Write CUSTRECORD;
Endif;

If %Error;
   Dsply 'Error during file operation';
Endif;

*inlr=*on;
Return;
