{% macro metric_average (aggregate_column_name) %}
    avg( {{ aggregate_column_name }} )
{% endmacro %}

{% macro metric_average_when_boolean (aggregate_column_name, filter_column_name) %}
    avg(if( {{ filter_column_name }}, {{ aggregate_column_name }}, null ))
{% endmacro %}

{% macro metric_average_filtered (aggregate_column_name, filter_column_name, filter_operator, filter_condition) %}
    avg(if( 
        {{ filter_column_name }} {{ filter_operator }} ( {{ filter_condition }} ),
        {{ aggregate_column_name }},  
        null ))
{% endmacro %}