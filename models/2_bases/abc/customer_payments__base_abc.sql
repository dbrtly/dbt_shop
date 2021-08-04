with source as (

    select * from {{ ref('abc__customer_payments') }}

),

renamed as (

    select
        id as customer_payment_id,
        order_id as sales_order_id,
        payment_method,
        string(null) as payment_status,
        amount as payment_amount,
        timestamp(null) as created_at,
        timestamp(null) as _batched_at
        
    from source

)

select * from renamed
