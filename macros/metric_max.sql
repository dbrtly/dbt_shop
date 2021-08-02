{%- macro metric_max ( aggregate_column_name ) -%}
    max({{ aggregate_column_name }})
{%- endmacro -%}

{%- macro metric_max_when_boolean (aggregate_column_name, filter_column_name) -%}
    max(if({{ filter_column_name }}, {{ aggregate_column_name }}, null))
{%- endmacro -%}

{%- macro metric_max_filtered (aggregate_column_name, filter_column_name, filter_operator, filter_condition) -%}
    max(if(
        {{ filter_column_name }} {{ filter_operator }} ( {{ filter_condition }} ), 
        {{ aggregate_column_name }}, null))
{%- endmacro -%}
