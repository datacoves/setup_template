#!/bin/bash

# Cause script to exit on error
set -e

cd $DATACOVES__DBT_HOME

mkdir -p logs

{% raw %}dbt run-operation get_last_artifacts --args "{stage: {% endraw %}{{ dbt_artifacts_stage }}{% raw %}}"{% endraw %}

# Check if the manifest.json file exists
if [[ -f logs/manifest.json ]]; then
    LINES_IN_MANIFEST="$(grep -c '^' logs/manifest.json)"
else
    echo "manifest.json not found in Snowflake stage."
    LINES_IN_MANIFEST=0
fi

# Check if the catalog.json file exists
if [[ -f logs/catalog.json ]]; then
    LINES_IN_CATALOG="$(grep -c '^' logs/catalog.json)"
else
    echo "catalog.json not found in Snowflake stage."
    LINES_IN_CATALOG=0
fi

if [ $LINES_IN_MANIFEST -eq 0 ]; then
    # This is used by GitHub Actions
    echo "::set-output name=manifest_found::false"
else
    echo "Updated manifest.json from production"
    # This is used by GitHub Actions
    echo "::set-output name=manifest_found::true"
fi

if [ $LINES_IN_CATALOG -eq 0 ]; then
    # This is used by GitHub Actions
    echo "::set-output name=catalog_found::false"
else
    echo "Updated catalog.json from production"
    # This is used by GitHub Actions
    echo "::set-output name=catalog_found::true"
fi
