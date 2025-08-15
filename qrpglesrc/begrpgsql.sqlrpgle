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

   Exec Sql
   Update CUSTFILE
      Set CUSPHONE = '555-4321'
    Where CUSID = 'CUST1001';

Else;

  Exec Sql
   Insert Into CUSTFILE
      (CUSID, CUSNAME, CUSPHONE, CUSCITY, CUSSTATE, CUSJOIN)
   Values
      ('CUST1009', 'Latte Lover', '555-1234', 'Seattle', 'WA', Current_date);

Endif;

If %Error;
   Dsply 'Error during file operation';
Endif;

*inlr=*on;
Return;
