/* Instructor/administrator template only. Replace <YOURLIB> with the learner's assigned library. */
/* Do not run this against a shared or production library without explicit approval. */

CRTLIB LIB(<YOURLIB>) TEXT('RPG Blend Academy learner')

CRTSRCPF FILE(<YOURLIB>/QRPGLESRC) RCDLEN(112) TEXT('RPG source members')

ADDPFM FILE(<YOURLIB>/QRPGLESRC) MBR(COFFEE00) SRCTYPE(RPGLE) TEXT('Coffee Company Module 0')
