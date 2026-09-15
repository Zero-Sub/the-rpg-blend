# Module 3 Student Workbook

Use this workbook to capture reasoning and evidence. Do not replace your own analysis with IBM Bob output.

## Preflight

Record:

- Git branch/revision:
- IBM i connection nickname/host alias:
- User profile:
- Build library:
- Local source path:
- Remote IFS source path:
- Intended `ORDERDOM *MODULE`:
- Intended `ORDERDOM *SRVPGM`:
- Intended caller object:

## Lesson 1 — Boundary analysis

### Responsibility map

For each relevant block in the starting Coffee Company flow, classify it as presentation, orchestration, business rule, data access, or technical support.

### Chosen domain capability

- Capability name:
- Why it should change independently:
- Inputs:
- Outputs:
- Side effects:
- Current dependencies:
- Dependencies that should remain outside the domain service:

### Bob review disposition

| Finding | Accept / Reject / Investigate / Defer | Evidence / reason |
|---|---|---|
|  |  |  |
|  |  |  |

## Lesson 2 — Contract design

For each field in `OrderRequest_t`, `ProductSnapshot_t`, and `OrderDecision_t`, record:

- business meaning;
- input/output ownership;
- why the field belongs in the domain contract;
- any implementation-specific field deliberately excluded.

### Contract questions

1. Which values are trusted business facts versus raw request values?
2. Which parameters should be `CONST`?
3. Does any field mirror a screen or database layout only because it was convenient?
4. What would a future API caller need to know about this contract?

## Lesson 3 — Module evidence

- Resolved `CRTRPGMOD` command:
- Source revision:
- Target library/object:
- Compile result:
- Diagnostics reviewed:
- Object verification method:
- Git diff reviewed:

What did the compiler prove? What did it not prove?

## Lesson 4 — Service-program evidence

- Resolved service-program creation command:
- Binder-source path:
- Target `*SRVPGM`:
- Binding directory:
- Caller object:
- Expected service dependency:
- Actual resolved dependency:
- Runtime smoke-test result:

Explain binding by reference in your own words.

## Lesson 5 — Public interface review

- Binder signature:
- Exported symbols:
- Private helpers:
- Why is each exported symbol public?
- Why is each private helper private?

### Compatibility experiment

Before changing the interface:

- predicted impact:
- affected caller(s):
- expected build/runtime result:

After the experiment:

- actual result:
- evidence:
- recovery steps:
- what you learned:

## Lesson 6 — Domain design review

Check each statement and explain any exception:

- [ ] No SQLCODE/SQLSTATE in the public domain contract.
- [ ] No database row layout in the public domain contract.
- [ ] No display-file fields in the public domain contract.
- [ ] No HTTP/JSON transport shape in the public domain contract.
- [ ] Business rule names use business language.
- [ ] Presentation and data access remain outside `ORDERDOM`.
- [ ] Required behavior is preserved.

## Lesson 7 — Failure and state review

### Failure-mode table

| Scenario | Business or technical? | Responsible layer | Returned contract value | Diagnostic evidence |
|---|---|---|---|---|
| Invalid quantity |  |  |  |  |
| Product mismatch |  |  |  |  |
| Inactive product |  |  |  |  |
| Insufficient quantity |  |  |  |  |
| Unexpected technical failure |  |  |  |  |

### Hidden-state checklist

For each item, record none / intentional / defect / investigate:

- static storage;
- data areas;
- job-scoped values;
- current library/library list;
- activation-group assumptions;
- caches;
- open data paths;
- adopted authority;
- IFS/environment configuration.

## Lesson 8 — Evidence packet

Attach or reference:

- [ ] source revision;
- [ ] focused Git diff;
- [ ] build commands;
- [ ] compiler diagnostics;
- [ ] `*MODULE` evidence;
- [ ] `*SRVPGM` evidence;
- [ ] binder exports/signature;
- [ ] caller/binding evidence;
- [ ] full test matrix;
- [ ] Bob findings/dispositions;
- [ ] known limitations;
- [ ] independent explain-back notes.

## Independent challenge

### Requirement

A product marked inactive cannot be ordered, and the returned business result must distinguish inactive product from insufficient quantity.

### Before coding

Write acceptance criteria:

1.
2.
3.
4.

Does the public contract need to change? Why or why not?

### Implementation evidence

- Files changed:
- Objects rebuilt:
- Binder-source change required? Yes / No
- Tests executed:
- Regression result:
- Git diff summary:

### Post-implementation Bob review

| Finding | Disposition | Evidence |
|---|---|---|
|  |  |  |

### Explain-back

In your own words, explain what changed, why the behavior belongs in the domain service, how callers depend on the service, and how you proved the result.
