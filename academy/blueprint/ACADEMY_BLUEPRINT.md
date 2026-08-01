# The RPG Blend Academy Blueprint

**Status:** Master curriculum plan  
**Owner:** George Van Eaton  
**Repository:** `Zero-Sub/the-rpg-blend`  
**Tagline:** Real Code. Real Coffee. No Nonsense.

---

## 1. Mission

The RPG Blend Academy prepares developers to understand, support, build, and modernize real IBM i business applications using RPG, Db2 for i, SQL, disciplined engineering practices, and responsible AI assistance.

The Academy is not a collection of disconnected articles. It is a structured learning system that moves a student from first exposure to independent contribution, modernization capability, technical mentoring, and platform leadership.

## 2. Vision

Create the definitive learning pathway for IBM i and RPG developers by combining:

- beginner-friendly technical instruction
- production-quality examples
- legacy maintenance literacy
- modern RPG and SQL development
- VS Code, Git, and DevOps practices
- responsible AI-assisted development
- architecture and modernization guidance
- engineering leadership and mentoring

The long-term goal is for the Academy to become a trusted public learning resource, an internal associate-developer onboarding system, a conference and workshop platform, and the foundation for future books and courses.

## 3. Founder and Lead Instructor

The RPG Blend Academy was created by **George Van Eaton**, an IBM i engineering leader with more than 30 years of experience in RPG, Db2 for i, SQL, software architecture, modernization, production support, technical standards, hiring, and developer development.

George is the author of *The RPG Blend* and a contributing author to the IBM Redbooks work-in-progress publication *Modernizing IBM i Applications*.

The Academy translates real enterprise experience into a repeatable development curriculum for new developers, experienced modernizers, mentors, and engineering leaders.

## 4. Academy Promise

Every Academy lesson will be:

- technically accurate
- beginner friendly
- professionally written
- practical and immediately usable
- connected to a real business application
- explicit about legacy versus preferred modern practice
- supported by authoritative technical sources
- reviewed for production relevance

Students will learn not only how syntax works, but why the technique exists, where companies use it, what can fail in production, and how a professional developer should review and support it.

## 5. Audience Personas

### Persona A — Associate RPG Developer

**Background:** College graduate, boot camp graduate, or entry-level developer with little or no RPG experience.  
**Needs:** IBM i orientation, safe development habits, code-reading skills, guided labs, and clear feedback.  
**Target outcome:** Complete supervised changes safely and explain the impact of the change.

### Persona B — Developer Transitioning from Another Language

**Background:** Experience with Java, C#, JavaScript, Python, COBOL, or another business language.  
**Needs:** Translation between familiar concepts and IBM i terminology, architecture, RPG syntax, native I/O, SQL, and the IBM i object model.  
**Target outcome:** Become productive without carrying inaccurate assumptions from another platform.

### Persona C — Traditional RPG Developer Modernizing Skills

**Background:** Strong fixed-format RPG, DDS, SEU, native I/O, and production-support experience.  
**Needs:** Fully free-form RPG, SQL, procedures, service programs, Git, VS Code, testing, APIs, DevOps, and AI-assisted workflows.  
**Target outcome:** Modernize incrementally without losing operational knowledge.

### Persona D — Technical Mentor or Team Lead

**Background:** Experienced developer responsible for reviews, mentoring, standards, and delivery.  
**Needs:** A repeatable teaching model, code-review expectations, labs, assessments, and modernization decision tools.  
**Target outcome:** Develop other engineers consistently and reduce knowledge concentration.

### Persona E — Engineering Manager or Architect

**Background:** Responsible for platform strategy, staffing, risk, architecture, modernization, and investment decisions.  
**Needs:** A clear capability model, modernization roadmap, governance standards, metrics, and internal adaptation guidance.  
**Target outcome:** Build a sustainable IBM i engineering organization.

## 6. Learning Progression

```text
IBM i newcomer
    ↓
Platform-aware learner
    ↓
RPG code reader
    ↓
Supervised associate developer
    ↓
Independent RPG and SQL developer
    ↓
Modernization engineer
    ↓
Technical mentor
    ↓
Platform architect or engineering leader
```

Progression is based on demonstrated capability, not simply lesson completion.

## 7. Curriculum Levels

