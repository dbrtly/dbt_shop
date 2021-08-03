{% macro generate_base_model(source_name, table_name, leading_commas=False) %}

{%- set source_relation = source(source_name, table_name) -%}

{%- set columns = adapter.get_columns_in_relation(source_relation) -%}
{% set column_names=columns | map(attribute='name') %}
{% set model_sql %}
with source as (

    select * from {% raw %}{{ source({% endraw %}'{{ source_name }}', '{{ table_name }}'{% raw %}) }}{% endraw %}

),

enrich as (

    select
        {%- if leading_commas -%}
        {%- for column in column_names %}
        {{", " if not loop.first}}{{ column | lower }}
        {%- endfor %}
        {%- else -%}
        {%- for column in column_names %}
        {{ column | lower }}{{"," if not loop.last}}
        {%- endfor -%}
        {%- endif %}

    from source

)

select * from enrich

{% endset %}

{% if execute %}

{{ log(base_model_sql, info=True) }}
{% do return(model_sql) %}

{% endif %}
{% endmacro %}
