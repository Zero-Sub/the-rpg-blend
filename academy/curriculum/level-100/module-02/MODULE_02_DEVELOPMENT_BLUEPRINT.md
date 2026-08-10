# RPGBA-101 Module 2 Development Blueprint

## 1. Module Identity

- **Canonical ID:** 100-02
- **Canonical title:** Data Structures and Procedures
- **Working learner title:** Structure the Data, Define the Contract — and Coffee
- **Status:** Development Draft
- **Primary learner:** Associate RPG developer who completed Module 1 or equivalent
- **Primary environment:** VS Code + Code for IBM i + Git/GitHub + IBM Bob
- **Application increment:** RPG Blend Coffee Company — Customer Validation

## 2. Curriculum Handoff

Module 1 established safe source reading, scalar data definitions, expressions, decisions, bounded loops, a first internal procedure, compile/run evidence, Git diff review, and accountable IBM Bob use.

Module 2 must therefore deepen the learner's ability to **model related data and define reliable procedure contracts** rather than repeat basic syntax.

### Open sequencing conflict

The canonical Academy blueprint identifies `100-02` as Data Structures and Procedures. The current Module 1 learner deck points next to Db2 access, externally described data, and file-processing fundamentals. This build follows the canonical blueprint while preserving that conflict for explicit curriculum review.

## 3. Why This Module Matters

Real RPG applications rarely consist of isolated scalar fields. Customer, order, address, pricing, response, and configuration data move through programs and procedures as related units. Poorly modeled data creates duplicated declarations, positional mistakes, hidden dependencies, ambiguous parameter ownership, and changes that are difficult to test.

The production skill is not merely knowing `DCL-DS` or `DCL-PI`. It is being able to answer:

- What business concept does this structure represent?
- Which fields belong together?
- Which data is input, output, or local working state?
- Can the caller's value be changed?
- What must match between the caller and the called procedure?
- What assumptions become dangerous when parameters are omitted, variable sized, or passed by value?
- What evidence proves the interface works at normal and boundary conditions?

## 4. Module Learning Objectives

By completion, learners will be able to:

1. Replace a loose set of related standalone values with a clear data structure when that improves the business model.
2. Use `QUALIFIED` data structures to make field ownership visible.
3. Use nested structures to represent composed business concepts.
4. Declare and process arrays and data-structure arrays with explicit bounds.
5. Use `TEMPLATE`, `LIKEDS`, and `LIKE` to reuse definitions safely.
6. Explain where layout-oriented features such as `POS` may appear and why they should not be used without a concrete layout requirement.
7. Distinguish a legacy subroutine from a modern subprocedure and identify hidden-state risks.
8. Create matching `DCL-PR` and `DCL-PI` contracts.
9. Pass read-only input with `CONST` and explain when `VALUE` is appropriate.
10. Recognize the obligations created by options such as `*NOPASS`, `*OMIT`, and `*VARSIZE` before using them.
11. Test procedure contracts with normal, boundary, invalid, and caller-impact cases.
12. Use Bob to assist with explanation and review while retaining responsibility for source, compile, runtime, and test validation.

## 5. Scope Boundaries

### In scope

- Fully free-form RPG declarations and procedures
- Qualified and nested data structures
- Arrays and data-structure arrays
- Templates and definition reuse
- Introductory layout recognition with `POS`
- Subroutine recognition and comparison
- Internal procedures
- Prototypes and procedure interfaces
- Parameters and return values
- `CONST`, `VALUE`, and carefully bounded introduction to `OPTIONS`
- Local versus global state
- VS Code navigation and Code for IBM i compile workflow
- Git diff review
- Bob explanation, contract review, missed-impact analysis, documentation support, and test suggestions

### Deferred to later modules

- Native record-level file I/O
- Embedded SQL
- External data structures sourced from database record formats as a primary topic
- Program-to-program external interfaces in depth
- Service programs
- Binder source and signatures
- Binding directories
- Activation-group architecture
- API exposure
- Dynamic memory and pointer-heavy designs

## 6. Sample Application Design

### Business scenario

The RPG Blend Coffee Company is preparing a reusable customer-validation component before customer data is persisted. The development team wants validation logic separated from UI, file, or database concerns so the same rules can later be called by multiple entry points.

### Core business model

Candidate original structures:

- `Address_t`
  - addressLine1
  - addressLine2
  - city
  - stateCode
  - postalCode
- `Customer_t`
  - customerId
  - customerName
  - emailAddress
  - preferredCustomer
  - billingAddress
  - shippingAddress
- `ValidationIssue_t`
  - fieldName
  - issueCode
  - message
- `ValidationResult_t`
  - valid
  - issueCount
  - issues array

All final names, lengths, and types must be validated in original compile-tested Academy source before release.

### Procedure candidates