| Level | Name | Primary Outcome |
|---|---|---|
| 000 | Orientation | Understand IBM i, RPG, development tools, source flow, and business context |
| 100 | Associate Foundations | Read code, make supervised changes, perform basic I/O, and debug safely |
| 200 | Professional RPG Development | Build modular, maintainable RPG and SQL applications independently |
| 300 | IBM i Modernization | Modernize database access, architecture, interfaces, tooling, and delivery practices |
| 400 | Technical Leadership | Lead standards, architecture, mentoring, production readiness, and modernization strategy |

## 8. Complete Lesson Catalog

The initial catalog contains **75 lessons**. Lesson numbering may evolve, but each lesson must retain a stable identifier after publication.

### Level 000 — Orientation

#### Module 000-00 — Getting Started with RPG and Coffee

1. `000-00-01` Welcome to the RPG Blend Academy
2. `000-00-02` What IBM i Is and Why Businesses Use It
3. `000-00-03` IBM i, AS/400, iSeries, and System i Terminology
4. `000-00-04` Libraries, Objects, Members, Jobs, and Subsystems
5. `000-00-05` What RPG Is and How the Language Evolved
6. `000-00-06` The IBM i Application Development Lifecycle
7. `000-00-07` Connecting with VS Code and Code for IBM i
8. `000-00-08` Navigating Source in the IFS and Source Physical Files
9. `000-00-09` Your First Fully Free-Form RPG Program
10. `000-00-10` Compiling, Running, and Reading Job Messages
11. `000-00-11` Introduction to Git and the Academy Repository
12. `000-00-12` Using AI Responsibly as an IBM i Learner
13. `000-00-13` Module 0 Lab and Skills Check

### Level 100 — Associate Foundations

#### Module 100-01 — Reading and Writing Modern RPG

14. `100-01-01` Anatomy of a Fully Free-Form RPG Program
15. `100-01-02` Control Options and Program Entry
16. `100-01-03` Variables, Constants, Initialization, and Scope
17. `100-01-04` Character, Numeric, Indicator, Date, Time, and Timestamp Types
18. `100-01-05` Assignment, Expressions, and Operators
19. `100-01-06` Built-In Functions for Character Data
20. `100-01-07` Built-In Functions for Numeric Data
21. `100-01-08` Built-In Functions for Dates and Time
22. `100-01-09` IF, ELSEIF, ELSE, and SELECT
23. `100-01-10` DOW, DOU, and FOR Loops
24. `100-01-11` Error-Prone Patterns and Defensive Coding
25. `100-01-12` Module Lab — Coffee Product Pricing

#### Module 100-02 — Data Structures and Procedures

26. `100-02-01` Why Data Structures Matter
27. `100-02-02` Qualified and Nested Data Structures
28. `100-02-03` Arrays and Data Structure Arrays
29. `100-02-04` Templates, LIKEDS, LIKE, and POS
30. `100-02-05` Subroutines Versus Subprocedures
31. `100-02-06` Procedure Interfaces, Parameters, and Return Values
32. `100-02-07` CONST, VALUE, OPTIONS, and Parameter Safety
33. `100-02-08` Module Lab — Customer Validation Procedures

#### Module 100-03 — Files and Native I/O

34. `100-03-01` Physical Files, Tables, Record Formats, Rows, and Members
35. `100-03-02` RPG File Declarations and Usage Options
36. `100-03-03` Keyed Access with CHAIN
37. `100-03-04` Positioning with SETLL and SETGT
38. `100-03-05` Sequential Reading with READ, READE, and READP
39. `100-03-06` Creating Records with WRITE
40. `100-03-07` Updating and Deleting Records Safely
41. `100-03-08` Record Locking and Production Consequences
42. `100-03-09` Native I/O Error Handling
43. `100-03-10` Module Lab — Customer Master CRUD

#### Module 100-04 — Debugging and Production Support

44. `100-04-01` Reading Compile Listings and Diagnostic Messages
45. `100-04-02` Interactive Debugging and Breakpoints
46. `100-04-03` Job Logs, Call Stacks, and Message Details
47. `100-04-04` Program Status and File Information Data Structures
48. `100-04-05` Reproducing Defects Safely
49. `100-04-06` Module Lab — Diagnose a Failed Order

### Level 200 — Professional RPG Development

#### Module 200-01 — SQL and Db2 for i Foundations

