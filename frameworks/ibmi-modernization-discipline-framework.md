# IBM i Modernization Discipline Framework

## Purpose

IBM i modernization is not a single technology project. It is a sustained engineering discipline that changes how teams understand, design, test, govern, release, and support long-lived applications.

This framework provides a practical structure for modernization decisions without treating a rewrite as the default answer.

## Core Principle

Modernization succeeds when organizations improve the system of engineering around the application while preserving the business knowledge, operational stability, and proven value already embedded within it.

## The Eight Disciplines

### 1. Application Understanding

Teams must be able to explain what the application does, where business rules live, how data moves, and which dependencies create change risk.

Evidence includes:

- Current application and job-flow documentation
- Dependency and impact analysis
- Business-rule ownership
- Known interfaces and data contracts
- Reduced reliance on undocumented tribal knowledge

### 2. RPG Structure

Modern RPG should become easier to read, test, review, and change.

Priority practices include:

- Fully free-form RPG where practical
- Procedures with clear responsibilities
- Service programs and reusable interfaces
- Explicit data structures and naming
- Reduced indicator-driven and monolithic logic
- Incremental refactoring instead of uncontrolled rewrites

### 3. Data and SQL Architecture

Database access should move toward explicit, governable contracts.

Priority practices include:

- Db2 for i literacy across the development team
- SQL views for stable read contracts
- Stored procedures or services for controlled operations
- Clear data ownership and naming
- Index and query-performance discipline
- Reduced direct coupling to physical-file implementation details

### 4. Delivery and Source Control

Modernization requires a delivery system that can safely carry the change.

Priority practices include:

- Git-based source control
- Pull-request review
- Repeatable builds and compile options
- Traceable database changes
- Environment promotion rules
- Small, reversible changes
- Clear rollback and recovery plans

### 5. Testing and Validation

A system cannot be modernized safely when every change depends on memory and manual hope.

Priority practices include:

- Unit-testable procedures and service boundaries
- Regression coverage for critical business rules
- Repeatable integration and operational testing
- Test data that protects privacy
- Explicit validation of release-sensitive commands and tooling
- Production verification and support readiness

### 6. Operational Discipline

Modernization must improve supportability rather than transfer complexity into production.

Priority practices include:

- Observable jobs, interfaces, and failure points
- Documented recovery and escalation paths
- Clear ownership
- Reduced hero dependency
- Incident learning that produces durable improvements
- Technical debt treated as operational risk inventory

### 7. Workforce Capability

Modernization fails when only the code changes.

Priority practices include:

- Structured onboarding
- Modern RPG, SQL, Git, and VS Code education
- Mentoring and cross-training
- Succession planning for concentrated knowledge
- Practical adoption support for reluctant developers
- Time and expectations for learning new workflows

### 8. AI-Assisted Engineering Governance

AI can accelerate understanding, documentation, testing, and code review, but it also accelerates weak engineering practices when ownership is unclear.

Priority practices include:

- Human accountability for every change
- Approved data and access boundaries
- No production or client-system access without explicit authorization
- Validation of generated code and explanations
- Prompt, agent, token, and workflow discipline
- Measurement based on engineering outcomes rather than tool activity alone

## Modernization Decision Test

Before approving a modernization change, ask:

1. What business or engineering risk is being reduced?
2. What existing behavior must remain stable?
3. Which dependencies and data contracts are affected?
4. How will the change be tested and reversed?
5. Does the change improve maintainability and supportability?
6. Can the team own the new design after implementation?
7. Is the solution proportionate to the problem?
8. What evidence will show that the modernization produced a better system?

## Warning Signs

Modernization is drifting when:

- A rewrite becomes the strategy rather than one possible tactic
- Tool adoption is measured without engineering outcomes
- Architecture is discussed without production-support consequences
- Delivery pressure permanently bypasses standards
- New technology increases dependency on a few specialists
- Documentation describes intent that the code and data do not support
- The team cannot explain how to validate or reverse the change
- “Modern” becomes a substitute for clear business value

## Progress Measures

Useful measures include:

- Reduced time to understand and safely change critical code
- Fewer production regressions and emergency reversals
- Increased percentage of source under reviewable version control
- More business rules covered by repeatable tests
- Reduced knowledge concentration
- Improved onboarding time and developer confidence
- Clearer service and data boundaries
- Lower operational effort for recurring incidents
- Documented AI-assisted productivity with maintained quality and ownership

## Final Principle

The goal is not to make an IBM i system look newer.

The goal is to make it easier to understand, safer to change, more predictable to operate, and more sustainable for the people and business that depend on it.
