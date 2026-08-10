# Lesson 3.9 — Native I/O or SQL? Make an Engineering Choice

## Metadata

- **Estimated time:** 65 minutes
- **Validation status:** conceptual/source review complete; examples depend on validated prior lessons

## Learning Objectives

The learner can:

1. Compare native RPG access and embedded SQL without caricaturing either.
2. Recognize direct keyed-record and set-oriented query shapes.
3. Identify maintainability, target-resolution, diagnostic, locking, and test considerations.
4. Explain when existing native code should be preserved, improved, or reconsidered.
5. Document an access decision another developer can review.

## Start with the Workload

### Strong native candidate

- application already uses a stable keyed file contract
- one record is needed by a known key
- maintenance change is small and well tested
- rewriting would add risk without business value

### Strong SQL candidate

- result spans multiple related tables
- filtering/grouping/aggregation is naturally set-oriented
- application needs a defined relational projection
- replacing hand-written navigation would materially simplify logic

These are patterns, not laws.

## Decision Questions

Before choosing, ask:

1. What data shape does the requirement need?
2. Is this one known record, a keyed group, or an arbitrary set?
3. What existing application contract must remain stable?
4. Which approach makes target resolution easiest to prove?
5. Which approach is clearer to the maintaining team?
6. What locks/transactions can occur?
7. What errors must the application distinguish?
8. How will the code be tested and reviewed?
9. Is performance evidence available, or are we guessing?

## Avoid False Modernization

Replacing every `CHAIN` with SQL can create churn without improving architecture. Keeping every record-level loop because “that is how RPG works” can also preserve unnecessary complexity.

Modernization is an engineering outcome: clearer contracts, lower change risk, better testability, controlled data access, and maintainable design. Syntax alone does not prove it.

## Mixed Access

Some applications deliberately use both native and SQL access. When that happens, reviewers need to understand:

- transaction/commit scope
- lock interactions
- object/record-format dependencies
- naming and target resolution
- whether each interface sees the expected data state

Do not mix interfaces casually in one unit of work without understanding those rules.

## Bob-Assisted Activity

Give Bob a short requirement and two candidate implementations. Ask for tradeoffs, not a winner. Reject claims about performance, locks, or environment configuration that lack evidence.

## Independent Task

Create a one-page access decision for this requirement:

> Display one order header and all its lines, including each product name and current quantity on hand.

Choose native, SQL, or mixed access. Document the relationships, expected row/cardinality shape, error conditions, and tests.

## Completion Criteria

The learner can defend an access choice in business and operational terms rather than using “modern,” “legacy,” or “faster” as unsupported conclusions.