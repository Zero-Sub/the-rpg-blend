# Module 0 Assessment — IBM i Orientation

## Assessment model

Module 0 completion is based on demonstrated competence, not quiz score alone.

- Knowledge check: 20%
- Guided evidence package: 20%
- Independent Coffee Company challenge: 50%
- Explain-back: 10%

A critical safety failure or inability to complete the independent workflow requires remediation regardless of numerical score.

---

# Part A — Knowledge check

1. Which statement is correct?
   - A. IBM i is the hardware server.
   - B. IBM i is an operating system and integrated business platform that runs on IBM Power.
   - C. IBM Power is an RPG compiler.
   - D. AS/400 is the current operating-system name.

2. What is the most important reason to verify host, identity, source, library, and target before a change?
   - A. It makes commands shorter.
   - B. It proves the compiler is installed.
   - C. It reduces the risk of changing or creating the wrong artifact in the wrong context.
   - D. It replaces object authority.

3. What is the Academy's primary IBM i development environment?
   - A. SEU
   - B. VS Code with Code for IBM i
   - C. STRSQL
   - D. PDM only

4. Which statement best describes ACS in the Academy toolbelt?
   - A. It is obsolete and should never be used.
   - B. It replaces VS Code for all source development.
   - C. It remains appropriate for capabilities such as Run SQL Scripts, 5250, spooled files, data transfer, database tooling, and some SQL/performance work.
   - D. It is an AI assistant.

5. What is the difference between RPG source and a `*PGM`?
   - A. They are the same artifact.
   - B. Source is editable text; the `*PGM` is an executable object produced by a successful build path.
   - C. The `*PGM` is stored only in Git.
   - D. Source can be called directly with `CALL`.

6. A compile fails, but an older program object already exists. Which conclusion is safe?
   - A. Calling the old object proves the new source works.
   - B. The failed compile proves the requirement is correct.
   - C. The existing object may still represent older source, so runtime output from it is not proof of the failed change.
   - D. Delete the object immediately.

7. What is the correct role of AI in this module?
   - A. Make final technical decisions for the learner.
   - B. Replace testing when the answer looks plausible.
   - C. Assist with explanation, diagnosis, review, tests, and documentation while the learner verifies results and owns the decision.
   - D. Receive production data so it has maximum context.

8. A user reports “the IBM i is slow.” What should a new Module 0 learner do?
   - A. Immediately change Collection Services settings.
   - B. Restart the partition.
   - C. Gather approved context/evidence and use or escalate to the appropriate operational/performance workflow rather than changing shared collection configuration without authority.
   - D. Recompile the Coffee Company program.

9. Put these actions in a safe order: review evidence, verify context, make minimal change, understand current state, validate behavior.

10. Explain what a successful compile proves and two things it does not prove.

## Answer key

1. **B**
2. **C**
3. **B**
4. **C**
5. **B**
6. **C**
7. **C**
8. **C**
9. Expected: verify context → understand current state → make minimal change → validate behavior → review evidence. Equivalent wording aligned to the controlled-change workflow is acceptable.
10. Expected: successful compile proves that the compiler/build path accepted the source sufficiently to create the intended build result, subject to verifying the target. It does not by itself prove the requirement was interpreted correctly, runtime behavior is correct, boundaries are correct, the right source/target was used, or the change is safe for production.

---

# Part B — Guided evidence package

Required evidence:

- context record;
- Coffee Company starting-state prediction;
- successful baseline compile and target-object proof;
- intentional diagnostic and correction;
- focused requirement/diff;
- expected vs actual runtime result;
- read-only SQL observation;
- AI finding disposition when AI is available;
- Git evidence when Git is used;
- safe documentation with no secrets or sensitive data.

Score this section complete only when evidence is coherent and points to the same source, target, and requirement.

---

# Part C — Independent challenge

Requirement:

> Change the Coffee Company orientation message to `Coffee Company Module 1 ready.`

The learner must independently:

1. verify context;
2. locate the source;
3. state expected behavior before editing;
4. make only the required change;
5. compile;
6. verify the intended `*PGM`;
7. run and validate;
8. review the diff;
9. capture safe evidence;
10. explain the result.

Course references are allowed. AI may be used after the learner's first independent attempt for explanation, diagnosis, or review. AI may not provide the entire workflow as a substitute for learner competence.

## Independent challenge rubric

| Area | Meets expectation |
|---|---|
| Context | Correct host/connection, identity, source, build library, and target are identified before change |
| Understanding | Learner predicts baseline/new behavior before running it |
| Change control | Change is minimal and traceable to the requirement |
| Build | Learner uses the approved build path and interprets diagnostics |
| Target proof | Learner proves the intended program object was created/updated |
| Validation | Runtime behavior matches the acceptance criterion |
| Review | Diff/evidence contains no unexplained unrelated change |
| Independence | Learner completes the core workflow without step-by-step expert direction |

### Intervention rating

Record the highest level required:

0. Independent
1. Clarification only
2. Hint
3. Step-by-step guidance
4. Instructor performed action

For release-pilot purposes, a target learner should complete the core challenge at **0 or 1**. A rating of 2–4 is curriculum evidence requiring review even if the learner eventually succeeds.

---

# Part D — Explain-back

Without AI assistance, the learner must explain:

1. IBM Power versus IBM i.
2. Source versus `*PGM`.
3. Why the library/build target matters.
4. Why VS Code + Code for IBM i is the home-base development environment.
5. One situation where ACS or Navigator for i is more appropriate.
6. The troubleshooting ladder used when expected and actual results differ.
7. What changed in Coffee Company.
8. What evidence proves the intended object was built.
9. What evidence proves runtime behavior.
10. What AI contributed and what the learner independently verified.

---

# Critical gates

The learner is **not yet complete** if any of these occur without recognition and remediation:

- works in the wrong environment or target and cannot explain the mistake;
- exposes credentials, secrets, PHI, customer data, or other prohibited information;
- performs an unauthorized system/data/configuration change;
- cannot distinguish source from executable object;
- cannot identify the build target;
- cannot complete the independent controlled-change workflow;
- treats AI output, compile success, or Git history as sufficient proof of correctness by itself.
