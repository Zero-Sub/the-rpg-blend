# IBM i Modernization Readiness Checklist

Use this checklist to identify whether an IBM i team is prepared to modernize safely. It is not a maturity score by itself. It is a structured way to expose risk, missing knowledge, and the next practical improvements.

## Rating Scale

- **0 — Unknown:** The team cannot answer consistently.
- **1 — Reactive:** Knowledge or practice exists informally and depends on individuals.
- **2 — Defined:** A documented and repeatable approach exists, but adoption is inconsistent.
- **3 — Operational:** The approach is routinely used, measured, and improved.

Record evidence for every score. A confident opinion without evidence should be treated as unknown.

---

## 1. Business and System Understanding

- [ ] Critical business capabilities supported by the application are documented.
- [ ] Business owners and technical owners are identified.
- [ ] Major workflows and exception paths are mapped.
- [ ] Upstream and downstream systems are known.
- [ ] Batch, interactive, integration, and reporting workloads are distinguished.
- [ ] Critical periods, service levels, and operational constraints are documented.
- [ ] The team can explain the business consequence of failure.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 2. Architecture and Module Boundaries

- [ ] Major applications, domains, and components are mapped.
- [ ] Program, service-program, API, job, and database responsibilities are clear.
- [ ] Business logic is not unnecessarily duplicated across layers.
- [ ] Interfaces and service boundaries are documented.
- [ ] Data ownership is explicit.
- [ ] Shared components have defined owners and compatibility expectations.
- [ ] Architecture decisions and known compromises are recorded.
- [ ] The team maintains a decision-debt or architecture-risk log.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 3. RPG Engineering Practices

- [ ] Current RPG coding standards exist and are enforced through review.
- [ ] New code uses modern free-form RPG where appropriate.
- [ ] Procedures are focused, cohesive, and clearly named.
- [ ] Service programs and modules have intentional responsibilities.
- [ ] Interfaces minimize unnecessary global state and hidden dependencies.
- [ ] Error handling and diagnostic practices are consistent.
- [ ] Copy members and shared definitions are governed.
- [ ] Obsolete patterns are identified with an incremental remediation plan.
- [ ] Code examples and preferred patterns are available to developers.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 4. Db2 for i and SQL-First Data Access

- [ ] Data models and key relationships are documented.
- [ ] Tables or physical files have clear ownership.
- [ ] Unique keys, constraints, and referential rules are intentional.
- [ ] Set-based SQL is used where it reduces complexity and improves clarity.
- [ ] Views, table functions, stored procedures, or data services are used appropriately.
- [ ] Record-level access remains where it is justified by workload or design.
- [ ] SQL performance is measured with appropriate IBM i tools.
- [ ] Database changes follow review and deployment standards.
- [ ] Character, variable-length, numeric, date, and code-field definitions follow documented conventions.
- [ ] Data access logic is not unnecessarily duplicated across applications.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 5. Dependency and Impact Analysis

- [ ] Program-to-program dependencies can be identified reliably.
- [ ] Program-to-file and program-to-table dependencies can be identified.
- [ ] Calls through command strings, job descriptions, data queues, messages, and configuration are considered.
- [ ] Dynamic dependencies and indirect calls are documented or discoverable.
- [ ] Change analysis includes downstream reports, interfaces, and batch processes.
- [ ] The team distinguishes confirmed dependencies from inferred dependencies.
- [ ] Impact-analysis findings are reviewed by someone with operational knowledge.
- [ ] Newly discovered dependencies are added to durable documentation.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 6. Testing and Validation

- [ ] Critical business behavior is covered by repeatable tests or validation procedures.
- [ ] Existing behavior can be characterized before refactoring.
- [ ] Unit, integration, regression, and operational validation responsibilities are defined.
- [ ] Test data is controlled and representative.
- [ ] Database changes have validation scripts or reconciliation queries.
- [ ] Production defects are converted into repeatable regression coverage when practical.
- [ ] Expected results and acceptance criteria are documented.
- [ ] Performance-sensitive changes include before-and-after evidence.
- [ ] Rollback or recovery validation is included for high-risk changes.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 7. Source Control and Delivery

- [ ] Source is stored in an approved version-control system.
- [ ] Repository boundaries and branching practices are documented.
- [ ] Changes are traceable to requirements, defects, or decisions.
- [ ] Peer review is required for material changes.
- [ ] Builds are reproducible from controlled source.
- [ ] Compile options and environment-specific settings are governed.
- [ ] Deployment steps are documented and increasingly automated.
- [ ] Emergency fixes are reconciled back into source control.
- [ ] Release evidence, approvals, and rollback plans are retained.
- [ ] Tooling changes support the delivery process rather than bypass it.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 8. Documentation and Knowledge Resilience

