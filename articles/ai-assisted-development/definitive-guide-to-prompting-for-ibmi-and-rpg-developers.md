The Definitive Guide to Prompting for IBM i and RPG Developers
The RPG Blend - George VanEaton
________________________________________
First Sip
Today’s coffee is Bones Dragonfire Coffee. Strong. Direct. No apology.
Prompting an AI system is not magic. It is not luck. It is not typing vague requests and hoping for brilliance.
It is engineering.
If you are an IBM i developer or a technical leader, prompting is not a novelty skill. It is a force multiplier. Used well, it accelerates analysis, documentation, refactoring, testing, onboarding, and even leadership thinking.
Used poorly, it produces confident nonsense.
This guide is not about “AI tricks.”
It is about disciplined thinking applied through prompts.
________________________________________
Why This Guide Exists
Most AI prompting guides assume:
•	You write Python.
•	You deploy to the cloud.
•	Your database is disposable.
•	Your codebase is five years old.
That is not your world.
You work with:
•	ILE RPG
•	CLLE
•	DB2 for i
•	Service programs
•	Activation groups
•	20+ years of accumulated business logic
•	Systems that process millions of dollars before noon
You do not have the luxury of vague output.
This guide is written for IBM i developers using:
•	GitHub Copilot in VS Code
•	IBM BOB (Bob-IDE)
•	ChatGPT or Claude
________________________________________
Prompting for Dummies (The Version I’m Building)
I’m currently working on something I half-jokingly call “Prompting for Dummies.”
Not because developers are dumb.
But because most prompting advice is either:
•	Overly academic
•	Overly generic
•	Or written for developers who do not live in IBM i
What I want to build — and what this article begins — is a grounded, practical guide for:
•	RPG developers who have never touched AI
•	Senior engineers who are skeptical
•	Managers who want structured usage
•	Teams who want standards
No hype.
No fear.
No hand-waving.
Just:
•	What to say
•	Why to say it
•	What to expect
•	And how to verify the result
If you can write a program spec, you can write a prompt.
________________________________________
The Most Important Rule
You must know what you are asking.
If you do not understand:
•	The business rule
•	The technical constraint
•	The dialect (fixed vs free)
•	The performance expectation
•	The deployment context
Then you cannot write a strong prompt.
AI does not replace clarity.
It amplifies it.
________________________________________
What AI Actually Is (and Isn’t)
AI language models are pattern predictors trained on large volumes of text.
They:
•	Do not know your *LIBL
•	Do not see your job description
•	Do not understand your company standards unless you tell them
•	Can be confidently wrong
Think of AI as a very fast junior developer.
Smart.
Well-read.
Zero IBM i production experience.
You are still the architect.
________________________________________

