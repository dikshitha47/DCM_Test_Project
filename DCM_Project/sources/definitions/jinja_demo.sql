define database {{env_suffix}};
define role {{env_suffix}}_ROLE;
grant USAGE on database {{env_suffix}} to role {{env_suffix}}_ROLE;
grant role {{env_suffix}}_ROLE to role {{project_owner_role}}; -- ensure the project owner role retains all granted roles to avoid lock-out

{% for team in teams %}
    {% set team_name = team.name | upper %}

    define schema {{env_suffix}}.{{team_name}}
        comment = 'using JINJA dictionary values'
        data_retention_time_in_days = {{ team.data_retention_days }};

    grant USAGE on schema {{env_suffix}}.{{team_name}} to role {{env_suffix}}_ROLE;
    grant CREATE DYNAMIC TABLE, CREATE TABLE, CREATE VIEW on schema {{env_suffix}}.{{team_name}} to role {{env_suffix}}_ROLE;
    
    define table {{env_suffix}}.{{team_name}}.CUSTOMER(
        ID varchar,
        NAME varchar,
        -- EMAIL_ID varchar,
        PHONE_NUMBER NUMBER(38,0),
        email_id VARChar
    );

    define table {{env_suffix}}.{{team_name}}.ORDERS(
        ID varchar,
        NAME varchar,
        PRODUCT varchar
    );

{% endfor %}
