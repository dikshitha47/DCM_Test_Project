define database DEV;
define role DEV_ROLE;
grant USAGE on database DEV to role DEV_ROLE;
grant role DEV_ROLE to role ACCOUNTADMIN; -- ensure the project owner role retains all granted roles to avoid lock-out


    

    define schema DEV.BRONZE
        comment = 'using JINJA dictionary values'
        data_retention_time_in_days = 1;

    grant USAGE on schema DEV.BRONZE to role DEV_ROLE;
    grant CREATE DYNAMIC TABLE, CREATE TABLE, CREATE VIEW on schema DEV.BRONZE to role DEV_ROLE;
    
    define table DEV.BRONZE.CUSTOMER(
        ID varchar,
        NAME varchar,
        -- EMAIL_ID varchar,
        PHONE_NUMBER NUMBER(38,0),
        email_id VARChar
    );

    define table DEV.BRONZE.ORDERS(
        ID varchar,
        NAME varchar,
        PRODUCT varchar
    );


    

    define schema DEV.SILVER
        comment = 'using JINJA dictionary values'
        data_retention_time_in_days = 1;

    grant USAGE on schema DEV.SILVER to role DEV_ROLE;
    grant CREATE DYNAMIC TABLE, CREATE TABLE, CREATE VIEW on schema DEV.SILVER to role DEV_ROLE;
    
    define table DEV.SILVER.CUSTOMER(
        ID varchar,
        NAME varchar,
        -- EMAIL_ID varchar,
        PHONE_NUMBER NUMBER(38,0),
        email_id VARChar
    );

    define table DEV.SILVER.ORDERS(
        ID varchar,
        NAME varchar,
        PRODUCT varchar
    );


    

    define schema DEV.GOLD
        comment = 'using JINJA dictionary values'
        data_retention_time_in_days = 1;

    grant USAGE on schema DEV.GOLD to role DEV_ROLE;
    grant CREATE DYNAMIC TABLE, CREATE TABLE, CREATE VIEW on schema DEV.GOLD to role DEV_ROLE;
    
    define table DEV.GOLD.CUSTOMER(
        ID varchar,
        NAME varchar,
        -- EMAIL_ID varchar,
        PHONE_NUMBER NUMBER(38,0),
        email_id VARChar
    );

    define table DEV.GOLD.ORDERS(
        ID varchar,
        NAME varchar,
        PRODUCT varchar
    );

