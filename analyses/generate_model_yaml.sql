{{ codegen.generate_model_yaml(
    model_name='customer__base'
) }}

dbt run-operation generate_model_yaml --args '{"model_name": "customer"}'