- `ValidateCustomer(customer)` returns `ValidationResult_t`
- `ValidateAddress(address)` returns `ValidationResult_t` or an address-specific result
- `NormalizePostalCode(postalCode)` returns a normalized value if this can be taught without hiding business assumptions
- `AddIssue(result : field : code : message)` encapsulates result accumulation if it remains understandable at this level

The capstone must avoid unnecessary abstraction. The learner should be able to explain every structure and procedure without Bob.

## 7. Lesson Architecture

### 100-02-01 — Why Data Structures Matter

**Outcome:** The learner can identify data that belongs together and define a simple qualified data structure.

Teach:
- business concept versus loose variables;
- structure boundary and naming;
- `DCL-DS` and subfields;
- scalar versus structured state;
- simple qualified access.

VS Code activity:
- inspect a starter program with six loose customer fields;
- map the data relationship;
- refactor only the declarations and references required to introduce `customer`.

Bob activity:
- after the learner maps the fields, ask Bob to identify likely business groupings and explicitly label assumptions.

Independent task:
- group a second set of shipping values without Bob and explain why each field belongs in the structure.

### 100-02-02 — Qualified and Nested Data Structures

**Outcome:** The learner can model `customer.billingAddress.city`-style ownership deliberately.

Teach:
- `QUALIFIED`;
- nested structures;
- repeated field names without ambiguity;
- readability versus over-nesting;
- effect of moving a subfield on callers.

VS Code activity:
- use Outline and references to locate structure use;
- introduce nested billing and shipping address structures;
- compile and prove target object.

Bob activity:
- ask Bob for a data-shape diagram, then verify every relationship against source.

Independent task:
- add an emergency-contact structure and update source references without AI-generated code.

### 100-02-03 — Arrays and Data Structure Arrays

**Outcome:** The learner can process multiple structured business items safely.

Teach:
- scalar arrays versus data-structure arrays;
- `DIM` and `%ELEM`;
- meaningful indexes;
- bounded processing;
- initialization and partially populated arrays;
- count versus capacity.

VS Code activity:
- model a small validation-issue collection;
- append issues with an explicit current count;
- walk normal and maximum-capacity cases.

Bob activity:
- review bounds, count/capacity confusion, and off-by-one risk after a hand trace.

Independent task:
- process three contact records and produce a trace table without Bob.

### 100-02-04 — Templates, LIKEDS, LIKE, and POS

**Outcome:** The learner can reuse a definition without duplicating business shape.

Teach:
- `TEMPLATE` as a reusable definition;
- `LIKEDS` for data-structure shape;
- `LIKE` for matching a field definition;
- when reuse reduces drift;
- when reuse creates undesirable coupling;
- `POS` as layout-control/legacy-recognition capability, not a default modeling technique.

VS Code activity:
- create `Address_t` and `Customer_t` templates;
- define working instances from templates;
- change one template field deliberately and inspect compile impact.

Bob activity:
- ask for an impact list before changing a template; compare Bob's list with actual references and compiler evidence.

Independent task:
- introduce a second validation-result instance with `LIKEDS` without copying the structure definition.

### 100-02-05 — Subroutines Versus Subprocedures

**Outcome:** The learner can recognize a subroutine and explain why a procedure often gives a clearer modern contract.

Teach:
- purpose and shape of legacy `BEGSR`/`ENDSR` and `EXSR` code for maintenance recognition;
- shared/global-state behavior;
- local data in subprocedures;
- explicit parameters and return values;
- incremental modernization rather than automatic rewrite.

VS Code activity:
- read an original Academy legacy-style validation example;
- map all shared variables before converting one bounded responsibility to a subprocedure.

Bob activity:
- ask Bob to list read/write dependencies of the subroutine; learner verifies each reference before refactoring.

Independent task:
- decide whether a second subroutine should be converted now or retained, and justify the choice.

### 100-02-06 — Procedure Interfaces, Parameters, and Return Values

**Outcome:** The learner can define and call an internal procedure with a clear, matching contract.

Teach:
- `DCL-PR`;
- `DCL-PROC` and `DCL-PI`;
- parameter types and order;
- return values;
- local scope;
- compiler interface checking;
- hidden dependency avoidance.

VS Code activity:
- build `ValidateAddress` from a written contract;
- deliberately create a PR/PI mismatch in a disposable branch;
- read the diagnostic and restore the correct interface.

Bob activity:
- review the contract for inputs, outputs, side effects, and hidden globals; no code edits.

Independent task:
- create one one-input/one-output helper procedure from acceptance criteria.

### 100-02-07 — CONST, VALUE, OPTIONS, and Parameter Safety

**Outcome:** The learner can choose parameter semantics deliberately and avoid unsafe optional-parameter assumptions.

