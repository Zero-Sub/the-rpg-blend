# Module 3 Slide Source — Files + Data Access

**Status:** presentation source; generate branded deck only after technical validation

## Slides 1–5 — Opening

1. Module 3 — Files + Data Access
2. Roadmap: Module 2 database → Module 3 application access → Module 4 Procedures + ILE
3. Module promise: native I/O + embedded SQL + transactions + errors
4. Safety boundary: learner objects only; transaction preflight required
5. Access evidence loop: Target → Predict → Access → Condition → Verify → Explain

## Slides 6–10 — Lesson 3.1

6. Two paths to Db2 for i
7. Record-oriented vs set-oriented mental model
8. Coffee Catalog → Order Access increment
9. SQL name / system name / record format bridge
10. Requirement before interface

## Slides 11–16 — Lesson 3.2

11. DCL-F anatomy
12. USAGE + KEYED
13. EXTDESC = compile-time external description
14. EXTFILE = runtime resolution
15. Compile success does not prove runtime target
16. VS Code compile evidence chain

## Slides 17–23 — Lesson 3.3

17. CHAIN = keyed retrieval attempt
18. %FOUND(file)
19. SETLL = position
20. READE = next equal-key record
21. %EOF(file) and loop termination
22. Partial key on ORDER_LINE
23. Predict line count before run

## Slides 24–29 — Lesson 3.4

24. Native changes raise risk
25. Disposable WRITE
26. Read-for-update → UPDATE → verify
27. DELETE only after dependency proof
28. Record-lock awareness
29. Lock response: observe, identify, do not attack

## Slides 30–35 — Lesson 3.5

30. SQLRPGLE source/build path
31. Host variables use colon in SQL
32. SELECT INTO
33. Primary key gives one-or-none reasoning
34. No data is an application condition
35. Map SQL columns to RPG variables

## Slides 36–42 — Lesson 3.6

36. Why a cursor
37. DECLARE
38. OPEN
39. first FETCH
40. process only after successful FETCH
41. +100/no data vs error
42. CLOSE and lifecycle

## Slides 43–48 — Lesson 3.7

43. SQLSTATE + SQLCODE
44. success / no data / warning / error
45. preserve the first meaningful condition
46. GET DIAGNOSTICS
47. ROW_COUNT after DML
48. Bob explains; Db2 evidence decides

## Slides 49–55 — Lesson 3.8

49. Transaction = business unit
50. Header + lines: all or none
51. Journaling/commitment prerequisites
52. COMMIT boundary
53. ROLLBACK path
54. Commitment-control locks are different
55. Preflight failure means STOP, not authority escalation

## Slides 56–60 — Lesson 3.9

56. Native candidate patterns
57. SQL candidate patterns
58. Mixed access needs transaction/lock awareness
59. No unsupported performance folklore
60. Engineering decision template

## Slides 61–67 — Capstone

61. Capstone scenario
62. Required native evidence
63. Required SQL evidence
64. Diagnostic evidence
65. Transaction/alternate path
66. Independent defense
67. Pass/safety gate

## Slide 68 — Next

Module 4 — Procedures + ILE: prototypes, interfaces, modules, service programs, binding.

## Slide 69 — Final Sip

Professional data access means knowing what you touched, how you touched it, what condition occurred, and what evidence proves the result.

## Production Notes

- Use original Academy diagrams.
- Capture current VS Code/Code for IBM i screenshots only after tooling validation.
- Split code across slides rather than shrinking it.
- Do not show real credentials, public-user private data, client data, or PHI.
- Transaction screenshots must come from an approved non-production environment and identify the safety context.