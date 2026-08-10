# 100-02-01 — Why Data Structures Matter

> **Publication status:** Draft — source reviewed at concept level; IBM i compile/runtime validation pending.

## Lesson Metadata

- **Level:** 100 — Associate Foundations
- **Module:** 100-02 — Data Structures and Procedures
- **Lesson:** 100-02-01
- **Estimated time:** 50 minutes instruction + 40 minutes lab
- **Prerequisites:** Module 1 or equivalent capability with scalar declarations, arrays, conditions, loops, one simple internal procedure, Code for IBM i compile actions, Git diff, and evidence-first Bob use
- **Required tools:** VS Code, Code for IBM i, RPGLE language support, Git, approved IBM i training connection, IBM Bob
- **Sample application increment:** Customer Master — replace loose customer values with one explicit business structure

## Today's Coffee

A bag of coffee is more useful when the label keeps the roast, origin, weight, and lot information together. Customer data has the same problem: the values may all be valid individually, but the application becomes easier to reason about when related values have a clear owner.

The analogy ends there. In RPG, a data structure is not decoration. It changes how data is named, passed, copied, initialized, and maintained.

## Learning Objectives

By the end of this lesson, the learner will be able to:

1. Explain the difference between related standalone fields and a data structure.
2. Identify a business concept whose values should be modeled together.
3. Define a simple fully free-form data structure with `DCL-DS` and `END-DS`.
4. Use `QUALIFIED` access to make subfield ownership explicit.
5. Refactor a small program from loose fields to a data structure without changing its intended output.
6. Use VS Code references and Git diff to prove the scope of the change.
7. Use Bob to review the proposed grouping only after independently mapping the source.

## Why This Matters

A maintenance request may sound small: add a customer field, validate an address, pass customer information to another procedure, or copy a result into another part of the application. When every related value is a separate global or standalone field, the developer has to reconstruct the relationship from names and usage.

A deliberate data structure can make that relationship visible in the source. Instead of asking whether `city` belongs to the customer, supplier, warehouse, or shipping destination, the source can say `customer.city`.

That does **not** mean every set of fields belongs in a data structure. A structure should represent a meaningful technical or business grouping. Creating a giant structure simply to avoid declarations can make dependencies worse.

## Concepts

### Standalone data

A standalone field represents one value. Module 1 used standalone fields because they make individual RPG types and expressions easy to see.

Example:

```rpg
DCL-S customerName VARCHAR(40);
DCL-S city VARCHAR(30);
DCL-S postalCode CHAR(10);
```

Those declarations are valid, but their relationship exists only in naming and developer knowledge.

### Data structure

A data structure groups subfields under one definition. In modern free-form RPG, a program-described structure begins with `DCL-DS` and ends with `END-DS`.

```rpg
DCL-DS customer QUALIFIED;
   name VARCHAR(40);
   city VARCHAR(30);
   postalCode CHAR(10);
END-DS customer;
```

IBM documents that free-form data structures use `DCL-DS`, subfield definitions, and `END-DS`. A `QUALIFIED` data structure requires subfields to be referenced through the data-structure name. This lesson uses that behavior to make ownership visible.

### Why qualified access is the Academy default for this lesson

Compare:

```rpg
city = 'Franklin';
```

with:

```rpg
customer.city = 'Franklin';
```

The second statement carries more context. It also allows another qualified structure to have its own `city` subfield without forcing an artificial name such as `shipCity`, `billCity`, or `customerCity` everywhere.

This is an **Academy design recommendation for these examples**, not a claim that every RPG data structure in every application must be qualified.

## Architecture

Before the refactor:

```text
[Program]
   ├── customerId
   ├── customerName
   ├── city
   ├── stateCode
   ├── postalCode
   └── preferredCustomer
```

After the refactor:

```text
[Program]
   └── customer
       ├── id
       ├── name
       ├── city
       ├── stateCode
       ├── postalCode
       └── preferred
```

The behavior does not have to change for the design to improve. A safe refactor first preserves behavior, then later lessons add nesting, reusable templates, and procedure contracts.

## Original RPG Example

### Starting point — loose fields

```rpg
**free

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-s customerId packed(7 : 0) inz(1001);
dcl-s customerName varchar(40) inz('Avery Reed');
dcl-s city varchar(30) inz('Franklin');
dcl-s stateCode char(2) inz('TN');
dcl-s postalCode char(10) inz('37064');
dcl-s preferredCustomer ind inz(*on);
dcl-s message varchar(52);

message = %trim(customerName) + ' | ' + %trim(city);
dsply message;

*inlr = *on;
```

### Refactored point — one qualified structure

