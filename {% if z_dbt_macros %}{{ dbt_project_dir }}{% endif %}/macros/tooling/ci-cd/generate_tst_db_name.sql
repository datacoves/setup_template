{#
    This macro uses variables in dbt_project.yml to generate the database name for a given environment

    dbt run-operation generate_macro_db_name --args '{environment: 'prod'}'
#}

{% macro generate_macro_db_name(environment = 'dev') %}

    {% set env_name_prefix = var("environment_name_db_prefix") %}
    {% set db_base_name = var("base_database_name") %}

    {% if(env_name_prefix) %}
        {% set db_name = environment + '_' + db_base_name %}
    {% else %}
        {% set db_name = db_base_name + '_' + environment %}
    {% endif %}

    {{ return(db_name) }}

{% endmacro %}
