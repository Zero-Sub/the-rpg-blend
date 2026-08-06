-- RPGBA-101 Module 0 original training table.
-- Run only in the assigned training schema/library.

create table RPGBA101.COFFEE_LOG (
    LOG_ID integer generated always as identity primary key,
    LEARNER_NAME varchar(40) not null,
    COURSE_KEYWORD varchar(30) not null,
    CREATED_AT timestamp not null default current timestamp
);

insert into RPGBA101.COFFEE_LOG (LEARNER_NAME, COURSE_KEYWORD)
values ('RPG Blend learner', 'safe workflow');