50. `200-01-01` Relational Database Concepts on IBM i
51. `200-01-02` DDS Physical Files Versus SQL Tables
52. `200-01-03` Logical Files, SQL Views, and Indexes
53. `200-01-04` Creating Schemas, Tables, Keys, and Constraints
54. `200-01-05` SELECT, WHERE, ORDER BY, and Expressions
55. `200-01-06` JOIN, GROUP BY, HAVING, and Aggregation
56. `200-01-07` NULL Values and Data-Type Conversion
57. `200-01-08` INSERT, UPDATE, and DELETE
58. `200-01-09` Module Lab — Build the Coffee Catalog Database

#### Module 200-02 — Embedded SQL in RPG

59. `200-02-01` Static SQL and the RPG Precompiler
60. `200-02-02` Host Variables and Indicator Variables
61. `200-02-03` Singleton SELECT and Result Handling
62. `200-02-04` Cursors and Multi-Row Processing
63. `200-02-05` SQLCODE, SQLSTATE, and GET DIAGNOSTICS
64. `200-02-06` Commitment Control, COMMIT, and ROLLBACK
65. `200-02-07` Native I/O Versus SQL Decision Guide
66. `200-02-08` Module Lab — Order Entry with Embedded SQL

#### Module 200-03 — ILE and Modular Architecture

67. `200-03-01` The Integrated Language Environment
68. `200-03-02` Modules, Programs, and Binding
69. `200-03-03` Service Programs and Exported Procedures
70. `200-03-04` Binder Source and Signature Management
71. `200-03-05` Binding Directories
72. `200-03-06` Activation Groups and Resource Scope
73. `200-03-07` Designing Reusable Business Services
74. `200-03-08` Module Lab — Pricing Service Program

#### Module 200-04 — Professional Application Design

75. `200-04-01` Separation of Concerns in RPG Applications
76. `200-04-02` Validation, Business Logic, and Persistence Layers
77. `200-04-03` Error Contracts and Message Handling
78. `200-04-04` Logging, Auditing, and Observability
79. `200-04-05` Unit-Testable Procedure Design
80. `200-04-06` Code Review Standards for RPG and SQL
81. `200-04-07` Module Lab — Refactor Customer Maintenance

### Level 300 — IBM i Modernization

#### Module 300-01 — Modernizing RPG and Database Access

82. `300-01-01` Assessing a Legacy RPG Application
83. `300-01-02` Fixed-Format to Fully Free-Form Conversion
84. `300-01-03` Replacing Global State with Procedures and Data Structures
85. `300-01-04` DDS-to-DDL Modernization Strategy
86. `300-01-05` Native I/O-to-SQL Modernization Strategy
87. `300-01-06` Views, Constraints, Indexes, and Database-Centered Rules
88. `300-01-07` Incremental Modernization Without a Rewrite
89. `300-01-08` Module Lab — Modernize Inventory Processing

#### Module 300-02 — Git, VS Code, Builds, and DevOps

90. `300-02-01` Git as Source Control, Not Backup
91. `300-02-02` Repository Structure for IBM i Applications
92. `300-02-03` Branching, Pull Requests, and Code Review
93. `300-02-04` Building IBM i Source from the IFS
94. `300-02-05` Introduction to IBM i Build Automation
95. `300-02-06` Continuous Integration and Quality Gates
96. `300-02-07` Deployment, Promotion, and Rollback Design
97. `300-02-08` Module Lab — Build and Review a Change

#### Module 300-03 — APIs, Integration, and Open Source

98. `300-03-01` Integration Options on IBM i
99. `300-03-02` JSON Processing in RPG and SQL
100. `300-03-03` Calling HTTP Services from RPG
101. `300-03-04` Exposing Business Logic Through APIs
102. `300-03-05` Stored Procedures and External Consumers
103. `300-03-06` Open-Source Tools and IBM i Services
104. `300-03-07` Security Boundaries and Data Protection
105. `300-03-08` Module Lab — Order Status API

#### Module 300-04 — Testing, Performance, Security, and AI

