-- The RPG Blend Academy
-- Module 3: Files + Data Access
-- Purpose: add order tables with explicit SQL and IBM i system names
-- Validation status: reviewed; IBM i 7.5 execution pending
-- Replace YOURSCHEMA with the assigned learner library before execution.

create table YOURSCHEMA.ORDER_HEADER for system name ORDHDR (
    ORDER_ID       for column ORDID    integer        not null,
    ORDER_DATE     for column ORDDATE  date           not null default current_date,
    CUSTOMER_NAME  for column CUSTNAME varchar(60)    not null,
    STATUS                             char(10)       not null default 'NEW',
    TOTAL_AMOUNT   for column TOTALAMT decimal(11, 2) not null default 0,
    CREATED_TS     for column CRTDTS   timestamp      not null default current_timestamp,
    constraint PK_ORDER_HEADER primary key (ORDER_ID),
    constraint CK_ORDER_STATUS check (STATUS in ('NEW', 'READY', 'COMPLETE', 'CANCELLED')),
    constraint CK_ORDER_TOTAL check (TOTAL_AMOUNT >= 0)
)
rcdfmt OHDRR;

-- ORDER_LINES is intentionally longer than 10 characters so an explicit
-- distinct IBM i system object name can be assigned with FOR SYSTEM NAME.
create table YOURSCHEMA.ORDER_LINES for system name ORDLINE (
    ORDER_ID     for column ORDID     integer        not null,
    LINE_NO      for column LINENO    integer        not null,
    PRODUCT_ID   for column PRODID    integer        not null,
    QUANTITY     for column QTY       integer        not null,
    UNIT_PRICE   for column UNITPRICE decimal(9, 2)  not null,
    LINE_AMOUNT  for column LINEAMT   decimal(11, 2) not null,
    constraint PK_ORDER_LINES primary key (ORDER_ID, LINE_NO),
    constraint FK_LINES_HEADER foreign key (ORDER_ID)
        references YOURSCHEMA.ORDER_HEADER (ORDER_ID),
    constraint FK_LINES_PRODUCT foreign key (PRODUCT_ID)
        references YOURSCHEMA.PRODUCT (PRODUCT_ID),
    constraint CK_LINES_QTY check (QUANTITY > 0),
    constraint CK_LINES_PRICE check (UNIT_PRICE >= 0),
    constraint CK_LINES_AMOUNT check (LINE_AMOUNT >= 0)
)
rcdfmt OLINER;

select TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
from QSYS2.SYSTABLES
where TABLE_SCHEMA = 'YOURSCHEMA'
  and TABLE_NAME in ('ORDER_HEADER', 'ORDER_LINES')
order by TABLE_NAME;

-- Runtime validation must additionally prove system object names, record
-- format names, keys, constraints, and system column names.