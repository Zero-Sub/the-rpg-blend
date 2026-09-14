# Getting the Module 3 Code

Module 3 continues the Coffee Company work in the same `the-rpg-blend` repository used by earlier Academy modules.

Do not retype the examples from course material and do not start from an unrelated download. Use the reviewed repository source so that Git history, source evidence, and instructor validation all refer to the same baseline.

## Repository

`Zero-Sub/the-rpg-blend`

Development branch while Module 3 is being built:

`academy/module-03-domain-services`

Learners should use the release/learner branch named by the instructor once Module 3 is promoted beyond development status.

## Source path

```text
academy/curriculum/level-000/module-03/src/coffee-company/
```

Development files:

```text
order_domain_contracts.rpgleinc
order_domain.rpgle
order_domain.bnd
order_domain_demo.rpgle
```

Required behavior matrix:

```text
academy/curriculum/level-000/module-03/tests/order_domain_cases.md
```

## If the repository is already cloned

1. Finish, commit, stash, or deliberately discard unrelated local work according to the lab instructions.
2. Fetch the current remote state.
3. Switch to the instructor-assigned branch.
4. Pull only when the working tree and branch state are understood.
5. Open the repository folder in Visual Studio Code.
6. Navigate to the Module 3 source path.
7. Verify the IBM i connection, user profile, build library, and remote deployment path before running a build action.

## Evidence gate before editing

The learner must be able to identify:

- Git branch;
- Git revision or starting commit;
- local source path;
- IBM i connection nickname/host alias;
- IBM i user profile;
- build library;
- remote IFS source path used by the compile action;
- intended `ORDERDOM *MODULE` target;
- intended `ORDERDOM *SRVPGM` target;
- intended caller target.

A clean editor window is not evidence that the learner is on the right branch or IBM i system.

## Module continuity

Module 1 introduced a focused pricing procedure inside the Coffee Company program. Module 3 uses that idea as the starting point for a stronger boundary: a reusable Order Domain service with a controlled public interface.

The learner should be able to explain what moved, what stayed outside the service, and why.