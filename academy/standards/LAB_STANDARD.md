# The RPG Blend Academy Lab Standard

## Purpose

Labs convert lesson knowledge into observable skill. Every lab must be executable by a student, reviewable by an instructor, and connected to the Academy sample application.

## Required Lab Metadata

- Level, module, lesson, and lab number
- Lab title
- Estimated time
- Difficulty
- Prerequisites
- Required tools and access
- Required starting objects or source
- Expected deliverables
- Validation method
- Cleanup or reset instructions

## Required Lab Structure

### Scenario

Describe a realistic business request involving the RPG Blend Coffee Company. State who requested the change and why it matters.

### Objective

State the observable result the student must produce.

### Starting Point

Identify:

- Repository path
- Branch or tag when applicable
- Required library or schema
- Starting source members or stream files
- Sample data assumptions

### Tasks

Break the work into ordered tasks without turning the lab into a copy-and-paste exercise. Early labs may provide detailed steps; later labs should require more independent decisions.

### Expected Result

Describe the correct business and technical behavior without giving away every implementation detail.

### Validation

Provide repeatable checks such as:

- Compile succeeds
- Program returns the expected result
- SQL query produces specified rows
- Database change satisfies constraints
- Unit test passes
- Job log contains no unexpected messages
- Code review checklist passes

### Troubleshooting Guide

Include likely failures, symptoms, and areas to inspect. Do not provide the entire solution in the student version.

### Reflection

Ask two to four questions about design choices, production risk, maintainability, or alternate implementations.

### Cleanup

Provide safe reset steps when the lab changes shared data, creates objects, changes configuration, or leaves jobs or locks active.

## Lab Difficulty Model

| Level | Student Support |
|---|---|
| Guided | Detailed steps and checkpoints |
| Assisted | Major steps provided; implementation decisions required |
| Independent | Business requirement and acceptance criteria provided |
| Capstone | Multi-topic problem with incomplete information and review gates |

## Sample Application Rule

Labs should extend the Coffee Company system. Each lab must identify the affected application area, such as Customer Master, Product Catalog, Inventory, Order Entry, Billing, Shipping, Reporting, or APIs.

## Safety Requirements

- Never require production access
- Use isolated training libraries or schemas
- Do not include real credentials, secrets, PHI, or customer data
- Explain destructive actions before the student runs them
- Provide rollback or reset instructions
- Warn about locks, journaling, commitment control, and object replacement where applicable

## Instructor Solution

Every lab requires a separate instructor solution containing:

- Completed source
- Expected output
- Validation evidence
- Common alternate solutions
- Scoring guidance
- Likely misconceptions
- Suggested coaching questions

## Review Checklist

A lab is ready only when:

- A reviewer other than the author can complete it from the instructions
- All required files exist at the documented paths
- Commands and examples have been tested
- Expected output matches actual output
- Reset instructions work
- The lab aligns to stated learning objectives
- The student can demonstrate the result rather than merely submit copied code

## Definition of Done

A lab is complete when the student instructions, starter assets, instructor solution, validation evidence, scoring guidance, and reset procedure are all committed and technically reviewed.
