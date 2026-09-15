**free
ctl-opt dftactgrp(*no) option(*srcstmt : *nodebugio);

// The RPG Blend Academy - Coffee Company
// Module 2: Db2 for i and SQL-Centered Development
// Data-access demonstration only. Development source: live validation pending.
// Raw SQL diagnostics and persistence-specific Y/N representation remain
// inside this implementation boundary.

exec sql
   set option commit = *none,
              closqlcsr = *endmod;

// Application-facing snapshot shape intentionally aligns with the facts
// Module 3 Domain Services consume. The database table/view is free to use
// different physical SQL types where the Data Service translates them.
dcl-ds ProductData_t qualified template;
   productId packed(9 : 0);
   unitPrice packed(9 : 2);
   quantityAvailable packed(9 : 0);
   active ind;
end-ds;

dcl-ds ProductLookupResult_t qualified template;
   success ind;
   found ind;
   status varchar(20);
   product likeds(ProductData_t);
end-ds;

dcl-pr LoadProduct likeds(ProductLookupResult_t);
   productId packed(9 : 0) const;
end-pr;

dcl-s requestedProductId packed(9 : 0) inz(2001);
dcl-ds lookup likeds(ProductLookupResult_t);

lookup = LoadProduct(requestedProductId);

dsply lookup.status;
if lookup.found;
   dsply ('Product: ' + %char(lookup.product.productId));
   dsply ('Price: ' + %char(lookup.product.unitPrice));
endif;

*inlr = *on;
return;

dcl-proc LoadProduct;
   dcl-pi *n likeds(ProductLookupResult_t);
      productId packed(9 : 0) const;
   end-pi;

   dcl-ds result likeds(ProductLookupResult_t);

   // Persistence-facing host variables. These mirror the SQL-facing shape,
   // then are translated into the application-facing ProductData_t contract.
   dcl-s dbProductId int(10);
   dcl-s dbUnitPrice packed(9 : 2);
   dcl-s dbQuantityAvailable int(10);
   dcl-s dbActive char(1);

   clear result;

   exec sql
      select PRODUCT_ID,
             UNIT_PRICE,
             QUANTITY_AVAILABLE,
             ACTIVE
        into :dbProductId,
             :dbUnitPrice,
             :dbQuantityAvailable,
             :dbActive
        from RPGBA_CC.V_PRODUCT_SNAPSHOT
       where PRODUCT_ID = :productId;

   select;
      when SQLCOD = 0;
         result.success = *on;
         result.found = *on;
         result.status = 'FOUND';
         result.product.productId = dbProductId;
         result.product.unitPrice = dbUnitPrice;
         result.product.quantityAvailable = dbQuantityAvailable;
         result.product.active = (dbActive = 'Y');
      when SQLCOD = 100;
         result.success = *on;
         result.found = *off;
         result.status = 'NOT_FOUND';
      other;
         // Support diagnostics may record SQLCOD/SQLSTT through an approved path,
         // but those values are not returned as the application contract.
         result.success = *off;
         result.found = *off;
         result.status = 'DATA_ERROR';
   endsl;

   return result;
end-proc;
