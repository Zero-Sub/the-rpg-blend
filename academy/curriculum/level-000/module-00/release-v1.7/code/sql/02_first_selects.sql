-- First read-only SQL exploration.
-- Verify schema/library before running.

select LOG_ID, LEARNER_NAME, COURSE_KEYWORD, CREATED_AT
from RPGBA101.COFFEE_LOG
order by LOG_ID;

select count(*) as ROW_COUNT
from RPGBA101.COFFEE_LOG;