106. `300-04-01` Testing Strategy for RPG Applications
107. `300-04-02` Unit, Integration, Regression, and Production Verification
108. `300-04-03` SQL Performance Fundamentals and Access Plans
109. `300-04-04` Index Strategy and Query Review
110. `300-04-05` Secure Coding, Authority, and Least Privilege
111. `300-04-06` AI-Assisted Code Explanation and Documentation
112. `300-04-07` AI-Assisted Refactoring, Review, and Test Design
113. `300-04-08` AI Risks: Hallucination, Security, Licensing, and Accountability
114. `300-04-09` Module Lab — Review and Harden an AI-Assisted Change

### Level 400 — Technical Leadership

#### Module 400-01 — Architecture and Modernization Leadership

115. `400-01-01` Creating an IBM i Application Architecture Map
116. `400-01-02` Modernization Assessment and Technical Debt Inventory
117. `400-01-03` Choosing Refactor, Replace, Replatform, or Retain
118. `400-01-04` Architecture Decision Records
119. `400-01-05` Data Ownership and Integration Boundaries
120. `400-01-06` Production Readiness Reviews
121. `400-01-07` Modernization Roadmaps and Investment Sequencing

#### Module 400-02 — Engineering Standards and Governance

122. `400-02-01` RPG Coding Standards
123. `400-02-02` SQL and Database Standards
124. `400-02-03` Git and Pull-Request Standards
125. `400-02-04` Logging, Monitoring, and Support Standards
126. `400-02-05` AI Usage Standards for IBM i Engineering
127. `400-02-06` Exception Management and Technical Waivers
128. `400-02-07` Measuring Standard Adoption

#### Module 400-03 — Mentoring and Team Development

129. `400-03-01` Building an Associate Developer Program
130. `400-03-02` Structured Code Reviews as Teaching Tools
131. `400-03-03` Mentoring Without Creating Dependency
132. `400-03-04` Skills Matrices and Progression Expectations
133. `400-03-05` Reducing Knowledge Concentration
134. `400-03-06` Running Technical Learning Sessions
135. `400-03-07` Capstone — Present a Modernization Plan

## 9. Standard Lesson Template

Every published lesson follows this structure.

### Metadata

- lesson ID
- title
- curriculum level and module
- estimated time
- prerequisites
- required tools
- source references and verification date
- sample-application component

### Today’s Coffee

Connect a coffee, brewing method, or café experience to the lesson concept without allowing the analogy to replace technical explanation.

### Learning Objectives

Use observable verbs such as explain, identify, write, debug, compare, review, or implement.

### Why This Matters

Explain business value, operational impact, maintainability, production support, and why companies use the technique.

### Concepts

Teach the theory and terminology before syntax.

### Architecture

Include a diagram when the concept involves flow, layers, objects, jobs, modules, database relationships, deployment, or integration.

### DDS

Show DDS when it is relevant to understanding existing systems. Explain every line.

### SQL DDL

Show the SQL equivalent when appropriate. Explain every line and identify the preferred direction.

### Legacy RPG

Provide an RPG III or fixed-format RPG IV example when maintenance literacy is part of the lesson. Label it clearly as legacy.

### Modern RPG

Provide a fully free-form RPG example. Examples should compile unless intentionally demonstrating an error.

### SQL

Provide SQL implementation or comparison where appropriate.

### Comparison Table

Use concise comparisons such as:

- DDS versus SQL DDL
- native I/O versus SQL
- fixed-format versus fully free-form RPG
- subroutine versus subprocedure
- program versus service program
- static SQL versus dynamic SQL

### Line-by-Line Explanation

Explain each meaningful line or logical group. Do not merely repeat the syntax.

### Common Mistakes

Identify likely beginner errors, symptoms, causes, and corrections.

### Pro Tips

Provide practical production guidance based on enterprise experience.

### Lab

Require the student to perform the skill with clear setup, instructions, expected results, and completion criteria.

### Challenge

Provide a more difficult extension without a full solution in the student edition.

### Knowledge Check

Include 5–10 questions using a mix of recall, reasoning, code reading, and scenario analysis.

### Manager’s Perspective

Discuss onboarding, maintainability, code reviews, production support, mentoring, standards, and technical debt.

### Final Sip

End with a concise coffee analogy tied to craftsmanship, leadership, or professional growth.

## 10. Lab Standard

Every lab must include:

- objective
- business scenario
- starting state
- required files and branches
- step-by-step tasks
- validation commands or queries
- expected output
- troubleshooting guidance
- completion checklist
- cleanup or reset instructions
- instructor solution
- review rubric

