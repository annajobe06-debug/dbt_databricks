# dbt Databricks Project

A data transformation project built with dbt Core and Databricks, using SQL to organize sales-related data into Bronze, Silver and Gold models.

## Project structure

- **Bronze:** Customer, product, store, date, sales and returns models.
- **Silver:** Models for sales and returns analysis.
- **Gold:** Item-level model selecting the latest record for each ID.
- **Tests:** Data quality checks using dbt tests and custom SQL.
- **Snapshots:** Track changes to item records over time.
- **Seeds:** Load reference data from a CSV file.
- **Macros:** Reusable SQL logic and custom schema naming.

## Tech stack

- SQL
- dbt Core
- dbt-databricks
- Databricks
- Python and uv
- Git and GitHub

## Run the project

```bash
uv sync
cd dbt_project
dbt debug
dbt build
```

A working Databricks connection and the required source data are needed to run the project.