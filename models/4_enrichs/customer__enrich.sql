with source as (

    select * from {{ ref('customer__blend') }}

),

enrich as (

    select
        {{ dbt_utils.star(from=ref('customer__blend')) }},
        'first_name' || ' ' || 'last_name' as customer

    from source

)

select * from enrich
