# Module 0 Troubleshooting Guide

The goal is not to memorize every IBM i error. The goal is to respond to a mismatch methodically and safely.

# Troubleshooting ladder

1. **Stop.** Do not make more changes at random.
2. **Restate the goal.** What exact result were you trying to produce?
3. **Verify context.** Host/connection → user profile → source → build library → target.
4. **Compare expected vs actual.** State the exact mismatch.
5. **Read the evidence.** Compiler diagnostic, Problems view, terminal output, object location, runtime output, SQL result, or Git diff.
6. **Use course references.** Search by symptom, not by guessing a fix.
7. **Use approved AI assistance if useful.** Ask for explanation or diagnostic possibilities, not an unverified rewrite.
8. **Verify any suggestion.** Use current source, diagnostics, tests, documentation, and runtime evidence.
9. **Escalate with evidence.** Provide goal, expected, actual, diagnostic, context, and checks already performed.

# Common symptoms

## I cannot connect

Check:

- approved connection/host name;
- network/VPN requirements;
- user profile/authentication method;
- whether the course preflight passed;
- whether the problem affects only you or multiple learners.

Do not change server configuration yourself unless that is explicitly your role and scope.

## I connected, but I cannot find the library/object

Check:

- correct IBM i connection;
- correct user profile;
- exact library/object name;
- Object Browser filter/settings;
- whether the object should exist yet;
- whether your authority allows you to see/use it.

Do not create a duplicate object simply because you cannot see the expected one.

## I changed source, but the output did not change

Check:

- did the source save?
- did the compile succeed after the change?
- did you compile the intended source?
- did the build target the intended learner library?
- are you calling the qualified intended program?
- are you accidentally running an older existing object?

## Compile failed

Check:

1. first useful diagnostic;
2. source line/location associated with it;
3. whether the source was saved;
4. whether one small correction resolves the stated issue.

Do not keep making unrelated edits until something compiles.

## Compile succeeded, but I am not sure which object was created

Stop before calling anything. Verify the build action/command and the target library/object. Compiler success without target proof is incomplete evidence.

## SQL does not return what I expected

Check:

- correct IBM i connection/database context;
- whether the query is the instructor-approved read-only query;
- spelling/schema qualification;
- what the query actually asks, not what you intended it to ask.

Do not turn the Module 0 observation into an `INSERT`, `UPDATE`, `DELETE`, `ALTER`, or other write/change operation unless the exercise explicitly authorizes it.

## Git shows files I did not intend to change

Do not stage everything. Inspect the files and diff. Determine whether the change is generated, accidental, or required. The final Module 0 change should remain focused and explainable.

## AI gives me a confident answer that conflicts with the course evidence

Treat the AI output as a hypothesis. Prefer source, compiler/runtime evidence, current primary documentation, and approved team/course guidance. Record the conflict and escalate if needed.

# Escalation template

Use this when asking for help:

- **Goal:**
- **Expected:**
- **Actual:**
- **Connection/profile:**
- **Source:**
- **Build target:**
- **Diagnostic/evidence:**
- **What I already checked:**
- **What I think the next safe step is:**

A good escalation package helps another engineer assist without redoing your entire investigation.
