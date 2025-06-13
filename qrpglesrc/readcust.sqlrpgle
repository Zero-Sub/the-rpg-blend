**free
ctl-opt dftactgrp(*no) actgrp(*caller);

// Define a data structure that matches the table columns
dcl-ds customer extname('CUSTOMERS') qualified end-ds;
dcl-s response char(1) inz;

// Declare a SQL cursor to fetch all rows from the table
exec sql
  declare c1 cursor for
    select id, name, email from gvaneaton/customers;

// Open the cursor
exec sql
  open c1;

// Loop until there are no more rows to fetch
dow sqlcode = 0;
  exec sql
    fetch c1 into :customer;

  if sqlcode = 0;
    // Display each field using DSPly
    dsply ('ID: ' + %char(customer.id));
    dsply ('Name: ' + customer.name);
    dsply ('Email: ' +customer.email);
    dsply ('---') ' ' response;
  endif;
enddo;

// Close the cursor
exec sql
  close c1;

*inlr = *on;