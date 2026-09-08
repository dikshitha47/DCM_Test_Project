-- ### jinja macro to create standard set of roles for each database
{% macro create_team_roles(env_suffix) %}
    
    define role {{env_suffix}}_ROLE;

    grant USAGE     on database {{env_suffix}}        to role {{env_suffix}}_ROLE;
    grant USAGE     on schema {{env_suffix}}.{{team}} to role {{env_suffix}}_ROLE;

    grant CREATE DYNAMIC TABLE, CREATE TABLE, CREATE VIEW on schema {{env_suffix}}.{{team}} to role {{env_suffix}}_ROLE;
    
    -- grant role {{env_suffix}}_ROLE     to role {{team}}_DEVELOPER{{env_suffix}};
    grant role {{env_suffix}}_ROLE     to role {{project_owner_role}};
    -- ensure the project owner role retains all granted roles to avoid lock-out
    
{% endmacro %}
