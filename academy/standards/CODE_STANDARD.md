# The RPG Blend Academy Code Standard

## Purpose

This standard defines the minimum quality bar for RPG, CL, DDS, SQL, shell, configuration, and supporting code used in Academy lessons and labs.

## Core Principles

Academy code must be:

- Technically valid for the documented environment
- Readable by a beginner
- Representative of professional enterprise development
- Safe to run in the training environment
- Small enough to teach clearly
- Complete enough to avoid pseudo-code when working code is practical

## Validation Status

Every code asset must be marked as one of:

- `validated` — compiled or executed successfully in the documented environment
- `reviewed` — technically reviewed but not executed
- `illustrative` — intentionally incomplete and clearly labeled
- `error-example` — intentionally incorrect for teaching purposes

Unlabeled code is treated as unverified and cannot be published as final.

## RPG Standards

### Preferred Form

- Use fully free-form RPG for new-development examples
- Use `**FREE` where required by the target environment
- Use descriptive names
- Use procedures to separate responsibilities
- Use prototypes and procedure interfaces
- Minimize global variables
- Avoid numbered indicators in modern examples unless teaching legacy code or device-file interaction
- Use qualified data structures where they improve clarity
- Handle expected failure conditions

### Legacy Examples

Legacy code must:

- Be labeled clearly
- Preserve the syntax necessary to recognize real production code
- Include a modern equivalent when appropriate
- Explain indicators, columns, cycle behavior, and implicit operations
- Never be presented as the default for new development

## SQL Standards

- Qualify objects when the execution context requires it
- Use explicit column lists for production examples
- Use appropriate data types and precision
- Define keys and constraints intentionally
- Explain NULL behavior
- Use parameter markers for dynamic data values
- Avoid constructing SQL from unvalidated input
- Check SQLSTATE, SQLCODE, or diagnostics where failure matters
- Explain commitment control and isolation implications
- Do not teach `MERGE` or other complex operations without discussing correctness, concurrency, and maintainability

## DDS Standards

- Include source type and target object type
- Explain record formats, fields, keys, references, indicators, and keywords
- Keep source aligned for readability
- Pair database DDS with SQL DDL when appropriate
- State whether the DDS example is for active use, interoperability, or maintenance literacy

## CL Standards

- Use clear command formatting
- Qualify objects when needed
- Include error handling for multi-step operational examples
- Explain library-list assumptions
- Avoid commands that can affect non-training objects
- Document authority requirements

## Naming Conventions

Names should communicate business meaning. The sample application uses consistent prefixes and namespaces documented in its architecture guide.

General guidance:

- Procedures: verb plus object, such as `getCustomer` or `calculateOrderTotal`
- Boolean variables: positive condition, such as `customerExists`
- Constants: descriptive business meaning
- Database columns: stable business terms rather than screen labels
- Avoid unexplained abbreviations

System-name limits may require shortened object names. Document the corresponding long SQL name when applicable.

## Formatting

- Use consistent indentation
- Keep one logical statement per line when practical
- Separate logical sections with whitespace
- Avoid decorative comment blocks that overwhelm the code
- Comments should explain intent, constraints, or non-obvious decisions
- Do not use comments to restate obvious syntax

## Error Handling

Examples must distinguish among:

- Expected business conditions
- Recoverable technical failures
- Unrecoverable failures
- No-data conditions

Do not silently ignore errors. Log or return enough context to support diagnosis without exposing secrets or sensitive data.

## Security and Privacy

Academy code must not contain:

- Real credentials or tokens
- Production host names
- PHI, PII, or customer data
- Unsafe dynamic SQL patterns
- Commands that modify shared environments without safeguards

Use placeholders, environment variables, protected configuration, or documented training values.

## Performance Guidance

Code examples should avoid teaching obvious anti-patterns. Where a simple teaching example is intentionally not production-scalable, state that explicitly and explain the next step.

Discuss as relevant:

- Set-based SQL versus row-at-a-time processing
- Index and access-path implications
- Lock duration
- Repeated external calls
- Large object handling
- Array or multi-row operations

## Repository Requirements

Each code asset should include or inherit:

- Purpose
- Lesson or lab reference
- Required environment
- Build or compile command
- Run instructions
- Expected output
- Validation status
- Last validation date

## AI-Generated Code

AI-assisted code is permitted only when:

- A person reviews every line
- The code is validated under the same rules as human-written code
- Security and licensing concerns are checked
- The author can explain the result
- The material does not claim that AI output is authoritative

## Code Review Checklist

- Does it compile or run in the documented environment?
- Does it produce the expected result?
- Is the business intent clear?
- Are names and formatting consistent?
- Are errors handled?
- Are data integrity and locking considered?
- Are security concerns addressed?
- Is the code appropriate for the student level?
- Is legacy code labeled?
- Are sources and release assumptions recorded?

## Definition of Done

Code is complete when source, build instructions, expected output, validation evidence, explanation, and review status are committed together.
