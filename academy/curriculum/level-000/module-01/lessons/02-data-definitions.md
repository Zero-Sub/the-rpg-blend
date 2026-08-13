# Lesson 2 — Declare Data That Matches the Business

**Estimated time:** 65 minutes

## Why this matters

Small declaration mistakes create real defects: fields too short, decimal precision wrong, state left implicit, or technically valid values that violate business rules.

## Objectives

- Use `dcl-s` and `dcl-c` deliberately.
- Explain `char`, `varchar`, `packed`, `int`, `date`, `ind`, arrays, and initialization.
- Read packed precision as total digits plus decimal positions.
- Distinguish technical storage capacity from business validation.
- Explain introductory local/global scope considerations.

## Lab

Use `src/lesson-02/data_definitions.pgm.rpgle`. Predict values before compile, verify final total, then modify one declaration under an instructor-provided requirement and explain the choice.

## Bob activity

Have Bob review only the declarations. Require it to identify capacity risks, initialization assumptions, precision questions, and business rules it cannot prove from source.

## Independent task

Correct a provided declaration set without Bob, then defend every type, length, precision, and initialization decision.

## Production-safety note

Do not solve a data-definition problem by widening fields indiscriminately. Capacity, interfaces, persistence, downstream consumers, and business rules all matter.