{{ codegen.generate_base_model(
    source_name='raw_jaffle_shop',
    table_name='customers'
) }}

-- dbt run-operation generate_base_model --args '{"source_name": "raw_jaffle_shop", "table_name": "customers"}'
dbt run-operation generate_base_model --args '{"source_name": "raw_jaffle_shop", "table_name": "customer_orders"}'
dbt run-operation generate_base_model --args '{"source_name": "raw_stripe", "table_name": "payments"}'