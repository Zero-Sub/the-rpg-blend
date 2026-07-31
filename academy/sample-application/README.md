# Academy Sample Application

## Working Name

**BlendWorks Order Management**

The curriculum uses one fictional business application so every lesson adds context instead of introducing isolated examples.

## Business Capabilities

```text
Customer Master
      ↓
Order Entry → Order Lines
      ↓
Inventory Allocation
      ↓
Billing and Payment
      ↓
Operational Reporting
```

## Initial Domain Objects

| Object | Purpose |
|---|---|
| Customer | Stores customer identity, status, and contact information |
| Product | Stores product descriptions, pricing, and inventory attributes |
| Order Header | Stores customer, order date, status, and totals |
| Order Line | Stores products, quantities, prices, and fulfillment status |
| Invoice | Stores billing information created from completed orders |
| Payment | Stores payment activity applied to invoices |

## Curriculum Evolution

### Level 000

Students learn the vocabulary and see the application architecture.

### Level 100

Students create tables/files, read and update customers and products, build small batch and interactive programs, and complete a supervised feature.

### Level 200

Students modularize business logic, create service programs, introduce SQL views and procedures, add APIs, and improve testing.

### Level 300

Students modernize legacy components, separate contracts from storage, automate delivery, add observability, and expose selected capabilities through services.

### Level 400

Students review architecture, define standards, plan modernization, manage risk, and mentor teams using the application as a case study.

## Implementation Rules

- Keep all data fictional.
- Provide DDS and SQL DDL where the lesson requires comparison.
- Keep legacy and modern implementations in separate clearly named folders.
- Include setup scripts and expected results.
- Do not include employer-specific code, data, naming, or proprietary workflows.