Teach:
- default reference behavior at a conceptual level;
- `CONST` as read-only reference;
- `VALUE` and copy semantics;
- caller-visible modification risk;
- introduction to `OPTIONS(*NOPASS)` and the need to prove whether a parameter was supplied;
- recognition of `*OMIT` and `*VARSIZE` with explicit warning that they add caller/callee obligations.

Do not turn this lesson into a keyword survey. The learner should first use mandatory, explicit parameters and understand why optional interfaces are more difficult to support safely.

VS Code activity:
- attempt an invalid modification of a `CONST` input and inspect compiler feedback;
- compare a small scalar `VALUE` parameter with reference semantics;
- inspect an optional-parameter example only after the mandatory contract is understood.

Bob activity:
- ask Bob to identify caller-impact and optional-parameter risks; learner validates against the RPG Reference and compile behavior.

Independent task:
- choose parameter semantics for three small contracts and defend each choice without Bob.

### 100-02-08 — Module Lab: Customer Validation Procedures

**Outcome:** The learner integrates the module into one explainable, tested component.

Required capabilities:
- template-based customer/address definitions;
- qualified/nested structure use;
- at least one data-structure array or structured validation collection;
- two or more procedures with explicit contracts;
- deliberate `CONST` use for read-only business input;
- normal, boundary, invalid, and capacity tests;
- compile/run proof;
- focused Git diff;
- Bob review after independent first working attempt;
- accepted/rejected finding log.

## 8. Assessment Model

Module 2 follows the Academy assessment standard.

Proposed weighting:

| Component | Weight |
|---|---:|
| Knowledge and terminology | 15% |
| Code reading and contract interpretation | 20% |
| Hands-on implementation | 45% |
| Troubleshooting and professional judgment | 20% |

Passing requires:
- at least 80% on the knowledge assessment;
- all required guided labs;
- capstone completed safely;
- no critical safety or data-integrity failure;
- learner can explain the final structures and procedure contracts without Bob.

### AI assessment mode

- Lesson labs: AI allowed with prompt/output disclosure after required independent work.
- Final knowledge assessment: AI prohibited unless an accommodation is explicitly documented.
- Capstone: AI allowed for review after an independent first working attempt; prompt, findings, disposition, and evidence must be submitted.

## 9. Critical Safety Failures

Any of the following blocks completion until corrected:

- production or unauthorized source/data/environment use;
- credentials, tokens, keys, client data, or PHI included in source, Git, screenshots, or prompts;
- learner cannot identify the source and target object affected by a compile action;
- learner submits AI-generated source they cannot explain;
- optional parameter is accessed without proving it was supplied;
- caller data is modified unintentionally through a parameter;
- array/data-structure-array logic can exceed its defined capacity;
- required evidence is falsified or omitted.

## 10. Troubleshooting Themes

The module must teach recovery from:

- qualified-name errors;
- template/instance confusion;
- type or shape mismatch;
- incorrect array bound or count;
- PR/PI mismatch;
- unexpected caller-visible parameter modification;
- invalid assumption about `CONST` or `VALUE`;
- optional parameter accessed when not passed;
- compile succeeds but the wrong logical contract was implemented;
- Bob invents or overstates a dependency.

## 11. Required Deliverables

- Student coursebook
- Instructor guide
- Lab workbook
- Lesson knowledge checks and answer key
- Module assessment and answer key
- Capstone student brief
- Capstone instructor solution and rubric
- Original RPG starter source
- Original RPG completed source
- VS Code/Code for IBM i actions or validated reuse of the canonical Academy action
- Git workflow instructions
- Bob prompt/validation record
- Source and validation register
- Technical validation runbook
- Validation tracker
- Slide deck
- Release manifest

## 12. Technical Validation Gates

### G1 — Source and syntax review
- authoritative source mapping complete;
- all release-sensitive claims identified;
- original examples confirmed;
- code standard applied.

### G2 — IBM i compile/runtime validation
- every learner source target compiles on the documented target environment;
- expected program objects are proven;
- all test matrices pass;
- deliberate diagnostic tests produce expected evidence;
- no Critical or High technical defect remains open.

### G3 — Workflow validation
- VS Code and Code for IBM i instructions match current installed versions;
- Git paths and instructions work from a clean clone;
- Bob prompts do not require protected data and workflow labels match the current product.

### G4 — Independent review
- reviewer other than author completes the labs;
- reviewer validates assessment wording and solutions;
- source/copyright review complete.

### G5 — Learner pilot
- target learner completes module without undocumented setup;
- timing recorded;
- unclear steps logged and fixed;
- capstone independently explainable.

## 13. Definition of Done

Module 2 is release-candidate ready only when all learner/instructor assets are aligned, every required source and test file exists at its documented path, IBM i compile/runtime validation passes, current-tool workflow validation passes, source rights are clean, the independent review passes, and the learner pilot produces no unresolved Critical or High defect.
