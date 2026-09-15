# Module 3 Independent Challenge Starter

This directory contains the intentionally incomplete source for the **Do It Without Me** assessment.

The starter already receives `ProductSnapshot_t.active`, but it does not define an inactive-product result code and does not reject inactive products. That gap is deliberate.

## Learner requirement

A product marked inactive cannot be ordered, and the returned business result must distinguish an inactive product from insufficient quantity.

Before editing:

1. write acceptance criteria;
2. review the public contract and decide whether it must change;
3. predict the required tests and compatibility impact.

Then implement the smallest correct change, rebuild/verify the intended objects, execute the required test matrix, inspect the Git/binder impact, and only then use IBM Bob for post-implementation review.

## Expected solution

The root `src/coffee-company/` reference source represents the Academy expected design direction and includes the inactive-product business outcome. Do not inspect or copy that solution until the instructor releases it for review.

The starter and expected solution both remain IBM i compile/runtime validation pending until the Module 3 validation runbook is completed on the designated training environment.
