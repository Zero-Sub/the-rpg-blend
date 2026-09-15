# Module 3 Instructor Guide

## Procedures, Service Programs, and Domain Design

**Status:** Content Complete — IBM i Validation Pending  
**Recommended delivery:** 8–10 hours total, split across instruction, guided labs, review, and independent assessment.

## Instructor purpose

Module 3 is the point where learners stop treating procedures only as local code-organization tools and begin reasoning about reusable IBM i application capabilities. The teaching goal is architecture judgment, not memorization of ILE commands.

The learner should finish able to explain why a business rule belongs in Model / Domain Services, how its public RPG contract is controlled, how callers bind to it, what state/error risks remain, and what evidence proves a safe change.

## Instructor preparation

Before delivery:

- Confirm the learner completed Modules 0–2 or has equivalent capability.
- Verify the designated non-production IBM i training environment.
- Verify Code for IBM i build Actions or equivalent approved build commands.
- Verify the learner build library, IFS deployment path, binding directory, and target objects.
- Run the complete `VALIDATION_RUNBOOK.md` before treating build/runtime steps as proven.
- Review `order_domain_contracts.rpgleinc`, `order_domain.rpgle`, `order_domain.bnd`, `order_domain_demo.rpgle`, and the test matrix.
- Keep the intentionally incompatible Lab 5 work isolated to a disposable branch.

## Delivery model

Use the Academy loop throughout:

**Learn → Practice → Prove → Review → Explain**

A useful pacing model is:

- Lessons 1–2: 90 minutes
- Lessons 3–5: 2.5–3 hours
- Lessons 6–7: 2 hours
- Lesson 8 + labs/review: 2 hours
- Independent challenge/assessment: 1.5–2 hours

Adjust for learner experience. Do not shorten evidence/review work simply because the learner already knows RPG syntax.

# Lesson facilitation notes

## Lesson 1 — From Procedure to Capability

### Teaching emphasis
A smaller procedure is not automatically a better architecture. Ask learners to identify what changes for the same business reason.

### Questions to ask
- What part of this flow is business behavior?
- What part coordinates work?
- What part knows where data comes from?
- What would make this rule reusable by a different caller?
- What dependencies would make the new service harder to reuse?

### Watch for
Learners often extract code around file access or screen fields because those blocks are visually obvious. Push them toward business ownership rather than source-layout convenience.

## Lesson 2 — Procedure Contracts That Mean Something

### Teaching emphasis
The contract is a business-facing promise, not a copy of the implementation's data structures.

### Demonstrate
Compare a poor interface that accepts a database/display record with one using `OrderRequest_t`, `ProductSnapshot_t`, and `OrderDecision_t`.

### Watch for
- Output parameters used where a return value would be clearer.
- Parameters named after files/screens rather than business meaning.
- Missing `CONST` on read-only structures.
- Contract fields added only because the current implementation happens to have them.

## Lesson 3 — Modules, NOMAIN, Exports, and Build Evidence

### Teaching emphasis
Source → compile → `*MODULE` is different from source → runnable `*PGM`. Make learners verify the resulting object.

### Demonstrate
Show the Code for IBM i Action before running it. Point out host, library, stream-file path, command, diagnostics, and target object.

### Stop condition
If the resolved build target is unclear, do not continue. The lesson is partly about refusing unsafe ambiguity.

## Lesson 4 — Service Programs and Binding by Reference

### Teaching emphasis
A service program packages exported procedures; callers bind to procedures rather than calling the service program as a normal program entry point.

### Demonstrate
Build the service program, inspect the binding directory, compile the caller, and prove which service dependency it resolved.

### Watch for
Learners assuming that because the caller compiled, it must have resolved the intended library/object.

## Lesson 5 — Binder Language and Signature Stability

### Teaching emphasis
A public export is a compatibility commitment.

Use the supported binder source:

```text
STRPGMEXP PGMLVL(*CURRENT) SIGNATURE('RPGBAORDDOMV1')
  EXPORT SYMBOL('EVALUATEORDER')
ENDPGMEXP
```

`CalculateDiscount` is intentionally private.

### Discussion
Ask what happens organizationally when a helper is exposed “just in case.” The answer should include expanded dependency surface, compatibility burden, and harder future refactoring.

### Lab 5
Require prediction before execution. The value is in comparing the learner's mental model with observed binding/build behavior.

