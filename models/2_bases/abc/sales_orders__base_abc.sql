with source as (

    select * from {{ ref('abc__customer_orders') }}

),

renamed as (

    select
        id as sales_order_id,
        user_id as customer_id,
        order_date as sales_order_date,
        status as sales_order_status
    from source
    
)

select * from renamed
