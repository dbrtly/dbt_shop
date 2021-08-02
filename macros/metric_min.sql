{%- macro metric_min ( aggregate_column_name ) -%}
    min({{ aggregate_column_name }})
{%- endmacro -%}

{%- macro metric_min_when_boolean (aggregate_column_name, filter_column_name) -%}
    min(if({{ filter_column_name }}, {{ aggregate_column_name }}, null))
{%- endmacro -%}

{%- macro metric_min_filtered (aggregate_column_name, filter_column_name, filter_operator, filter_condition) -%}
    min(if(
        {{ filter_column_name }} {{ filter_operator }} ( {{ filter_condition }} ), 
        {{ aggregate_column_name }}, null))
{%- endmacro -%}