## Lesson 6 — Domain Design

### Teaching emphasis
The service exists to make business behavior explicit, not to put every technical concern behind a service program.

### Boundary review
The domain contract should not expose:

- SQLCODE / SQLSTATE;
- database row formats;
- display-file fields;
- HTTP/JSON request shapes;
- library/object names;
- transport-specific errors.

Require justification for any exception rather than an automatic ban.

## Lesson 7 — Error Contracts, State, and Activation Groups

### Teaching emphasis
Separate expected business outcomes from technical failures. Then make implicit runtime state visible.

### State review prompts
- Does correctness depend on previous calls?
- Does storage persist longer than the learner assumes?
- Does the library list change behavior?
- Are data areas/job values/cache entries implicit inputs?
- Does adopted authority alter what the service can do?

### Bob activity
Bob may propose hidden dependencies, but the learner must prove them in source/runtime evidence.

## Lesson 8 — Prove and Explain

### Teaching emphasis
Compile evidence, behavior evidence, architecture evidence, and review evidence answer different questions.

Do not accept “it compiled” or “the test worked” as a substitute for a complete evidence chain.

# Lab facilitation

## Lab 1 checkpoint
Learner can classify responsibilities and defend the selected boundary before code changes begin.

## Lab 2 checkpoint
Learner can explain `NOMAIN`, identify public vs private procedures, and prove the intended `*MODULE` object was created.

## Lab 3 checkpoint
Learner can explain binding by reference and prove the caller resolves the intended `*SRVPGM`.

## Lab 4 checkpoint
Learner proves the before/after behavior matrix and confirms no infrastructure details leaked into the public domain contract.

## Lab 5 checkpoint
Learner predicts compatibility impact, observes evidence, restores the supported interface, and explains the discrepancy if prediction differed from reality.

# IBM Bob facilitation rules

Bob is integrated into the module, but it should not become the primary reasoning path.

Require the learner to:

1. perform first-pass analysis where the activity says learner-first;
2. give Bob the smallest relevant context;
3. keep secrets/production-sensitive information out of prompts;
4. record meaningful findings;
5. classify findings as Accept, Reject, Investigate, or Defer;
6. attach independent evidence to accepted/corrected findings;
7. complete the final challenge without step-by-step Bob guidance.

If a learner says “Bob says this is right,” ask: “What evidence says it is right?”

# Common mistakes and recovery

## Prototype / PI mismatch
Compare the shared contract with the procedure implementation. Remove duplicated hand-maintained declarations where practical and recompile with diagnostics enabled.

## `*MODULE` built in the wrong library
Stop. Correct context, rebuild to the assigned library, and discard evidence from the wrong target.

## Caller resolves the wrong service program
Inspect binding directory entries, library list, build library, and program/service references. Do not solve by adding duplicate entries blindly.

## Unexpected signature/interface failure
Compare the current public export/signature to what the caller was bound against. Explain compatibility before rebuilding everything.

## Helper exported accidentally
Correct binder source. Public exports should be deliberate.

## Domain contract mirrors a DB/display record
Reframe fields around business meaning and keep infrastructure layouts behind Data Services/adapters.

## Hidden job/static state
Identify lifetime and scope. Make state explicit where possible; otherwise document and test the intentional dependency.

## Bob-generated refactor changes behavior
Return to acceptance criteria and before/after tests. AI output is a proposal, not evidence.

# Assessment guidance

Use `ASSESSMENT_AND_KEY.md`.

Weighting:

- Knowledge check: 20%
- Practical implementation: 60%
- Explain-back/review: 20%

Minimum score: 80% plus no critical safety failure.

The practical portion is the most important. A learner who memorizes binder terminology but cannot safely identify source/object context or prove behavior is not complete.

# Critical safety failures

Require remediation if the learner:

- builds into an unverified/prohibited library;
- uses production/client data in labs or AI prompts;
- exposes credentials/tokens/private keys;
- bypasses authority controls simply to make the lab work;
- claims success with mismatched source/object/test evidence;
- merges the intentionally incompatible Lab 5 experiment into the supported baseline.

# Release/validation note for instructors

The course content is complete, but the source/build path remains **IBM i validation pending** until the Academy records successful compile, service-program creation, binding, runtime, test-matrix, technical-review, and learner-pilot evidence. Do not present validation-pending commands as already proven in the learner environment.
