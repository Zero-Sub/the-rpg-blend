# Module 3 Validation Runbook

**Status:** Development validation plan. Do not label Module 3 Release Candidate until the designated IBM i environment has completed these gates.

## 1. Preflight

Record, but do not expose secrets:

- Git branch and commit/revision.
- IBM i connection nickname/host alias.
- User profile.
- Current/build library.
- Remote IFS source directory.
- Code for IBM i version.
- IBM i release and relevant compiler/PTF level.

Verify that the source being compiled is the same source revision under review.

## 2. Source package

Expected development files:

```text
src/coffee-company/order_domain_contracts.rpgleinc
src/coffee-company/order_domain.rpgle
src/coffee-company/order_domain.bnd
src/coffee-company/order_domain_demo.rpgle
tests/order_domain_cases.md
```

The contract include is intentionally shared by the service implementation and caller.

## 3. Compile the domain module

Use an approved Code for IBM i Action that resolves to the equivalent of:

```cl
CRTRPGMOD MODULE(<BUILDLIB>/ORDERDOM)
           SRCSTMF('<REMOTE-DIR>/order_domain.rpgle')
           INCDIR('<REMOTE-DIR>')
           OPTION(*EVENTF *SRCSTMT)
           DBGVIEW(*SOURCE)
           REPLACE(*YES)
```

Before running, verify `<BUILDLIB>` and `<REMOTE-DIR>`.

Evidence gate:

- action/command output captured;
- no unresolved compile errors;
- expected `ORDERDOM *MODULE` exists in the learner build library;
- diagnostics refer to the intended source.

## 4. Create the service program

Use the development binder source stream file:

```cl
CRTSRVPGM SRVPGM(<BUILDLIB>/ORDERDOM)
           MODULE(<BUILDLIB>/ORDERDOM)
           EXPORT(*SRCFILE)
           SRCSTMF('<REMOTE-DIR>/order_domain.bnd')
           ACTGRP(*CALLER)
           REPLACE(*YES)
```

Evidence gate:

- expected `ORDERDOM *SRVPGM` exists;
- service-program public interface contains only the intended export(s);
- signature/export information is captured;
- no unrelated helper procedure is exposed.

## 5. Binding directory

For the controlled learner environment, create the application binding directory once if it does not already exist:

```cl
CRTBNDDIR BNDDIR(<BUILDLIB>/RPGBAAPP)
```

Add the service program when the entry is not already present:

```cl
ADDBNDDIRE BNDDIR(<BUILDLIB>/RPGBAAPP)
            OBJ((<BUILDLIB>/ORDERDOM *SRVPGM))
```

Do not repeatedly add duplicate entries. Verify the exact library and object that callers will resolve.

## 6. Compile the demo caller

Use an approved Code for IBM i Action equivalent to:

```cl
CRTBNDRPG PGM(<BUILDLIB>/ORDDEMO)
           SRCSTMF('<REMOTE-DIR>/order_domain_demo.rpgle')
           INCDIR('<REMOTE-DIR>')
           DFTACTGRP(*NO)
           ACTGRP(*CALLER)
           BNDDIR(<BUILDLIB>/RPGBAAPP)
           OPTION(*EVENTF *SRCSTMT)
           DBGVIEW(*SOURCE)
           REPLACE(*YES)
```

Evidence gate:

- `ORDDEMO *PGM` created in the intended library;
- binding resolved to the intended `ORDERDOM *SRVPGM`;
- caller source contains no copied implementation of the private discount helper.

## 7. Runtime smoke test

Run the demo in the approved non-production learner context.

Expected development baseline for the supplied demo data:

- quantity: 2
- unit price: 275.00
- subtotal: 550.00
- discount: 27.50
- final total: 522.50
- result code: `OK`

Record actual output and any job-log evidence needed to explain discrepancies.

## 8. Required behavior matrix

Execute every case in `tests/order_domain_cases.md`.

Required categories:

- normal;
- zero/negative quantity;
- inactive product;
- insufficient quantity;
- product mismatch;
- exact discount thresholds;
- precision/rounding case;
- regression of the Module 1 discount rules.

A build that compiles but fails one required behavior case does not pass validation.

## 9. Compatibility experiment

On a disposable branch only:

1. Record the current binder signature/export surface.
2. Make one deliberate public-interface change.
3. Predict which existing caller behavior/build should be affected.
4. Rebuild only the service program first and observe evidence.
5. Rebuild/rebind the caller when the exercise calls for it.
6. Restore the supported interface.
7. Confirm the baseline caller works again.

Do not merge the intentionally incompatible experiment.

## 10. Hidden-state review

Review source and object behavior for:

- static local/global state;
- activation-group assumptions;
- data areas;
- library-list dependencies;
- current-library assumptions;
- job-scoped values;
- shared/open data paths;
- cached values;
- adopted authority or elevated profiles;
- environment variables or IFS paths not represented in the build evidence.

Any intentional dependency must be documented and tested. Unintentional dependencies are defects.

## 11. Bob-assisted review

Only after the learner’s first analysis/implementation where specified:

- ask Bob to identify missed dependencies, contract leakage, hidden state, and missing tests;
- use the smallest relevant source context;
- do not include credentials, PHI, production/client data, or unrestricted logs;
- disposition each material finding as Accept, Reject, Investigate, or Defer;
- attach evidence for accepted/corrected findings.

Bob output is review input, not release evidence by itself.

## 12. Release-candidate gates

All must pass:

- [ ] All source compiles on the designated IBM i training environment.
- [ ] Relative `/INCLUDE` resolution is verified for the deployed IFS source layout.
- [ ] `ORDERDOM *MODULE` target is correct.
- [ ] `ORDERDOM *SRVPGM` target is correct.
- [ ] Binder stream-file build is verified.
- [ ] Export surface and signature are recorded.
- [ ] Demo caller binds to the intended service program.
- [ ] Full behavior matrix passes.
- [ ] Compatibility lab behaves as documented.
- [ ] No SQL/display/transport implementation details leak into the domain contract.
- [ ] No correctness dependency on undocumented activation-group or job state.
- [ ] Git diff is focused and clean.
- [ ] Bob activities match current supported product behavior.
- [ ] Instructor technical review complete.
- [ ] Independent learner pilot complete.
- [ ] All Critical/High defects closed.

## 13. Findings log

For every issue found, capture:

- ID;
- severity;
- source/object/lesson affected;
- expected behavior;
- actual behavior;
- evidence;
- correction;
- re-test result;
- whether canonical curriculum/source-register material needs an update.