Labs should require the student to change, compile, run, inspect, and explain code rather than only copy it.

## 11. Assessment Model

| Assessment | Purpose | Minimum Standard |
|---|---|---|
| Knowledge check | Confirm lesson comprehension | 80% |
| Guided lab | Demonstrate supported execution | Complete all required outcomes |
| Independent challenge | Test transfer of learning | Meets rubric with limited assistance |
| Code review | Test professional reasoning | Explain correctness, risk, and maintainability |
| Module project | Integrate multiple skills | Working solution plus explanation |
| Level capstone | Demonstrate role readiness | Pass technical and behavioral rubric |

A student should not advance solely by watching videos or reading articles.

## 12. Sample Application Architecture

The curriculum uses one connected application: **The RPG Blend Coffee Company Order Management System**.

### Core Business Areas

- Customer Master
- Coffee Product Catalog
- Inventory
- Pricing and Discounts
- Order Entry
- Billing and Payments
- Shipping Status
- Reporting and Analytics
- APIs and Integration
- Audit and Operational Logging

### Conceptual Architecture

```text
User / Client
     |
     v
5250 UI, Batch Job, API, or SQL Consumer
     |
     v
Application Procedures and Service Programs
     |
     v
Validation and Business Rules
     |
     v
Data Access: Native I/O and Embedded SQL
     |
     v
Db2 for i Tables, Views, Indexes, Constraints, and Procedures
     |
     v
Journaling, Logging, Monitoring, and Production Support
```

### Planned Database Objects

| Object | Purpose |
|---|---|
| `CUSTOMER` | Customer identity, contact, status, and credit information |
| `PRODUCT` | Coffee products, descriptions, sizes, prices, and status |
| `INVENTORY` | Quantity on hand, committed quantity, reorder point, and location |
| `ORDER_HEADER` | Order identity, customer, dates, totals, and status |
| `ORDER_DETAIL` | Products, quantities, prices, discounts, and line totals |
| `INVOICE` | Billing status, totals, due dates, and payment status |
| `SHIPMENT` | Carrier, tracking, dates, and shipping status |
| `AUDIT_LOG` | Change history and operational events |

### Evolution by Level

- **Level 000:** Hello program, repository, connection, compile, and run
- **Level 100:** Customer and product CRUD using procedures and native I/O
- **Level 200:** SQL schema, embedded SQL, service programs, transactions, and layered design
- **Level 300:** Git pipelines, APIs, tests, performance, security, and modernization
- **Level 400:** Architecture review, standards, modernization roadmap, and governance

## 13. Technical Standards

### Preferred New Development

- fully free-form RPG
- meaningful names
- procedures and explicit interfaces
- qualified data structures
- SQL DDL for new database objects
- embedded SQL when it improves clarity and set-based processing
- Git-based source control
- VS Code and Code for IBM i as the primary Academy workflow
- automated or repeatable builds
- explicit error handling and diagnostics
- tests appropriate to the risk
- least-privilege authority
- documented architecture decisions

### Maintenance Literacy

Students must also learn to recognize and support:

- RPG III and fixed-format RPG IV
- indicators and the RPG cycle
- DDS physical, logical, display, and printer files
- native record-level access
- source physical files and members
- CL commands and job-level behavior
- 5250 applications and subfiles
- traditional compile and deployment flows

Legacy knowledge is taught for safe support. It is not automatically presented as the preferred design for new development.

## 14. AI-Assisted Development Standard

AI is taught as an engineering assistant, not an authority.

Students must learn to use AI for:

- explaining unfamiliar code
- generating documentation drafts
- suggesting refactoring options
- creating test cases
- reviewing SQL and RPG patterns
- comparing legacy and modern approaches
- preparing troubleshooting checklists
- accelerating research within approved sources

Students must also learn to:

- protect credentials, PHI, PII, proprietary code, and production data
- validate generated syntax against the target IBM i release
- compile and test all generated code
- review security, performance, locking, and transaction behavior
- identify unsupported claims and hallucinations
- preserve human accountability for every change

## 15. Source Governance

The Academy source hierarchy is:

1. Current IBM product documentation for release-sensitive behavior
2. IBM manuals for documented language, SQL, database, and ILE concepts
3. IBM Redbooks for modernization strategy and practical patterns
4. COMMON training for instructional sequence and lab inspiration
5. Academy standards for pedagogy, examples, and production context