```rpg
**free

ctl-opt dftactgrp(*no)
        actgrp(*new)
        option(*srcstmt : *nodebugio);

dcl-ds customer qualified;
   id packed(7 : 0) inz(1001);
   name varchar(40) inz('Avery Reed');
   city varchar(30) inz('Franklin');
   stateCode char(2) inz('TN');
   postalCode char(10) inz('37064');
   preferred ind inz(*on);
end-ds customer;

dcl-s message varchar(52);

message = %trim(customer.name) + ' | ' + %trim(customer.city);
dsply message;

*inlr = *on;
```

**Validation note:** These examples are Academy-original source and remain draft until compiled and run in the documented Module 2 validation environment.

## Line-by-Line Walkthrough

| Line or section | Explanation | Review question |
|---|---|---|
| `dcl-ds customer qualified;` | Begins a named, qualified data structure. | Does `customer` represent one coherent concept? |
| `id packed(7 : 0)` | Customer identifier for this fictional training model. | Is the training range documented rather than assumed to be universal? |
| `name varchar(40)` | Variable-length customer name used by the lab. | Is 40 an Academy requirement or a real system rule? |
| `city varchar(30)` | City owned by the current simplified customer structure. | Will later nesting give this value a more precise owner? |
| `stateCode char(2)` | Two-character value used only by this fictional first lesson. | Are we accidentally teaching a US-only rule as universal? |
| `postalCode char(10)` | Character representation of the training postal value. | Why would numeric storage be a poor general assumption? |
| `preferred ind` | Boolean-like state. | Does the name explain what `*ON` means? |
| `end-ds customer;` | Ends the data structure. | Is the structure boundary obvious in the source? |
| `customer.name` | Qualified subfield reference. | Is the data owner clear to a maintainer? |

### Important domain warning

The field lengths and state-code example above are fictional Academy requirements. They are **not** a universal address model. The course deliberately keeps Lesson 1 small; later examples must continue to distinguish training requirements from claims about real customer data.

## Comparison

| Loose standalone fields | Qualified data structure | Recommended use in this lesson |
|---|---|---|
| Easy for the first few scalar declarations | Makes a related concept explicit | Prefer the structure once the fields represent one business unit |
| Relationship depends on names and context | Ownership appears in references such as `customer.name` | Use when clarity improves |
| Easy to create duplicate naming conventions | Qualified subfields can reuse meaningful names | Prefer meaningful names over prefixes used only to prevent collisions |
| Passing several related values later can become awkward | Structure can become a deliberate procedure parameter in later lessons | Prepare for explicit contracts, but do not jump ahead yet |

## VS Code Demonstration

1. Open the Module 2 workspace on the development branch.
2. Connect only to the approved Academy nonproduction IBM i partition.
3. Record host alias, user profile, source path, current/build library, and planned program object.
4. Open the loose-field source.
5. Before editing, use Search/References to locate every use of the six customer fields.
6. Build a short data map: field, current purpose, reads, writes, output use.
7. Predict the current output.
8. Compile and run the baseline when the instructor validation package provides the approved action/object name.
9. Refactor the six related fields into `customer QUALIFIED`.
10. Update only references required by that refactor.
11. Inspect Problems and compiler output.
12. Verify the expected object was created.
13. Run the same behavior test.
14. Use `git diff` to confirm that no unrelated cleanup entered the change.

### Evidence gate

The learner must prove both of these statements separately:

- **Behavior evidence:** the refactored program produces the expected observable result.
- **scope evidence:** the diff contains only the intended structural refactor.

A compile alone proves neither statement.

## Bob-Assisted Activity

Complete the data map before using Bob.

Suggested prompt:

```text
Review these RPG declarations as a data-modeling exercise.
Do not rewrite the source.

For each proposed grouping:
1. Identify the exact fields that support the grouping.
2. Separate facts from assumptions about business meaning.
3. Identify any field that may not belong in the same structure.
4. List source references that should be checked before refactoring.
5. Suggest tests that would prove behavior did not change.

Do not assume production schemas, files, or customer rules that are not shown.
```

### Validation requirement

Record:

- one Bob observation supported by the source;
- one Bob assumption that the source cannot prove;
- one suggestion accepted or rejected;
- evidence for the decision.

## Hands-On Lab — Give Customer Data an Owner

### Scenario

A teammate is preparing the training customer program for later validation procedures. Before any new rule is added, the team wants related customer values grouped clearly without changing program behavior.

### Objective

Refactor the assigned loose customer fields into one qualified data structure and prove that the observable result remains unchanged.

### Starting point

- Repository path: Module 2 Lesson 1 source directory
- Branch: instructor-assigned learner branch
- Environment: isolated Academy nonproduction
- Source: starter file provided with this lesson
- Data: fictional Academy values only

### Tasks

