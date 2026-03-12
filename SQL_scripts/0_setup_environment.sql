ALTER ACCOUNT
SET
    CORTEX_ENABLED_CROSS_REGION = 'ANY_REGION';
-- create the database
    CREATE
    OR REPLACE DATABASE BRAZE_ENGAGEMENT;
-- create the schema
    CREATE SCHEMA BRAZE_ENGAGEMENT.EMAIL_DATA;
-- switch to database and schema that was created
    USE DATABASE BRAZE_ENGAGEMENT;
USE SCHEMA EMAIL_DATA;
-- create stage for raw data
    CREATE
    OR REPLACE STAGE EMAIL_STAGE DIRECTORY = (ENABLE = TRUE);