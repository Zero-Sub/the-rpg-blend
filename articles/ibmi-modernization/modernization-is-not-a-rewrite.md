# Modernization Is Not a Rewrite

## The discipline of improving IBM i systems without discarding their value

IBM i modernization is often framed as a binary decision: preserve the existing application or replace it.

That framing is too narrow.

A rewrite is one possible delivery strategy. It is not the definition of modernization.

Modernization is the disciplined improvement of how an organization understands, designs, changes, tests, documents, operates, and governs its systems. Code matters, but code is only one part of the system.

A team can rewrite an application using newer technology and still reproduce the same weak architecture, concentrated knowledge, incomplete testing, and unstable delivery practices. The result may look modern while preserving the original risks.

A team can also retain substantial RPG and Db2 for i investments while making the application easier to understand, safer to change, simpler to integrate, and less dependent on individual memory. That is meaningful modernization.

## Start With Understanding

The first modernization deliverable should not be new code. It should be improved understanding.

Before changing a critical application, the team should be able to answer:

- Which business capabilities does the application support?
- Which programs, service programs, files, tables, jobs, queues, and interfaces participate?
- Where is business logic located?
- Which components own specific data and decisions?
- What downstream processes depend on a proposed change?
- Which people hold knowledge that is not documented elsewhere?
- How will the team prove that existing behavior still works?

Without those answers, modernization becomes controlled guessing.

System maps, dependency analysis, decision logs, data-ownership rules, and operational documentation are not administrative overhead. They are risk controls.

## Preserve Value, Remove Friction

Long-lived IBM i applications often contain decades of tested business knowledge. That knowledge may be difficult to see because it is distributed across RPG programs, database definitions, job streams, control files, user workflows, and operational procedures.

Replacing all of it at once can destroy working knowledge faster than the organization can reconstruct it.

Responsible modernization separates inherited value from accumulated friction.

Inherited value may include:

- Proven business rules
- Reliable transaction processing
- Deep integration with operational workflows
- Stable data models
- Mature exception handling
- Years of production learning

Accumulated friction may include:

- Excessive program coupling
- Unclear module boundaries
- Duplicated business rules
- Record-level access where set-based SQL is more appropriate
- Manual deployment steps
- Weak automated testing
- Undocumented dependencies
- Single-person knowledge concentration

The goal is not to erase the system's history. The goal is to preserve what still creates value while removing what makes the system difficult to understand and evolve.

## Modernization Has Multiple Workstreams

A practical modernization program usually contains several parallel workstreams.

### Architectural clarity

Define module boundaries, service responsibilities, data ownership, interfaces, and decision points. Make the system's structure explicit.

### RPG engineering

Move toward free-form RPG, smaller procedures, clearer interfaces, service programs, reusable components, consistent error handling, and code that communicates intent.

### SQL-first data access

Use Db2 for i and SQL where set-based operations, data services, views, stored procedures, and database-level capabilities reduce complexity and improve clarity.

SQL-first does not mean SQL-only. It means choosing the most appropriate layer for each responsibility.

### Testing and validation

Create repeatable evidence that modernization changes preserve required behavior. Characterization tests, regression tests, SQL validation, controlled comparisons, and operational monitoring all contribute.

### Source control and delivery discipline

Modern development tools matter when they improve traceability, review, consistency, automation, and recovery. Git, VS Code, CI pipelines, and automated deployment controls should support the engineering system rather than exist as isolated tooling projects.

### Documentation and knowledge resilience

Documentation should support decisions and operations. Teams need system maps, interface contracts, runbooks, ownership records, architecture decisions, and onboarding paths that remain useful after the original author leaves.

### AI-assisted understanding

AI can help explain unfamiliar code, summarize procedures, generate documentation drafts, identify possible dependencies, suggest tests, and accelerate impact analysis.

The safest first use of AI is often understanding—not autonomous code change.

AI output must be validated against source, database definitions, operational behavior, security rules, and business knowledge. In regulated or healthcare environments, production data, client information, and protected health information must remain outside unapproved AI systems.

### Workforce development

Modernization fails when the system changes but the team does not. Developers need structured learning, mentoring, modern tools, architecture context, and clear progression from syntax knowledge to system ownership.

## Use Incremental Boundaries

Enterprise modernization works best when teams create manageable boundaries.

A useful pattern is:

1. Identify a business capability or change area.
2. Map its current dependencies.
3. Define a cleaner service, module, or data boundary.
4. Protect existing behavior with validation.
5. Move one responsibility at a time.
6. Measure the result.
7. Repeat.

This approach is slower than announcing a rewrite and faster than recovering from one that fails.

Incremental modernization reduces blast radius, creates earlier value, and allows teams to learn before committing the entire organization to a single design assumption.

## Measure Capability, Not Appearance

A modernized system should be easier to operate and change—not merely written with newer syntax.

Useful measures include:

- Time required to understand a change area
- Number of undocumented dependencies discovered late
- Change failure rate
- Regression-defect rate
- Deployment lead time
- Recovery time
- Test coverage for critical behavior
- Number of single-person dependencies
- Developer onboarding time
- Percentage of changes using defined architecture and review standards
- Reuse of shared services and data interfaces

A redesigned screen or rewritten program may be visible. Reduced change risk is more important.

## Leadership Determines the Outcome

Modernization is an organizational change program disguised as a technical initiative.

Leaders must establish:

- A clear reason for modernization
- A practical definition of success
- Standards that guide daily decisions
- Protected time for documentation, testing, and learning
- Governance proportionate to risk
- Respect for the people who built and support the current system
- Accountability for measurable progress

Attacking the existing platform or dismissing experienced developers creates resistance and destroys trust. Pretending that no change is necessary creates a different form of risk.

The leadership task is to hold both truths:

1. The existing system contains substantial business value.
2. The organization must improve how that value is maintained and evolved.

## A Better Definition

IBM i modernization is not the replacement of old technology with new technology.

It is the deliberate reduction of operational, architectural, delivery, and knowledge risk while increasing the organization's ability to change.

Sometimes that includes replacement. Often it includes refactoring, modularization, SQL services, APIs, improved testing, Git-based workflows, documentation, training, and AI-assisted understanding.

The correct question is not:

> Should we rewrite the application?

The correct questions are:

> What prevents this system from changing safely?
>
> Which risks matter most?
>
> What is the smallest disciplined step that improves our capability?

That is where modernization begins.

---

## About the Author

George VanEaton is an IBM i engineering leader, author of The RPG Blend, creator of The RPG Blend Academy, and a contributing author to the IBM Redbooks work-in-progress publication *Modernizing IBM i Applications*. His work focuses on IBM i application modernization, RPG and SQL engineering, AI-assisted development, architecture, and developing the next generation of IBM i professionals.
