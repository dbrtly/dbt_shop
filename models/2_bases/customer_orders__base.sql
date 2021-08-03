with source as (

    select * from {{ source('raw_jaffle_shop', 'customer_orders') }}

),

renamed as (

    select
        id as customer_order_id,
        user_id as customer_id,
        order_date,
        status as customer_order_status
    from source

)

select * from renamed
