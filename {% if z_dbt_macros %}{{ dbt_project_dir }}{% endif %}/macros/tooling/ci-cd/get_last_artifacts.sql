{# Macro for returning dbt manifest from a snowflake stage. #}
{#
    dbt run-operation get_last_artifacts --args "{stage: PRD_DBT_GENERATED.DBT_ARTIFACTS.ARTIFACTS}"
#}
{# Once this is completed, deferral and state modifiers are available using --state logs #}

{% macro get_last_artifacts(stage = 'PRD_RAW.DBT_ARTIFACTS.ARTIFACTS') %}
    {# we will put the manifest.json in the log directory and use the with the --state param in dbt #}
    {% set logs_dir = env_var('DATACOVES__DBT_HOME') ~ "/logs/" %}

    {# List only the .json files in the root folder (excludes archive dir) #}
    {% set list_stage_query %}
        LIST @{{ stage }} PATTERN = '^((?!(archive/)).)*.json$';
    {% endset %}

    {{ print("\nCurrent items in stage " ~ stage) }}
    {% set results = run_query(list_stage_query) %}

    {# Check if any rows were returned #}
    {% if results.rows %}
        {{ results.exclude('md5').print_table(max_column_width=40) }}
        {{ print("\n" ~ "="*85) }}

        {% set file_names = results.columns['name'].values()|map('lower')|list %}

        {% set artifacts_destination =  "file://" + logs_dir %}

        {% if 'artifacts/manifest.json' not in file_names %}
            {{ print("manifest.json not found in the stage") }}
        {% else %}
            {% set get_query %}
                get @{{ stage }}/manifest.json {{ artifacts_destination }};
            {% endset %}

            {% set results = run_query(get_query) %}
            {{ print("Downloaded manifest.json to " + logs_dir) }}
        {% endif %}


        {% if 'artifacts/catalog.json' not in file_names %}
            {{ print("catalog.json not found in the stage") }}
        {% else %}
            {% set get_query %}
                get @{{ stage }}/catalog.json {{ artifacts_destination }};
            {% endset %}

            {% set results = run_query(get_query) %}
            {{ print("Downloaded catalog.json to " + logs_dir) }}
        {% endif %}
    {% else %}
        {{ print("manifest.json nor catalog.json files found in the stage.") }}
    {% endif %}

{% endmacro %}
