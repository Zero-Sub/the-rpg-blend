☕ Today’s Coffee: Starbucks Sumatra Dark Roast — bold, structured, and perfectly balanced. Like good architecture, it layers complexity without losing clarity.
________________________________________
Why MVC Still Matters — Especially on IBM i
Most IBM i systems didn’t start with architecture — they started with necessity.
Over the years, programs grew by accretion: more lines, more indicators, more conditions stacked on top of old business logic. The result? Monolithic RPG programs that do everything — database reads, calculations, validation, display, and file updates — all tangled together.
That worked when the system had a single terminal and a small dev team.
It doesn’t work now.
Modern RPG development needs structure — a way to separate responsibilities so code is easier to maintain, test, and eventually modernize into services or APIs.
That’s where the Model-View-Controller (MVC) pattern comes in.
________________________________________
The MVC Mindset on IBM i
Let’s translate MVC into RPG terms:
Layer	IBM i Equivalent	Purpose
Model	Database logic (SQL, data validation, I/O modules)	Handles data access, rules, and persistence.
View	Display files (DSPF), web UI, or API responses	Presents data to users or other systems.
Controller	Business logic layer (RPGLE service programs, procedures)	Coordinates between the model and view; enforces workflow.
Think of it this way:
•	The Model says what the data is and how it’s stored.
•	The Controller says what to do with that data.
•	The View says how to show it.
When you separate these, modernization stops being a rewrite — it becomes reassembly.
________________________________________
How to Apply MVC to Existing RPG Systems
You don’t need to start from scratch. You can layer MVC into your existing programs.
1. Start by Extracting the Model
Most RPG programs have file I/O mixed with business logic. Begin by isolating that logic into dedicated procedures or service programs:
// Model: OrderModel.rpgle
dcl-proc GetOrderTotal;
  dcl-pi *n packed(9:2);
    orderId char(10);
  end-pi;

  dcl-s total packed(9:2);
  exec sql select sum(LineTotal)
           into :total
           from OrderLines
           where OrderNo = :orderId;

  return total;
end-proc;
This becomes a reusable component — your data layer. No UI logic. No file displays. Just business data.
________________________________________
2. Separate the Controller
The controller coordinates actions — it decides what to fetch, validate, or update. This is where most existing RPG logic belongs, once cleaned up:
// Controller: OrderController.rpgle
dcl-proc ProcessOrder;
  dcl-pi *n;
    orderId char(10);
  end-pi;

  dcl-s total packed(9:2);

  total = GetOrderTotal(orderId);
  if total > 1000;
    ApplyDiscount(orderId: 0.10);
  endif;

  UpdateOrderSummary(orderId: total);
end-proc;
This is your workflow logic. The controller doesn’t care about how data is displayed — it just makes sure the business process runs correctly.
________________________________________
3. Modernize the View
Your “view” could still be a DSPF, but it doesn’t have to be. This is where modernization can evolve:
•	Start with RPG + DSPF, using subfiles for structured presentation.
•	Move toward RPG with APIs, where the “view” is a JSON response for a web UI.
•	Eventually, use RPG for backend logic and React/Angular/Vue for frontends.
The point isn’t what you use — it’s that the view stays separate from your model and controller.
________________________________________
The Payoff
1.	Faster Testing: Each layer can be tested independently. You can unit test your Models without touching UI logic.
2.	Easier Maintenance: Fixing a display file no longer risks corrupting database logic.
3.	Reusability: The same Model and Controller logic can serve multiple UIs — green screen, API, or web app.
4.	Modernization Path: Once your layers are cleanly separated, you can migrate one layer at a time — start with the View, or build APIs on top of existing Controllers.
________________________________________
A Real Example: Splitting the Monolith
Before:
•	One 5,000-line RPG program handles order entry, validation, discount logic, and display.
•	Any change to a field requires recompiling the whole program.
•	Testing means running the full application.
After applying MVC:
•	OrderModel handles database access.
•	OrderController manages order workflow.
•	OrderDisplay (DSPF) or OrderAPI (JSON) handles presentation.
A single field size change becomes a database + model update — not a system-wide crisis.
________________________________________
Adding QA and Unit Testing
When code follows MVC, testing becomes possible — and practical.
You can unit test the Model procedures using test harnesses or custom test drivers.
You can perform QA validations on Controller behavior independently of UI tests.
And you can automate all of it, because logic is now modular instead of monolithic.
Testing isn’t an afterthought — it’s the natural consequence of good structure.
________________________________________
Final Sips
☕ As I sip Starbucks Sumatra Dark Roast, I’m reminded why architecture matters.
Good coffee, like good code, is about balance. Strength without bitterness. Complexity without confusion.
MVC gives IBM i developers a proven way to modernize — not by throwing away what works, but by organizing it for the future.
Don’t aim for flashy rewrites. Aim for clarity, composability, and confidence.
That’s what modern IBM i development really means.
________________________________________
Follow The RPG Blend for real code, real coffee, and real modernization.
📖 Blog
📂 GitHub
💼 LinkedIn

