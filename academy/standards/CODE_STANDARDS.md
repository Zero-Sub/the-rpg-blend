# Academy Code Standards

## Default Direction

- Use fully free-form RPG for new code.
- Use embedded SQL when it improves clarity, set-based processing, portability, or maintainability.
- Teach native record-level access because students will encounter it in production.
- Present RPG III and fixed-format RPG primarily for recognition, maintenance, and modernization exercises.
- Use meaningful names and small procedures.
- Keep examples connected to the Academy sample application.

## RPG Standards

- Begin modern source with `**free`.
- Use `ctl-opt` explicitly when compile behavior matters.
- Prefer `dcl-s`, `dcl-c`, `dcl-ds`, `dcl-pr`, `dcl-pi`, and `dcl-proc`.
- Prefer procedures over subroutines.
- Avoid numeric indicators when named indicators or boolean variables provide clearer intent.
- Qualify data structures when duplicate field names could create ambiguity.
- Handle expected errors explicitly.
- Document the minimum supported IBM i release and required technology refresh when syntax depends on it.

## SQL Standards

- Prefer explicit column lists; avoid `SELECT *` in production examples.
- Use parameter markers or host variables instead of concatenating user input.
- Check SQLSTATE, SQLCODE, or diagnostics after statements where failure changes program behavior.
- Explain commitment control and isolation when updates span multiple statements.
- Use constraints to protect data integrity when appropriate.
- Include labels and comments in DDL examples when they improve discoverability.
- Show both SQL naming and system naming implications when relevant.

## Database Standards

- Provide DDS examples for legacy understanding.
- Provide SQL DDL equivalents when appropriate.
- Use primary keys, foreign keys, check constraints, and indexes deliberately.
- Separate physical storage decisions from application contracts.
- Avoid teaching direct table coupling as the only integration model.

## Example Quality Bar

Every published example must:

- Compile or run on the documented release level
- Use consistent naming and formatting
- Include setup and execution instructions
- Include expected output
- Include at least one failure or edge-case discussion
- Avoid production credentials, proprietary business logic, PHI, PII, or employer-specific source code

## Source Licensing

IBM manuals, Redbooks, COMMON materials, and other references may be used for research and verification. Do not copy diagrams, slides, exercises, or substantial text unless the license explicitly permits redistribution. Academy code and explanations should be original.
