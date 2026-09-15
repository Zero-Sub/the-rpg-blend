**free
ctl-opt dftactgrp(*no);

// The RPG Blend Academy - Coffee Company
// Module 3 independent challenge starter caller.
// The product is deliberately inactive so the pre-change behavior can be observed.

/include 'order_domain_contracts.rpgleinc'

dcl-ds request likeds(OrderRequest_t);
dcl-ds product likeds(ProductSnapshot_t);
dcl-ds decision likeds(OrderDecision_t);

request.customerId = 1001;
request.productId = 2001;
request.quantity = 2;

product.productId = 2001;
product.unitPrice = 275.00;
product.quantityAvailable = 10;
product.active = *off;

EvaluateOrder(request : product : decision);

dsply decision.resultCode;
dsply decision.message;

if decision.allowed;
   dsply ('Final total: ' + %char(decision.finalTotal));
endif;

*inlr = *on;
return;
