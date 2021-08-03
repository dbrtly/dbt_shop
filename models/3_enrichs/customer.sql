with source as (

    select * from {{ ref('customer__base') }}

),

enrich as (

    select
        customer_id,
        {{ concat('first_name', ' ', 'last_name') }} as customer,
        first_name,
        last_name

    from source

)

select * from enrich