1. Verify environment and Git context.
2. Read the entire starter source.
3. Identify the fields that make up the customer concept.
4. Record all references to those fields.
5. Predict current output.
6. Compile/run the baseline if assigned by the instructor.
7. Create `customer QUALIFIED`.
8. Move only the approved fields into the structure.
9. Update source references.
10. Compile and inspect diagnostics.
11. Prove the expected target object.
12. Run the same test and compare output.
13. Review the diff line by line.
14. Complete the Bob review only after the first working result.
15. Record residual risk.

### Expected result

The program's intended output is unchanged, the related fields have a visible owner, the source compiles under the approved action, and the diff contains only the structural refactor.

### Validation checklist

- [ ] Correct nonproduction host and profile recorded
- [ ] Correct source and target identified
- [ ] Baseline behavior predicted
- [ ] All affected field references found
- [ ] Qualified structure created
- [ ] Program compiles under approved action
- [ ] Expected object proven in build library
- [ ] Observable behavior matches baseline
- [ ] Git diff contains only intended changes
- [ ] Bob used only after independent first working result
- [ ] Learner can explain every changed line

### Troubleshooting guide

| Symptom | Likely issue | Inspect |
|---|---|---|
| `name` or `city` is no longer found | Reference was not qualified after the refactor | Search results and compiler diagnostic |
| Compile succeeds but output differs | Initialization or reference changed during the move | Old/new values and diff |
| Wrong customer value appears | A similarly named field remains outside the structure | All references and qualified names |
| Many unrelated lines changed | Refactor expanded into cleanup | Revert unrelated edits and refocus diff |
| Bob describes a file/table dependency | It inferred context not present in the lesson source | Mark as assumption; verify or reject |

### Reflection

1. What relationship became clearer after qualification?
2. Which field was hardest to decide whether it belonged in the structure, and why?
3. What did the compile prove? What did the regression test prove?
4. What change would make this structure too broad or too coupled?

### Cleanup

Use the Academy reset/branch workflow. Do not delete shared objects or source. Exact reset commands will be added after IBM i validation.

## Independent Task

Without Bob, take a second set of fictional shipping-contact fields and:

1. decide whether they form one coherent structure;
2. create a qualified structure if justified;
3. update all source references;
4. produce a before/after data map;
5. explain why each field belongs—or does not belong—in the structure.

Only after that explanation is complete may Bob review the decision.

## Common Mistakes

### Turning every field into one giant structure

Grouping is useful only when the boundary means something. A structure called `everything` simply creates a larger hidden dependency.

### Assuming prefixes are equivalent to qualification

`custCity` is a naming convention. `customer.city` is a language-level ownership relationship in the source.

### Refactoring and changing business behavior at the same time

When the learning objective is structural refactoring, keep behavior stable first. Smaller diffs make review and regression evidence stronger.

### Copying a real customer record into the lab

The Academy lab uses fictional values. Real client or production data does not belong in source, screenshots, Git history, or Bob prompts.

## Pro Tips

- Search all references before moving a declaration.
- Refactor one concept at a time.
- Treat compile diagnostics as interface/syntax evidence, not business validation.
- Prefer explicit names that make a maintenance conversation easier.
- When a structure begins to contain unrelated concepts, question the boundary before adding the next field.

## Knowledge Check

1. What does a data structure add beyond a set of standalone fields?
2. What does `QUALIFIED` change about how a subfield is referenced?
3. Why can two different qualified structures safely use the same subfield name such as `city`?
4. What evidence should you collect before moving fields into a structure?
5. Why is compile success insufficient proof that a structural refactor is safe?
6. Why are the field lengths in the Academy example not universal customer-data rules?
7. When could a data structure make an application harder to maintain rather than easier?

## Manager's Perspective

Data structures are a code-review signal. They show whether a developer sees a business concept or only a list of fields. For an associate developer, the review conversation should focus on boundaries and evidence:

- Why do these values belong together?
- Who owns the data?
- What code reads or changes it?
- Did behavior change accidentally?
- Can the learner explain the diff without AI?

A reviewer should resist both extremes: hundreds of unrelated standalone variables and giant context structures passed everywhere. The goal is understandable ownership with controlled coupling.

## Final Sip

The first win is not fewer declarations. It is being able to point at a value and say, from the source itself, what it belongs to.

## References

- IBM, *ILE RPG Reference*, IBM i 7.6, current IBM Documentation topics for free-form definition statements, data-structure subfields, and qualified data structures. Current-topic mapping and validation date must be entered before pilot.
- IBM, *ILE RPG Programmer's Guide*, IBM i 7.6, SC09-2507-12, 2025. Used to validate RPG procedure/application context, not lesson structure or examples.
- The RPG Blend Academy, *Code for IBM i Quick Start Handbook*, v1.1, August 5, 2026. Used for the Academy VS Code/Code for IBM i operational baseline; live tooling revalidation required.
- Code for IBM i project documentation. Current action/navigation behavior must be revalidated before pilot.
- IBM Bob documentation. Current product workflow must be revalidated before pilot.