See [SOURCE_TO_CURRICULUM_MAP.md](SOURCE_TO_CURRICULUM_MAP.md).

Every lesson must record:

- source title
- publication or product release
- chapter, section, or page
- verification date
- release-sensitive items requiring revalidation

Copyrighted source material should not be copied into the repository unless redistribution rights are clear. Academy explanations, code, diagrams, and exercises must be original or properly licensed.

The phrase **work in progress** must remain attached to *Modernizing IBM i Applications* until IBM publishes the final Redbook.

## 16. Repository Structure

```text
academy/
├── README.md
├── blueprint/
│   ├── ACADEMY_BLUEPRINT.md
│   └── SOURCE_TO_CURRICULUM_MAP.md
├── standards/
│   ├── LESSON_STANDARD.md
│   ├── LAB_STANDARD.md
│   ├── CODE_STANDARD.md
│   ├── SOURCE_GOVERNANCE.md
│   └── AI_USAGE_STANDARD.md
├── curriculum/
│   ├── level-000/
│   ├── level-100/
│   ├── level-200/
│   ├── level-300/
│   └── level-400/
├── sample-application/
│   ├── database/
│   ├── rpgle/
│   ├── sqlrpgle/
│   ├── clle/
│   ├── dds/
│   ├── binder/
│   ├── tests/
│   └── scripts/
├── labs/
├── assessments/
├── instructor-materials/
├── workbooks/
├── presentations/
├── publishing/
└── assets/
```

## 17. Content Deliverables

Each completed module should be capable of producing:

- canonical Markdown lesson
- GitHub source package
- student lab
- challenge exercise
- knowledge check
- answer key
- instructor guide
- student workbook
- PDF guide
- slide deck
- video script
- conference-session outline
- public article adaptation
- internal onboarding adaptation

The Markdown lesson is the canonical source. Other formats should be generated or adapted from it to reduce drift.

## 18. Public Publishing Roadmap

### Phase 1 — Foundation

- finish the Blueprint and standards
- complete Module 0
- publish Academy landing page
- establish sample application repository structure
- release the first downloadable student guide

### Phase 2 — Level 100 Release

- publish one lesson every two weeks
- release complete module packages after individual lessons
- publish labs and sample code with each module
- produce short supporting videos
- collect learner feedback and corrections

### Phase 3 — Level 200 and Workshops

- publish SQL and ILE tracks
- produce instructor-led workshop versions
- create conference sessions from completed modules
- introduce formal module assessments

### Phase 4 — Modernization Track

- publish Git, DevOps, APIs, testing, AI, security, and database-modernization modules
- align content with current IBM guidance and the modernization Redbook
- create modernization field guides and decision tools

### Phase 5 — Leadership and Scale

- publish architecture and leadership curriculum
- release internal-adaptation toolkit
- package the Academy as a structured course or book series
- create contributor and technical-review processes

## 19. Internal Associate Developer Adaptation

The public Academy teaches transferable IBM i and RPG skills. Internal onboarding adds company-specific material without changing the public core.

### Internal Overlay

- company architecture and product overview
- secure access and environment setup
- naming and coding standards
- source-control and deployment workflow
- ticket, incident, and change-management processes
- database and data-classification rules
- production-support expectations
- domain terminology
- mentor assignments
- supervised work progression

### Suggested 90-Day Path

| Period | Focus | Expected Outcome |
|---|---|---|
| Days 1–30 | Level 000, basic Level 100, environment, product orientation | Compile, run, read, and explain small programs |
| Days 31–60 | Native I/O, debugging, procedures, SQL foundations | Complete a supervised defect or small enhancement |
| Days 61–90 | Embedded SQL, reviews, support workflow, team standards | Deliver a reviewed change with limited assistance |

### Mentor Responsibilities

- weekly technical check-in
- lab and code review
- explanation of production context
- progressive reduction of assistance
- written assessment against the skills matrix

## 20. Branding Guidelines

### Voice

- conversational
- practical
- direct
- encouraging
- production-aware
- technically precise
- coffee-centered without becoming gimmicky

### Message

The Academy respects legacy systems and the people who built them while teaching the practices needed to sustain and modernize them.

### Required Brand Elements

