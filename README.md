# ELT Pipeline with Snowflake, DBT, and Airflow

The point of this project is to create an ELT pipeline (Extract, Transform, Load)
with Snowflake for RBAC and data warehousing, DBT for data transformation,
and Airflow for deployment and orchestration.

## The Dataset

This project will be using the TPC-H dataset provided by Snowflake's free datasets.

## Setup

In Snowflake, we'll need a role, a database, and a warehouse, with the role
having access to all of your databases in the data warehouse.

In order to repeat this process, you basically just have to run the setup script
with your actual account name in Snowflake. Then you run `dbt init` in your
terminal and connect to your Snowflake account (you need the locator URL not id).
For the project, I ended up using 10 threads, although I don't think it should
matter.
