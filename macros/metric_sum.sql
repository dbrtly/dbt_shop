{%- macro metric_sum ( aggregate_column_name ) -%}
   sum({{ aggregate_column_name }})
{%- endmacro -%}

{%- macro metric_sum_when_boolean (aggregate_column_name, filter_column_name) -%}
   sum(if({{ filter_column_name }}, {{ aggregate_column_name }}, null))
{%- endmacro -%}

{%- macro metric_sum_filtered (aggregate_column_name, filter_column_name, filter_operator, filter_condition) -%}
    sum(if(
      {{ filter_column_name }} {{ filter_operator }} ( {{ filter_condition }} ), 
      {{ aggregate_column_name }}, null))
{%- endmacro -%}
