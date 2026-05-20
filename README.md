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

## Notes

Staging tables are supposed to be identical to the source tables. However,
we want to transform the models for whatever business transformation we want,
like creating fact tables.

### Fact Table

A fact table is a table that contains the results of some kind of
real-world measurement event. In other words, it stores quantitative data
regarding some sort of business activity and contains a bunch of foreign
keys to other tables, which are called dimensional tables. A fact table is
usually the MAIN table in a snowflake schema.

Some of the benefits are (from GeeksforGeeks :D):

- Fast analytical queries
- Efficient joins
- Easy slicing, dicing, aggregation, and reporting

### Macro functions

These are effectively the same thing as util functions in web apps. They're an
easy way to reuse business logic across multiple models.

### Tests

There are two primary types of tests: singular tests and generic tests.
Singular tests allow you to write SQL queries that return failing rows.
Generic tests use inbuilt tests in a YML file to find rows that don't meet
a certain criteria.

## Usage

In order to run singular models, use this command:
`dbt run -s [model file name without the ".sql"]`.
In order to run tests, just use `dbt test`.
Both of the above commands should be run within the data_pipeline directory
In order to deploy the astro airflow project,
run `astro dev start` in the dbt-dag directory. Lastly, once
Airflow has deployed the astro project, go to Admin then Connections
and add Snowflake as a connection. Then you should be done :D!
