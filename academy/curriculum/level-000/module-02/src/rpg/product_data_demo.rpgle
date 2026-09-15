**free
ctl-opt dftactgrp(*no) option(*srcstmt : *nodebugio);

// The RPG Blend Academy - Coffee Company
// Module 2: Db2 for i and SQL-Centered Development
// Data-access demonstration only. Development source: live validation pending.
// Raw SQL diagnostics remain inside this implementation boundary.

exec sql
   set option commit = *none,
              closqlcsr = *endmod;

dcl-ds ProductData_t qualified template;
   productId int(10);
   unitPrice packed(9 : 2);
   quantityAvailable int(10);
   active char(1);
end-ds;

dcl-ds ProductLookupResult_t qualified template;
   success ind;
   found ind;
   status varchar(20);
   product likeds(ProductData_t);
end-ds;

dcl-pr LoadProduct likeds(ProductLookupResult_t);
   productId int(10) const;
end-pr;

dcl-s requestedProductId int(10) inz(2001);
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
      productId int(10) const;
   end-pi;

   dcl-ds result likeds(ProductLookupResult_t);

   clear result;

   exec sql
      select PRODUCT_ID,
             UNIT_PRICE,
             QUANTITY_AVAILABLE,
             ACTIVE
        into :result.product.productId,
             :result.product.unitPrice,
             :result.product.quantityAvailable,
             :result.product.active
        from RPGBA_CC.V_PRODUCT_SNAPSHOT
       where PRODUCT_ID = :productId;

   select;
      when SQLCOD = 0;
         result.success = *on;
         result.found = *on;
         result.status = 'FOUND';
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
