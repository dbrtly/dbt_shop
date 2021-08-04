{%- macro metric_count(aggregate_column_name) -%}
    count({{ aggregate_column_name }})
{%- endmacro -%}

{%- macro metric_count_when_boolean (aggregate_column_name, filter_column_name) -%}
    count(if({{ filter_column_name }}, {{ aggregate_column_name }}, null))
{%- endmacro -%}

{%- macro metric_count_filtered (aggregate_column_name, filter_column_name, filter_operator, filter_condition) -%}
    count(if( 
      {{ filter_column_name }} {{ filter_operator }} ( {{ filter_condition }} ),
      {{ aggregate_column_name }},
      null ))
{%- endmacro -%}

{%- macro metric_count_distinct_filtered (aggregate_column_name, filter_column_name, filter_operator, filter_condition) -%}
    count(if( 
      {{ filter_column_name }} {{ filter_operator }} ( {{ filter_condition }} ),
      distinct( {{ aggregate_column_name }} ),
      null))
{%- endmacro -%}

{%- macro metric_approx_count_distinct_filtered (aggregate_column_name, filter_column_name, filter_operator, filter_condition) -%}
    approx_count_distinct(if( 
      {{ filter_column_name }} {{ filter_operator }} ( {{ filter_condition }} ),
      {{ aggregate_column_name }},
      null))
{%- endmacro -%}