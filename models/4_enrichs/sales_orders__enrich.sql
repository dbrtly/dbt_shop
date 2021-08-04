with source as (

    select * from {{ ref('sales_orders__base') }}

),

enrich as (

    select
        sales_order_id,
        customer_id,
        sales_order_date,
        sales_order_status,
        coalesce(lower(sales_order_status)='completed', false)
            as is_completed
        
    from source

)

select * from enrich
