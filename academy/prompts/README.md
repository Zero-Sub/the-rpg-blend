# IBM Bob Prompt and Example Library

This directory contains practical, reusable prompts and Markdown examples for IBM i development with IBM Bob.

The examples are designed for experienced IBM i developers who may be new to AI-assisted development. They emphasize small steps, visible evidence, developer verification, and safe use.

## Contents

- [Adoption and coaching prompts](adoption-and-coaching.md)
- [Database discovery and ERD prompts](database-discovery-and-erd.md)
- [Complete system mapping prompts](complete-system-mapping.md)
- [Extensions and MCP review prompts](extensions-and-mcp.md)

## How to use these prompts

1. Replace bracketed placeholders with project-specific details.
2. Keep the first run read-only.
3. Ask Bob to identify evidence, assumptions, and uncertainty.
4. Verify the output against source, object definitions, SQL catalogs, build results, and operational knowledge.
5. Save only prompts that repeatedly help the team.

## Safety rules

- Do not provide production credentials, secrets, PHI, or client data.
- Do not allow an agent to modify production or client systems.
- Begin with read-only analysis and narrow scope.
- Require human review before code, schema, configuration, or deployment changes.
- Treat diagrams as working hypotheses until validated.

## Mermaid support

The examples use fenced Markdown blocks with `mermaid`. They can be reviewed in GitHub and in Markdown tools that support Mermaid rendering.
