FROM astrocrpublic.azurecr.io/runtime:3.2-4

# Will just create a python venv to install the snowflake pkg 
# Then it'll deactivate it
RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
  pip install --no-cache-dir dbt_snowflake && deactivate