Why Prompting Matters on IBM i
IBM i shops have:
•	Large codebases
•	Long-lived business rules
•	Deep domain logic
•	Limited developer bandwidth
•	A mix of modern and legacy patterns
AI can help. But only if you direct it properly.
Here’s the truth:
AI reflects the clarity of your thinking.
If your request is vague, the output will be vague.
If your intent is fuzzy, the code will be fuzzy.
If you don’t know what you’re asking for, neither will the system.
This is not a tool problem.
It is a specification problem.
________________________________________
The Foundational Rule: You Must Know What You’re Asking
Before you write a prompt, answer these questions:
•	What problem am I solving?
•	What constraints matter?
•	What style standards apply?
•	What environment does this run in?
•	What risks must be avoided?
•	Who will maintain this?
If you cannot answer those questions, stop.
AI does not replace engineering clarity. It amplifies it.
________________________________________
Weak vs Strong Prompting
Weak Prompt
Generate an RPG IV program that reads a DB2 customer file, outputs the top 10 customers by revenue, handles null values, and includes detailed comments explaining each step.
This sounds specific. It isn’t.
It leaves open:
•	SQL vs native I/O?
•	Embedded SQL or cursor?
•	Fully free format?
•	Error handling expectations?
•	Production or demo code?
•	Performance considerations?
•	What version of IBM i?
•	Should it log errors?
•	Should it modularize logic?
You will get something plausible.
But you will not get something production-ready.
________________________________________
A Strong Engineering Prompt
Here is a stronger version:
Generate a fully free-form RPG IV program (IBM i 7.4 compatible) that uses embedded SQL to retrieve the top 10 customers by total revenue from table CUSTMAST.
Requirements:
•	Use GROUP BY and ORDER BY DESC in SQL
•	Handle possible null revenue values using COALESCE
•	Include SQL error handling using SQLSTATE
•	Modularize logic into procedures (GetTopCustomers, DisplayResults)
•	Use modern DCL-S and DCL-PR syntax
•	Include meaningful comments explaining intent, not obvious syntax
•	Avoid fixed format code
•	Assume this will run in batch
•	Follow clean code practices suitable for production
Also include a brief explanation of architectural decisions at the end.
That is engineering.
You defined:
•	Platform version
•	Language style
•	I/O approach
•	Error handling expectations
•	Code organization
•	Execution context
•	Quality bar
Now the AI has constraints.
Constraints produce quality.
________________________________________
The Prompt Engineering Framework
Use this structure when building serious prompts:
1. Define the Role
Tell the system who it should act as.
Examples:
•	“Act as a senior IBM i architect.”
•	“Act as an RPG modernization consultant.”
•	“Act as a code reviewer focused on maintainability.”
•	“Act as a QA engineer writing unit tests.”
Role definition changes output quality dramatically.
AI without a role defaults to generic internet tone.
You want professional specificity.
________________________________________
2. Define the Objective
Be precise.
Not:
•	“Help modernize this.”
Instead:
•	“Refactor this fixed-format RPG into fully free format while preserving behavior and improving readability.”
Clarity drives accuracy.
________________________________________
3. Define the Environment
IBM i is not generic development.
Specify:
•	OS version (7.3, 7.4, 7.5)
•	Embedded SQL vs native I/O
•	Commitment control?
•	Batch vs interactive
•	VS Code tooling?
•	Project Bob?
•	Service programs?
Environment context prevents bad assumptions.
________________________________________
4. Define Constraints
This is where professionals separate from hobbyists.
Examples:
•	“Do not change database schema.”
•	“Preserve existing field names.”
•	“No third-party tools.”
•	“Maintain backward compatibility.”
•	“Performance must support 1M+ records.”
Constraints sharpen output.
________________________________________
5. Define Output Format
Do you want:
•	Code only?
•	Code + explanation?
•	Bullet list analysis?
•	Step-by-step migration plan?
•	Risk assessment?
If you don’t define format, you’ll get generic paragraphs.
________________________________________
Using ChatGPT to Build Better Prompts
Here’s the part most people miss.
You can use AI to help you refine the prompt itself.
But you must already understand the domain.
Step 1: Draft Your Initial Intent
Example:
I need help modernizing a legacy RPG program that calculates commissions.
That’s vague. But it’s a starting point.
________________________________________
Step 2: Ask the AI to Improve the Prompt
Example:
Help me refine this into a strong engineering prompt for refactoring a legacy RPG commission calculation program.
Now the AI becomes a thinking partner.
It might ask:
•	What IBM i version?
•	Is it fixed or free format?
•	Does it use native I/O?
•	Are there performance constraints?
•	Are there audit requirements?
This forces you to clarify your thinking.
That is the value.
________________________________________
Step 3: Refine with Iteration
Prompt building is iterative.
You might move from:
•	“Modernize this program.”
To:
•	“Refactor fixed-format RPG III commission calculation program into fully free RPG IV using embedded SQL where appropriate, preserving business rules, adding structured error handling, and improving readability without changing database schema.”
Now you are thinking like an architect.
AI helped you ask better questions.
But you still had to understand the system.
________________________________________
The Discipline of Knowing
Here is the uncomfortable truth:
If you do not understand:
•	SQL fundamentals
•	Null handling
•	Transaction scope
•	Modular design
•	Error management
•	Performance implications
You cannot write strong prompts.
And you cannot validate the output.
AI is not a substitute for competence.
It is a leverage tool for competent engineers.
________________________________________
Advanced Prompting Techniques
Comparative Prompts
Compare native I/O vs embedded SQL for this workload on IBM i 7.4. Provide performance, maintainability, and modernization tradeoffs.
Excellent for architectural thinking.
________________________________________
Code Review Prompts
Act as a senior RPG reviewer. Identify maintainability risks, hidden bugs, and modernization opportunities in this code.
You get structured critique.
________________________________________
Teaching Prompts
Explain why this null handling approach is risky in DB2 for i and provide a safer alternative.
Great for mentoring junior developers.
________________________________________
Risk Analysis Prompts
Identify potential production risks if this program runs in a high-volume nightly batch.
Now you're using AI as a second brain.
________________________________________
Common Prompting Mistakes
1. Vague Requests
“Improve this.”
Improve what?
Performance? Readability? Structure?
Be specific.
________________________________________
2. Blind Trust
Never paste output directly into production.
Review it.
Test it.
Understand it.
You are still responsible.
________________________________________
3. Tool Obsession
Prompting is not about ChatGPT vs Copilot vs anything else.
It’s about structured thinking.
Tools change.
Engineering discipline does not.
________________________________________
For Managers: Teaching Your Team to Prompt Well
If you lead developers:
•	Require clear prompts.
•	Encourage iterative refinement.
•	Have them explain why the output is correct.
•	Review prompts during code reviews.
•	Use AI for learning, not shortcuts.
A team that can prompt well:
•	Documents better
•	Designs better
•	Thinks more clearly
•	Modernizes responsibly
This is a leadership opportunity.
________________________________________
Prompting and Modernization
Modernization is not:
•	“Convert everything to something else.”
•	“Adopt whatever is trending.”
•	“Replace because it’s old.”
Modernization is:
•	Improving clarity
•	Reducing risk
•	Increasing adaptability
•	Strengthening skills
AI can accelerate modernization.
But only when guided by engineers who respect:
•	Backward compatibility
•	Business rules
•	Operational stability
Stability and innovation are not opposites.
They are engineering constraints.
________________________________________
The Real Skill Being Built
Prompting is not about talking to a machine.
It is about:
•	Writing precise specifications
•	Thinking in constraints
•	Structuring intent
•	Clarifying assumptions
•	Defining quality
Those are leadership skills.
Those are architecture skills.
Those are senior engineer skills.
AI simply exposes whether you have them.
________________________________________
A Practical Prompt Template for IBM i Developers
Use this as a starting structure:
Role:
Act as a senior IBM i / RPG architect.
Objective:
[Describe the exact task.]
Environment:
IBM i version, language style, execution context.
Constraints:
What must not change? What standards apply?
Quality Requirements:
Error handling, modularity, performance, documentation.
Output Format:
Code only? Code + explanation? Step plan?
Clarity in. Quality out.
________________________________________
Final Sip
Today’s cup of Bones Dragonfire Coffee is empty.
Prompting is not about getting answers faster.
It is about thinking better.
If you want better output, ask better questions.
If you want better questions, deepen your understanding.
That is the real modernization.
AI is not modernization.
Clear thinking is.
And that has always been the real edge on IBM i.


