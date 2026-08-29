-- The RPG Blend Academy
-- Module 2: Db2 for i + SQL
-- Purpose: create the Coffee Catalog training tables
-- Validation status: reviewed; PUB400 IBM i 7.5 execution pending
-- IMPORTANT: replace YOURSCHEMA with your assigned private learner library.

create table YOURSCHEMA.CATEGORY (
    CATEGORY_ID    integer      not null,
    CATEGORY_NAME  varchar(40)  not null,
    ACTIVE          char(1)      not null default 'Y',
    constraint PK_CATEGORY primary key (CATEGORY_ID),
    constraint UQ_CATEGORY_NAME unique (CATEGORY_NAME),
    constraint CK_CATEGORY_ACTIVE check (ACTIVE in ('Y', 'N'))
);

create table YOURSCHEMA.PRODUCT (
    PRODUCT_ID     integer       not null,
    CATEGORY_ID    integer       not null,
    SKU            varchar(20)   not null,
    PRODUCT_NAME   varchar(80)   not null,
    ROAST_LEVEL    varchar(12),
    PRICE          decimal(9, 2) not null,
    ACTIVE         char(1)       not null default 'Y',
    INTRO_DATE     date          not null default current_date,
    constraint PK_PRODUCT primary key (PRODUCT_ID),
    constraint UQ_PRODUCT_SKU unique (SKU),
    constraint FK_PRODUCT_CATEGORY foreign key (CATEGORY_ID)
        references YOURSCHEMA.CATEGORY (CATEGORY_ID),
    constraint CK_PRODUCT_PRICE check (PRICE >= 0),
    constraint CK_PRODUCT_ACTIVE check (ACTIVE in ('Y', 'N'))
);

create table YOURSCHEMA.INVENTORY (
    PRODUCT_ID      integer       not null,
    QTY_ON_HAND     integer       not null default 0,
    REORDER_POINT   integer       not null default 0,
    LAST_COUNT_TS   timestamp     not null default current_timestamp,
    constraint PK_INVENTORY primary key (PRODUCT_ID),
    constraint FK_INVENTORY_PRODUCT foreign key (PRODUCT_ID)
        references YOURSCHEMA.PRODUCT (PRODUCT_ID),
    constraint CK_INVENTORY_QTY check (QTY_ON_HAND >= 0),
    constraint CK_REORDER_POINT check (REORDER_POINT >= 0)
);

-- Evidence checks
select TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
from QSYS2.SYSTABLES
where TABLE_SCHEMA = 'YOURSCHEMA'
  and TABLE_NAME in ('CATEGORY', 'PRODUCT', 'INVENTORY')
order by TABLE_NAME;
