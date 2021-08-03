{{ codegen.generate_exposure_yaml('customer_orders') }}

dbt run-operation generate_exposure_yaml --args '{"model_name": "customer_orders"}'