- The RPG Blend Academy name
- Real Code. Real Coffee. No Nonsense.
- Today’s Coffee opening
- Final Sip closing
- consistent diagram and code formatting
- clear legacy, transitional, and modern labels

### Avoid

- empty hype
- “rewrite everything” messaging
- dismissive language about legacy developers
- unexplained jargon
- syntax dumps without context
- coffee analogies that obscure the technical point

## 21. Quality Review Process

Every lesson passes these reviews before release:

1. **Technical review** — syntax, behavior, release compatibility, and production implications
2. **Instructional review** — objectives, sequence, clarity, examples, lab, and assessment alignment
3. **Source review** — citations, source authority, release sensitivity, and copyright compliance
4. **Code validation** — compile, run, expected output, cleanup, and repeatability
5. **Editorial review** — voice, grammar, formatting, terminology, and consistency
6. **Manager review** — onboarding value, maintainability, supportability, and team applicability

## 22. Definition of Done

### Lesson Done

- follows the lesson template
- includes validated code
- includes a lab or deliberate practice
- includes a knowledge check
- identifies legacy and preferred modern practice
- cites authoritative sources
- passes technical and editorial review

### Module Done

- all lessons complete
- module project complete
- code packaged
- labs and solutions complete
- assessments and answer keys complete
- instructor notes complete
- workbook and publication versions complete
- source register complete

### Level Done

- all modules complete
- capstone complete
- skills rubric complete
- student progression criteria defined
- internal adaptation complete
- feedback incorporated into the next release

## 23. Success Metrics

### Learning Metrics

- lesson completion rate
- knowledge-check pass rate
- lab completion rate
- time to complete first supervised change
- reduction in repeated mentor intervention
- code-review defect trends
- student confidence before and after each module

### Content Metrics

- lessons published versus plan
- percentage with current source verification
- code examples compiled and validated
- reported corrections and resolution time
- workbook, video, and presentation conversion rate

### Organizational Metrics

- associate developer retention
- time to independent contribution
- mentor hours per new developer
- production defects from new-developer changes
- modernization practices adopted by teams
- reduction in single-person knowledge dependencies

### Public Metrics

- subscribers and repeat readers
- repository stars, forks, and issue participation
- lesson downloads
- workshop attendance
- conference-session acceptance
- community citations and referrals

## 24. Governance and Ownership

### Curriculum Owner

George Van Eaton owns the Academy vision, curriculum structure, technical direction, brand voice, and release approval.

### Technical Reviewers

Reviewers validate topics within their expertise and document any release-specific limitations.

### Contributors

Contributors follow Academy templates, source rules, code standards, and licensing requirements. Contributions do not bypass technical review.

### Change Control

Material changes to curriculum order, technical standards, sample-application architecture, or branding require an update to this Blueprint or an Architecture Decision Record.

## 25. Initial Build Plan

### Milestone 1 — Foundation Complete

- complete Blueprint
- complete Source-to-Curriculum Map
- create lesson, lab, code, source, and AI standards
- establish sample-application skeleton

### Milestone 2 — Module 0 Complete

- lesson manuscripts
- VS Code setup
- source and compile scripts
- student lab
- knowledge check
- answer key
- instructor guide
- workbook

### Milestone 3 — Level 100 Core Complete

- modern RPG fundamentals
- data structures and procedures
- native I/O
- debugging and support
- level capstone

### Milestone 4 — Level 200 Planned and Started

- SQL foundation
- embedded SQL
- ILE architecture
- professional design standards

### Milestone 5 — Publishing Engine Operating

- repeatable Markdown-to-PDF workflow
- slide and video templates
- publishing calendar
- feedback and correction process

## 26. Immediate Next Actions

1. Create the five standards files under `academy/standards/`.
2. Finish Module 0 against this Blueprint.
3. Build the Coffee Company database and source skeleton.
4. Create the lesson catalog as trackable repository issues or project items.
5. Produce Module 1: Reading and Writing Modern RPG.
6. Establish the publishing calendar and review workflow.

## 27. Final Sip

A good academy should work like a dependable coffee program and a dependable software platform: consistent ingredients, clear standards, repeatable preparation, careful review, and room to improve the blend. The goal is not to produce developers who can copy RPG syntax. The goal is to develop professionals who can understand the business, protect production, improve the codebase, and teach the next person.