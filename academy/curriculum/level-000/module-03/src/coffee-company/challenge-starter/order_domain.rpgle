**free
ctl-opt nomain option(*srcstmt : *nodebugio);

// The RPG Blend Academy - Coffee Company
// Module 3 independent challenge starter.
// This source intentionally does NOT reject inactive products.
// The learner must implement that requirement and prove the result.

/include 'order_domain_contracts.rpgleinc'

dcl-pr CalculateDiscount packed(11 : 2);
   orderAmount packed(11 : 2) const;
end-pr;

dcl-proc EvaluateOrder export;
   dcl-pi *n;
      request likeds(OrderRequest_t) const;
      product likeds(ProductSnapshot_t) const;
      decision likeds(OrderDecision_t);
   end-pi;

   dcl-s subtotal packed(11 : 2) inz(0);

   clear decision;
   decision.unitPrice = product.unitPrice;

   if request.quantity <= 0;
      decision.resultCode = ORDER_INVALID_QUANTITY;
      decision.message = 'Order quantity must be greater than zero.';
      return;
   endif;

   if request.productId <> product.productId;
      decision.resultCode = ORDER_PRODUCT_MISMATCH;
      decision.message = 'Requested product does not match product context.';
      return;
   endif;

   // Independent challenge gap:
   // The product.active business rule has not yet been implemented.

   if request.quantity > product.quantityAvailable;
      decision.resultCode = ORDER_INSUFFICIENT_QTY;
      decision.message = 'Insufficient quantity is available.';
      return;
   endif;

   subtotal = %dech(product.unitPrice * request.quantity : 11 : 2);

   decision.allowed = *on;
   decision.resultCode = ORDER_OK;
   decision.discountAmount = CalculateDiscount(subtotal);
   decision.finalTotal = subtotal - decision.discountAmount;
   decision.message = 'Order is allowed.';
end-proc;

dcl-proc CalculateDiscount;
   dcl-pi *n packed(11 : 2);
      orderAmount packed(11 : 2) const;
   end-pi;

   dcl-s discountRate packed(5 : 4) inz(0);

   select;
      when orderAmount >= 1000;
         discountRate = 0.1000;
      when orderAmount >= 500;
         discountRate = 0.0500;
      other;
         discountRate = 0;
   endsl;

   return %dech(orderAmount * discountRate : 11 : 2);
end-proc;
