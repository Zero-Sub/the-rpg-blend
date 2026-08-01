# The RPG Blend Academy Source Validation Standard

## Purpose

This standard defines how Academy content is researched, verified, cited, maintained, and updated. The goal is to preserve technical accuracy without copying copyrighted source material or treating old documentation as current by default.

## Source Authority Order

1. Current IBM product documentation for release-sensitive behavior
2. IBM manuals for the documented release
3. IBM Redbooks for architecture, modernization strategy, and practical guidance
4. COMMON and other reputable training material for instructional sequencing and examples
5. Academy experience, production judgment, and original examples

Lower-ranked sources may clarify or teach a topic, but they do not override a newer applicable IBM authority.

## Source Categories

### Authoritative

Official IBM documentation, language references, programming guides, SQL references, command documentation, and published product requirements.

### Strategic

IBM Redbooks and architecture guidance that synthesize recommended practices and modernization approaches.

### Supplemental

COMMON presentations, conference sessions, articles, books, and training material used for examples, sequencing, historical context, or alternate explanations.

### Experiential

Original Academy guidance based on production support, code review, modernization, onboarding, and engineering leadership experience. Experiential guidance must be labeled as practice or judgment rather than IBM product fact.

## Required Source Record

Every lesson must record:

- Source title
- Publisher or owner
- Document number when available
- Release, edition, or publication date
- Chapter, section, page, or topic
- Source category
- Date accessed or verified
- What claim or example the source supports
- Release sensitivity
- Reviewer initials or name

## Release-Sensitive Content

The following always require current verification:

- Supported IBM i releases
- Technology Refresh dependencies
- RPG syntax availability
- SQL services and built-in functions
- Product installation requirements
- VS Code, Code for IBM i, Merlin, RDi, Git, Bob, and DevOps tooling
- Compiler options and command defaults
- Security recommendations
- Licensing and pricing
- API behavior
- Operating-system and database limits

Older manuals may support stable concepts, but they must not be used as the sole authority for these subjects.

## Uploaded Legacy Manuals

IBM i 7.1 and earlier manuals in the Academy library remain valuable for stable RPG, ILE, SQL, and diagnostic concepts. When used:

- Record the documented release
- Check whether the behavior remains current
- Avoid implying that old tooling or syntax limits still define the platform
- Link to current IBM documentation in publication-ready material when possible

## Work-in-Progress Publications

The IBM Redbooks publication *Modernizing IBM i Applications* must retain the designation “work in progress” until IBM publishes a final edition. Claims based on a draft must be rechecked after final publication.

## Copyright and Originality

- Do not copy full chapters, tables, diagrams, or extensive passages
- Use original explanations and examples
- Quote only when necessary and keep quotations brief
- Attribute ideas and technical facts appropriately
- Do not commit source PDFs unless redistribution rights are clear
- Recreate diagrams in the Academy’s own visual system rather than copying protected artwork

## Validation Procedure

For each lesson:

1. Identify the technical claims and release-sensitive instructions.
2. Locate the highest-authority applicable sources.
3. Record exact topics or sections.
4. Compare older and current guidance when the lesson includes legacy behavior.
5. Validate code under `CODE_STANDARD.md`.
6. Mark unsupported points as experiential guidance or remove them.
7. Complete a source review before pilot delivery.
8. Revalidate after material platform or tooling changes.

## Conflict Resolution

When sources disagree:

1. Confirm that they address the same release and context.
2. Prefer the newest applicable official IBM source.
3. Preserve older behavior when teaching legacy maintenance, but label it.
4. Document the conflict in instructor notes.
5. Do not silently merge conflicting guidance into a new unsupported rule.

## Source Register Template

| Claim or Topic | Source | Release / Edition | Section | Category | Verified | Notes |
|---|---|---|---|---|---|---|
|  |  |  |  |  |  |  |

## Review Cadence

- Tooling and AI lessons: review at least quarterly
- Current platform and SQL-service lessons: review at least every six months
- Stable RPG and ILE concepts: review annually
- All lessons: review when IBM announces a relevant release, Technology Refresh, deprecation, or product change

## Publication Status

Every lesson carries one status:

- Draft — research incomplete
- Source reviewed — claims mapped to sources
- Technically validated — examples verified
- Approved — all review gates complete
- Revalidation required — a source or platform change may affect accuracy

## Definition of Done

Source validation is complete when every material technical claim is either supported by an identified source, explicitly labeled as experiential guidance, or removed; release-sensitive content has been checked against current IBM documentation; and the source register has a verification date and reviewer.
