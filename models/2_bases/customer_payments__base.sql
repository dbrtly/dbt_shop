with source as (

    select * from {{ source('stripe', 'payments') }}

),

renamed as (

    select
        id as customer_payment_id,
        orderid as sales_order_id,
        paymentmethod as payment_method,
        status as payment_status,
        amount as payment_amount,
        created	as created_at,
        _batched_at

    from source

)

select * from renamed
