/*

      Note that this code is purely used as a setup script for snowflake,
      and, since I'm going to make this public, I'm also going to remove
      my personal snowflake username and replace it with [SNOWFLAKE_USERNAME]

*/

-- Make sure you're on the account admin role so you can create stuff
use role accountadmin;

-- Makes the warehouse, db, and role
create warehouse dbt_wh with warehouse_size='x-small';
create database if not exists dbt_db;
create role if not exists dbt_role;

-- Allows you to use dbt_role and have access to dbt_db and dbt_wh
grant usage on warehouse dbt_wh to role dbt_role;
grant role dbt_role to user [SNOWFLAKE_USERNAME];
grant all on database dbt_db to role dbt_role;

use role dbt_role;

-- Creates a db schema
create schema dbt_db.db_schema;

-- To make sure snowflake no chargey you
use role accountadmin;
drop warehouse if exists dbt_wh;
drop database if exists dbt_db;
drop role if exists dbt_role;