- [ ] Critical systems have current ownership records.
- [ ] System maps, runbooks, and support procedures exist.
- [ ] Business rules are documented outside individual memory.
- [ ] On-call and production-support knowledge is transferable.
- [ ] Single-person dependencies are identified.
- [ ] Retirement and attrition risks are tracked.
- [ ] Documentation has an owner and review cadence.
- [ ] New developers have an intentional onboarding path.
- [ ] Significant changes update the associated documentation.
- [ ] Recovery from the loss of a key expert has been considered or tested.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 9. AI-Assisted Development Readiness

- [ ] Approved AI use cases are documented.
- [ ] Prohibited data, source, credentials, PHI, and production information are clearly defined.
- [ ] Developers understand that AI output requires validation.
- [ ] AI is used first for explanation, documentation, test ideas, and impact analysis where appropriate.
- [ ] Generated code follows the same review and testing standards as human-written code.
- [ ] Prompts, skills, and reusable instructions are governed.
- [ ] AI tools are evaluated for security, licensing, data handling, and audit requirements.
- [ ] The team measures whether AI improves cycle time, comprehension, quality, or capacity.
- [ ] AI adoption includes developer training and leadership expectations.
- [ ] Agents do not receive unauthorized access to production systems or client data.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 10. Team Capability and Workforce Development

- [ ] Required RPG, SQL, IBM i, architecture, and operational skills are defined.
- [ ] Skill gaps are assessed by role and system responsibility.
- [ ] Developers have structured learning plans.
- [ ] Mentors have defined responsibilities and protected capacity.
- [ ] Associate or early-career developers have a practical progression path.
- [ ] Experienced developers receive modernization training rather than only new hires.
- [ ] Technical leadership and system-ownership expectations are explicit.
- [ ] Knowledge sharing is part of normal delivery work.
- [ ] Hiring plans address future capability, not only immediate vacancies.
- [ ] The team measures onboarding time and progression toward independent contribution.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 11. Governance and Leadership

- [ ] The organization has a shared definition of modernization.
- [ ] Modernization priorities are connected to business and operational risk.
- [ ] Executive sponsorship and decision ownership are clear.
- [ ] Standards are practical, published, and enforced consistently.
- [ ] Architecture and database changes receive proportionate review.
- [ ] Teams have time for testing, documentation, refactoring, and learning.
- [ ] Modernization work is planned rather than hidden inside unrelated projects.
- [ ] Progress is measured using capability and risk outcomes.
- [ ] Leaders communicate respect for the existing platform and the people who support it.
- [ ] Decisions balance stability, delivery needs, and long-term maintainability.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

## 12. Operations, Security, and Recovery

- [ ] Critical jobs, schedules, queues, interfaces, and dependencies are monitored.
- [ ] Operational alerts identify actionable conditions.
- [ ] Security authorities follow least-privilege expectations.
- [ ] Secrets and credentials are not stored in source or shared configuration.
- [ ] Audit, regulatory, and data-handling requirements are understood.
- [ ] Backup, restore, rollback, and disaster-recovery procedures are current.
- [ ] Production support has access to useful diagnostics and runbooks.
- [ ] Modernization changes do not weaken established operational controls.
- [ ] Capacity and performance baselines exist for critical workloads.
- [ ] Recovery procedures are exercised, not merely documented.

**Section score:** ___ / 3  
**Evidence:**  
**Primary gap:**  
**Next action:**

---

# Readiness Summary

| Area | Score 0–3 | Highest Risk | Next Practical Action |
|---|---:|---|---|
| Business and system understanding |  |  |  |
| Architecture and boundaries |  |  |  |
| RPG engineering |  |  |  |
| Db2 for i and SQL |  |  |  |
| Dependency and impact analysis |  |  |  |
| Testing and validation |  |  |  |
| Source control and delivery |  |  |  |
| Documentation and knowledge |  |  |  |
| AI readiness |  |  |  |
| Team capability |  |  |  |
| Governance and leadership |  |  |  |
| Operations, security, and recovery |  |  |  |

## Interpretation

- **0.0–0.9:** Modernization work is operating with significant unknowns. Begin with discovery, ownership, and risk containment.
- **1.0–1.7:** Useful practices exist, but they rely too heavily on individuals or inconsistent execution.
- **1.8–2.4:** The organization has a workable foundation. Target the weakest areas before increasing modernization scope.
- **2.5–3.0:** The organization has strong modernization discipline. Continue measuring outcomes and addressing emerging risk.

A high average does not cancel a critical zero. A single unknown in recovery, security, data ownership, or critical-system knowledge may be more important than the overall score.

# Recommended First Deliverable

After completing the assessment, select no more than three actions for the next 90 days:

1. One action that improves system understanding.
2. One action that reduces change or operational risk.
3. One action that increases team capability.

Modernization becomes credible when assessment produces disciplined action.

---

## About This Framework

This checklist is part of The RPG Blend's IBM i Modernization Discipline Framework by George VanEaton. George is an IBM i engineering leader, author of The RPG Blend, creator of The RPG Blend Academy, and a contributing author to the IBM Redbooks work-in-progress publication *Modernizing IBM i Applications*.
