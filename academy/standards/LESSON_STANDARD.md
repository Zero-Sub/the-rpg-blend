# The RPG Blend Academy Lesson Standard

## Purpose

This standard defines the required structure, quality threshold, and review process for every Academy lesson. A lesson is not complete because the manuscript exists. It is complete only when the content teaches the concept clearly, uses technically valid examples, connects the topic to real IBM i work, and includes the supporting material needed for delivery and reuse.

## Audience Assumption

Unless a lesson states otherwise, assume the student:

- Has never programmed in RPG
- Has limited IBM i experience
- May be transitioning from another language
- Needs terminology explained before syntax is introduced
- Benefits from seeing both legacy and modern approaches

## Required Lesson Metadata

Every lesson begins with:

- Level and module number
- Lesson number and title
- Estimated time
- Prerequisites
- Required tools
- Required source files or database objects
- Sample-application component
- Source register
- Last technical verification date
- Supported IBM i release or tested environment

## Required Lesson Structure

### 1. Today’s Coffee

Open with a short coffee-centered connection to the lesson. The analogy must support the topic rather than serve as decoration.

### 2. Learning Objectives

Use measurable verbs. By the end of the lesson, the student should be able to explain, identify, create, modify, run, test, compare, or troubleshoot something specific.

### 3. Why This Matters

Explain:

- The business problem the concept solves
- Why companies use it
- Why a developer should care
- What can go wrong in production when it is misunderstood

### 4. Concepts

Teach the theory before syntax. Define terminology in plain language and connect it to concepts students may know from other platforms.

### 5. Architecture

Include a diagram when the lesson involves flow, layers, programs, files, modules, service programs, jobs, transactions, APIs, or deployment relationships.

### 6. DDS

Include DDS when the topic involves database files, display files, printer files, or legacy object definitions.

Requirements:

- Show complete code when practical
- Explain every line or logical group
- Identify legacy constraints and operational relevance
- State whether DDS is being taught for maintenance literacy or active design

### 7. SQL DDL

Show the SQL equivalent whenever appropriate.

Requirements:

- Use production-quality names and data types
- Explain constraints, keys, labels, defaults, and indexes
- Compare the SQL object model to the DDS object model
- State the preferred design direction

### 8. RPG III or Legacy RPG Recognition

Provide a legacy example when it materially helps students recognize production code.

Requirements:

- Clearly label the example as legacy
- Explain fixed-position structure and indicators
- Do not imply that legacy syntax is preferred for new development

### 9. Modern RPG

Provide the preferred modern implementation using fully free-form RPG whenever the platform level supports it.

Requirements:

- Use clear naming
- Use procedures where they improve structure
- Avoid unnecessary global state
- Avoid unexplained indicators
- Include error handling where the operation can fail

### 10. SQL Implementation

Include embedded or standalone SQL when appropriate.

Requirements:

- Explain host variables and indicator variables
- Check SQLSTATE, SQLCODE, or diagnostics as appropriate
- Explain transaction and locking effects
- Use parameter markers for dynamic SQL data values

### 11. Comparison Table

Use a concise table for relevant comparisons, such as:

- Native I/O versus SQL
- DDS versus SQL DDL
- RPG III versus modern RPG
- CHAIN versus SETLL/READE
- Static SQL versus dynamic SQL
- Module versus program versus service program

### 12. Common Mistakes

List the errors a beginner is likely to make. Explain the symptom, likely cause, and correction.

### 13. Pro Tips

Include practical production advice based on maintainability, debugging, supportability, performance, security, and team standards.

### 14. Lab

Link to a lab that requires the student to use the lesson’s core skill. The lab must follow `LAB_STANDARD.md`.

### 15. Challenge

Provide a more advanced exercise without a complete solution in the student version.

### 16. Manager’s Perspective

Discuss at least two of the following:

- Onboarding
- Maintainability
- Code review
- Production support
- Mentoring
- Technical debt
- Risk management
- Team standards

### 17. Knowledge Check

Include five to ten questions aligned to the learning objectives. Use a mix of recall, interpretation, troubleshooting, and application.

### 18. Final Sip

End with a coffee analogy tied to craftsmanship, judgment, leadership, or professional growth.

## Writing Requirements

Every lesson must be:

- Beginner friendly
- Technically precise
- Direct and practical
- Written in Markdown
- Organized with meaningful headings
- Free from filler and unexplained jargon
- Original in wording and examples
- Suitable for conversion to article, workbook, PDF, slides, or video script

## Code Explanation Standard

Code may be explained line by line or in logical groups. The explanation must cover:

- What the statement does
- Why it is present
- Inputs and outputs
- Important side effects
- Failure conditions
- Production considerations

## Sample Application Rule

Every lesson should extend or explain the RPG Blend Coffee Company Order Management System unless there is a documented reason to use another example.

## Source Requirements

Every lesson must include a source register containing:

- Source title
- Publisher or owner
- Release or edition
- Chapter, section, or topic
- Verification date
- Whether the source is authoritative or supplemental

Current IBM documentation governs release-sensitive behavior.

## Lesson Review Gates

A lesson moves through:

```text
Draft
→ Technical Review
→ Compile or Execution Validation
→ Instructional Review
→ Source Validation
→ Pilot Delivery
→ Revision
→ Approved
```

## Definition of Done

A lesson is complete only when:

- All required sections are present or marked not applicable with a reason
- Code follows `CODE_STANDARD.md`
- The lab follows `LAB_STANDARD.md`
- The knowledge check follows `ASSESSMENT_STANDARD.md`
- Sources follow `SOURCE_VALIDATION_STANDARD.md`
- Examples have been compiled, executed, or explicitly marked unverified
- Screenshots and diagrams are current and readable
- Student and instructor versions are synchronized
- The lesson has an owner and verification date
