AI Code Reviews on IBM i: Teaching the Machine to Taste Good Code
First Sip – Today’s Coffee
Today’s coffee is Kauai Coffee — Banana Crème.
Medium roast. Smooth body. Notes of banana and creamy vanilla.
It’s the kind of coffee that surprises you. At first sip, you think it might be too sweet. But then the roast balances it out and suddenly the flavor works.
Good code reviews are like that.
At first, they can feel uncomfortable. Too detailed. Too picky. Too many rules.
But once the structure is right, they balance quality, maintainability, and team learning.
And now that many teams are experimenting with AI-assisted code reviews, the real question becomes:
How do you teach the machine what good IBM i code actually looks like?
________________________________________
The Problem with AI Code Reviews
Most AI tools can review modern languages fairly well.
But IBM i environments are different.
They have:
•	RPG
•	Embedded SQL
•	Legacy code patterns
•	Business rules buried in decades of logic
•	Enterprise standards that are often undocumented
Without clear guidance, an AI reviewer might miss critical issues like:
•	Missing SQLCODE checks
•	Incorrect PATNO + CYCLE joins
•	Legacy EXSR / BEGSR patterns
•	Hardcoded libraries
•	Violations of commitment control rules
In other words, the AI may comment on formatting…
…but miss the things that break production systems.
That’s why the most important step is teaching the AI your standards.
________________________________________
Brewing a Code Review Standard
At MEDHOST, enterprise code standards cover multiple layers:
Layer	What It Covers
RPG Standards	Free-format RPG, procedures, error handling
SQL Standards	SQLCODE checks, cursor handling, commit control
IBM i Platform Rules	Library usage, activation groups, authority
Security	PHI protection, logging standards
Project Rules	Price Transparency requirements
Instead of asking AI:
“Review this code.”
You give it a structured prompt and checklist.
Something like this:
Review this IBM i RPG program using MEDHOST development standards.

Check for:
- 100% free-format RPG
- SQLCODE checks after every SQL statement
- No WHENEVER clauses
- MONITOR/ON-ERROR error handling
- Named indicators only
- No hardcoded libraries
- Proper commitment control
This immediately improves the quality of the review.
But it gets even better when you give AI a formal review template.
________________________________________
The AI Code Review Template
Here is the structure we use for structured reviews.
RPG Standards
Free-format RPG, procedure structure, exception handling
SQL Standards
SQLCODE checks, cursor handling, commit control discipline
IBM i Platform Rules
Library list usage, activation groups, object authority
Security Standards
PHI protection, logging requirements, secure input handling
Project Rules
Price Transparency regulatory requirements
________________________________________
Compliant Areas
Example:
•	Uses 100% free-format RPG
•	Proper MONITOR / ON-ERROR handling
•	SQLCODE checks after every SQL statement
•	Modern BIF usage
________________________________________
Standards Violations
Issues are categorized by severity.
Severity	Meaning
🔴 Critical	Security or data corruption risk
🟡 Major	Maintainability or standards violation
🟢 Minor	Style or documentation
Example critical issues:
•	Missing SQL error checks
•	SQL injection risk
•	Hardcoded credentials
•	Incorrect database joins
________________________________________
Example Finding
Here’s a real example of the kind of problem AI can detect when trained properly.
Finding: Missing CYCLE Field in Join
Severity: Critical
Impact: Incorrect payment matching across billing cycles.
Current Code:
EXEC SQL 
  SELECT e.allowed_amount
  FROM detailcharges e
  INNER JOIN charges a ON e.id = a.id
  WHERE a.code = :billingCode;
Corrected Code:
EXEC SQL 
  SELECT e.allowed_amount
  FROM detailcharges e
  INNER JOIN acc charges a 
    ON e.id = a.id  
   AND e.cycle = a.cycle
  WHERE a.code = :billingCode;
Without the CYCLE field, payments from different billing cycles can be incorrectly matched.
That’s not a style issue.
That’s a data integrity problem.
________________________________________
The Compliance Score
To keep reviews objective, we calculate a standards compliance score.
Issue Type	Penalty
Critical	-10 points
Major	-5 points
Minor	-2 points
Score ranges:
Score	Meaning
95-100%	Production ready
85-94%	Minor fixes
75-84%	Address major issues
65-74%	Significant rework
<65%	Do not promote
This creates consistent reviews across teams.
________________________________________
Why This Matters for Managers
As a development manager, code reviews are not just about finding bugs.
They are about:
•	Protecting production systems
•	Teaching standards to junior developers
•	Reducing technical debt
•	Ensuring regulatory compliance
AI will not replace human reviewers.
But it can become a powerful first pass.
It catches:
•	Standards violations
•	security risks
•	documentation gaps
•	SQL mistakes
And it does it in seconds.
That gives senior developers more time to focus on architecture and design.
________________________________________
Pro Tips for Using AI Code Reviews
1. Give AI your standards first
AI without standards produces shallow reviews.  AI code assistants work great with rules.  Tell your assistant, GitHub Copilot or IBM BOB to use a rules folder that has all of your standards in a md file.
________________________________________
2. Use structured templates
Consistency improves accuracy.
________________________________________
3. Always review AI findings
AI is an assistant, not the final authority.  If you don’t agree with the results, tell it and then tell it why.
________________________________________
4. Focus humans on critical thinking
Let AI check standards.
Let developers evaluate design decisions.
________________________________________
Integrating AI Into Code Review
AI works best as a pre-review step.
Stage	AI Role	Human Role
Development Complete	Run AI syntax review	Developer resolves basic issues
Peer Review	AI flags mechanical issues	Developer validates architecture
Technical Lead Review	AI highlights potential performance concerns	Lead validates design
Release Approval	AI documentation noted	Governance verification
AI reduces noise.
Human reviewers focus on the decisions that matter.
________________________________________

Final Sip
Kauai’s Banana Crème roast works because the sweetness and the roast balance each other.
Good development teams work the same way.
Standards provide structure.
Developers provide judgment.
And when you combine human experience with AI tools, you get something powerful:
A team that ships cleaner code, faster, while still protecting the systems that hospitals, businesses, and patients rely on every day.
That’s the blend.
Real code.
Real coffee.
No nonsense.
— George VanEaton

