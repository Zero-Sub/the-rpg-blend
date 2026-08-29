# Complete System Mapping Prompts

A complete system map should connect business entry points, programs, services, data, integrations, operations, security, deployment, and recovery. It is a maintained engineering artifact, not a decorative diagram.

## Complete system discovery prompt

```text
Build an evidence-based system map for [application or business capability].

Include:
1. users, roles, and entry channels
2. menus, commands, jobs, APIs, files, messages, and scheduled triggers
3. RPG, CL, COBOL, SQL, Java, modules, procedures, and service programs
4. callers, callees, binding directories, copy members, and shared structures
5. Db2 tables, physical files, logical files, views, indexes, data areas, data queues, and IFS locations
6. external systems, interfaces, transports, file exchanges, and message flows
7. subsystems, job queues, output queues, scheduled jobs, restart points, and batch dependencies
8. authority boundaries, service profiles, secrets, and sensitive-data zones
9. Git repositories, source locations, build commands, compile objects, promotion steps, and deployment paths
10. monitoring, logging, alerting, support ownership, recovery, rollback, and known failure modes

For each node and relationship:
- cite the evidence
- classify it as confirmed, inferred, or unverified
- identify the owner when known
- identify the validation step when uncertain

Do not omit operational dependencies simply because they are outside the source repository.
```

## Layered system map

```mermaid
flowchart TB
    subgraph Users[Users and Channels]
        U1[Interactive user]
        U2[External partner]
        U3[Scheduler]
    end

    subgraph Entry[Entry Points]
        E1[5250 menu or command]
        E2[REST API]
        E3[Inbound file or message]
        E4[Scheduled job]
    end

    subgraph Application[Application Services]
        A1[RPG application program]
        A2[Service program]
        A3[CL orchestration]
        A4[SQL procedure]
    end

    subgraph Data[Data and State]
        D1[(Db2 tables and files)]
        D2[(Views and logical files)]
        D3[Data queue or data area]
        D4[IFS documents and exchange files]
    end

    subgraph External[External Systems]
        X1[Partner API]
        X2[Reporting or analytics]
        X3[Downstream application]
    end

    subgraph Delivery[Delivery and Operations]
        O1[Git repository]
        O2[Build and compile]
        O3[Promotion and deployment]
        O4[Monitoring and alerts]
        O5[Recovery and rollback]
    end

    U1 --> E1
    U2 --> E2
    U2 --> E3
    U3 --> E4
    E1 --> A1
    E2 --> A2
    E3 --> A3
    E4 --> A3
    A1 --> A2
    A3 --> A1
    A2 --> A4
    A1 --> D1
    A4 --> D1
    D2 --> D1
    A3 --> D3
    A2 --> D4
    A2 --> X1
    X2 --> D2
    D3 --> X3
    O1 --> O2
    O2 --> O3
    O3 --> Application
    Application --> O4
    O4 --> O5
```

## Program and service dependency map

```mermaid
flowchart LR
    MENU[Menu or command] --> CL[CL controller]
    CL --> RPG1[Primary RPG program]
    RPG1 --> SRV1[Business service program]
    RPG1 --> SRV2[Data access service program]
    SRV1 --> EXT[External interface]
    SRV2 --> DB[(Db2 for i)]
    RPG1 --> REPORT[Report or spool output]
```

## Batch flow example

```mermaid
sequenceDiagram
    participant SCH as Scheduler
    participant CL as CL Controller
    participant RPG as RPG Batch Program
    participant DB as Db2 for i
    participant DQ as Data Queue
    participant MON as Monitoring

    SCH->>CL: Start scheduled job
    CL->>RPG: Submit processing request
    RPG->>DB: Read eligible work
    RPG->>DB: Update transaction state
    RPG->>DQ: Publish downstream message
    RPG-->>CL: Return completion status
    CL->>MON: Record result and metrics
```

## Field and data-flow tracing prompt

```text
Trace the business value [field or concept] through the system.

Do not search only for the original field name.

Follow:
- assignments and moves
- differently named receiving fields
- data structures and copy members
- parameters and return values
- SQL aliases and expressions
- work files and staging tables
- child and history records
- exports, reports, messages, and APIs

Produce a Mermaid flowchart showing every confirmed transformation. List unresolved gaps and the evidence needed to close them.
```

## Operational mapping prompt

```text
Map how [application or batch process] runs in production-like operations without accessing production data.

Identify:
- initiating job or user
- subsystem and job queue
- job description and user profile
- libraries and library-list assumptions
- configuration data areas or files
- restart and recovery points
- output queues and logs
- monitoring and alert paths
- support owner and escalation path
- rollback or compensating action

Separate source-confirmed facts from environment-specific facts that require operator validation.
```

## System-map review questions

- What starts the flow?
- What can stop it?
- Where is state committed?
- What can be retried safely?
- Which relationships depend on naming conventions rather than enforced definitions?
- What runs outside the repository?
- Where are authority changes or trust boundaries crossed?
- Which downstream consumers are not visible from the immediate source?
- How is failure detected?
- Who owns recovery?
- How is the map kept current after a code or schema change?
