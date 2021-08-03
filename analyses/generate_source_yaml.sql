{{ codegen.generate_source('raw_jaffle_shop') }}

-- export FILE=generate_source_yaml.yml
-- dbt run-operation generate_source_yaml --args '{"schema_name": "iowa_liquor_sales", "database_name": "bigquery-public-data"}' > ${FILE}
