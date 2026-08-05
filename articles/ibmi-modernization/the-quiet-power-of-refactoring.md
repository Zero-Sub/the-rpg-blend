☕ The Quiet Power of Refactoring: Modernizing Without Rewriting

Today’s Coffee: Starbucks Single-Origin Sumatra Dark Roast — bold, deep, and quietly powerful.
Just like great refactoring.

Overview

Modernization isn’t always about rewriting everything from scratch.
In many IBM i environments, rewriting 30 years of RPG code isn’t practical — or necessary.

Refactoring offers a smarter approach. It’s the quiet, methodical process of improving existing code without changing what it does. When done consistently, refactoring builds technical health, reduces risk, and sets the stage for larger modernization efforts.

Why Refactoring Matters

Legacy (or rather, legendary) RPG systems work — but they often hide technical debt:

Cryptic variable names and fixed-format code.

Copy-pasted logic repeated in dozens of programs.

Programs so large that testing feels impossible.

Refactoring doesn’t erase that history — it evolves it.

Benefits:

Easier onboarding for new developers.

More reliable enhancements and fewer regressions.

Incremental modernization instead of risky rewrites.

Refactoring Principles for RPG Developers
1. Start Small

Focus on one routine, one file, or one data structure.
Clean, test, and commit. Don’t wait for the mythical “big rewrite.”

2. Preserve Behavior

Your goal isn’t new functionality.
Use regression tests or before/after comparisons to ensure identical output.

3. Modernize Structure, Not Just Syntax

Free-form RPG is great—but structure matters more.
Extract business logic into procedures, remove side effects, and clarify data flow.

4. Introduce Unit Testing

Leverage modern IBM i testing frameworks (like RPGUnit, ILEunit, or pytest for SQL procedures) to validate behavior.
Testing is the backbone of safe refactoring.

5. Involve QA Early

Refactoring isn’t just for developers.
QA can:

Identify repeatable test cases.

Verify consistency across legacy and refactored code.

Catch subtle data integrity issues early.

Example: From Tightly Coupled to Testable
Before
C     READ ORDERHDR
C     IF %EOF()
C       RETURN
C     ENDIF

C     IF CUSTTYPE = 'P'
C       DISCAMT = ORDERTOTAL * .1
C     ELSE
C       DISCAMT = 0
C     ENDIF

C     UPDATE ORDERHDR

After
DCL-PROC ProcessOrder;
  DCL-PI *N; order CHAR(10); END-PI;

  orderData = GetOrder(order);
  discountAmount = CalculateDiscount(orderData.customerType : orderData.total);
  UpdateOrder(orderData : discountAmount);

END-PROC;


You haven’t changed what the program does — only how it’s structured.
It’s easier to read, test, and extend.

Refactoring Checklist

 Code is free-form and consistently indented

 Variables and procedures have clear, business-focused names

 Error handling uses standard routines

 Unit tests validate functional behavior

 QA confirms output equivalence

 Code is committed in small, testable increments

The Leadership Angle

Modernization initiatives often stall because they’re too big.
Refactoring shifts the mindset from “rewrite everything” to “improve something every day.”

Encourage developers to leave every module slightly better than they found it.
That’s how modernization scales — one commit at a time.

Final Sips

Refactoring is like a good cup of Sumatra — rich, balanced, and built with depth.
You don’t need to start over to make it better.
You just need to refine what’s already working.
