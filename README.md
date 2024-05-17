# Datacoves Starter Project

Welcome to the Datacoves Starter Project! This repository is designed to help users kickstart their journey with dbt (data build tool) and Airflow on Datacoves. Whether you're new to data modeling or an experienced data engineer, this repo will assist you in setting up dbt for your Datacoves environment and tailoring it to your specific data needs.

## About Datacoves

Datacoves is an [enterprise dbt DataOps platform](https://datacoves.com/product) which helps organizations overcome their data delivery challenges quickly using dbt and Airflow, implementing best practices from the start without the need for multiple vendors or costly consultants.  

## Getting Started

To make us of this repo on your dbt journey with Datacoves, follow these steps:

1. **Clone This Repository**:
   - Clone this repository to your local machine using the command:
     ```
     git clone https://github.com/yourusername/Datacoves-starter-project.git
     ```

2.  **Configure your CICD**:
   - Edit your gitlab-ci,yml or .github/workflows files based on your Data Warehouse and dbt project location. This will involve commenting and uncommenting lines of code in the files.
   - Configure your workflow environment variables in Gitlab or Github. See .gitlab-ci,yml or .github/workflows.
     
3. **Configure dbt**:
   - Configure dbt for your Datacoves environment by editing the `profiles.yml` file in the `automate/dbt/` directory. Ensure you provide accurate connection details for your Data Warehouse.
   - Configure your dbt_project.yml with your information.

4. **Customize Your Project**:
   - Define your data models in the `models` directory using SQL files. Organize your models according to your data warehouse schema and naming conventions.

5. **Run dbt (once your repo is cloned into Datacoves)**:
   - Execute your dbt transformations using the `dbt debug` command within the repository directory. 
   - Execute your dbt transformations using the `dbt run` command within the repository directory. This will compile your SQL models and execute them against your Datacoves warehouse.

6. **Explore and Iterate**:
   - Explore the results of your data transformations in Datacoves.
   - Iterate on your data models as needed, making adjustments and improvements based on insights gained.

## Resources

- [Datacoves Documentation](https://docs.Datacoves.com)
- [dbt Documentation](https://docs.getdbt.com)

Happy modeling! 🚀
