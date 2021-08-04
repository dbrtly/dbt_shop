{%- macro extract_email_domain(email_column) -%}
    regexp_extract( {{ email_column }}, r'@(.+)')
{%- endmacro -%}
