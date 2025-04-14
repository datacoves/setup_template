#! /bin/bash

# Cause script to exit on error
set -e

cd $DATACOVES__DBT_HOME

mkdir -p logs

dbt run-operation get_last_artifacts
LINES_IN_MANIFEST="$(grep -c '^' logs/manifest.json)"

if [ $LINES_IN_MANIFEST -eq 0 ]
then
    echo "Manifest not found in Snowflake stage, contact the Snowflake administrator to load a updated manifest to snowflake."
    # This is used by github actions
    echo "::set-output name=manifest_found::false"
else
    echo "Updated manifest from production"

    # This is used by github actions
    echo "::set-output name=manifest_found::true"
fi
