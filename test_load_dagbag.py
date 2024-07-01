from airflow.models import DagBag

dagbag = DagBag(dag_folder="generated/orchestrate/dags")

if dagbag.import_errors:
    print("The following DAGs present import errors:")
    for error in dagbag.import_errors:
        print(error)
    print("Review the stack above for details")


assert len(dagbag.import_errors) == 0
