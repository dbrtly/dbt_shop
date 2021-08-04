with source as (

    select * from {{ ref('abc__customer') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        email

    from source

)

select * from renamed
