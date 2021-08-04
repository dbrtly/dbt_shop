with 

abc as (

    select * from {{ ref('customer_payments__base_abc') }}

),

js as (

    select * from {{ ref('customer_payments__base_js') }}

),

spine as (

  select customer_payment_id from js
  union distinct
  select customer_payment_id from abc

),

quality as (

    select 
        spine.customer_payment_id,
        coalesce(js.sales_order_id, abc.sales_order_id) as sales_order_id,
        coalesce(js.payment_method, abc.payment_method) as payment_method,
        coalesce(js.payment_status, abc.payment_status) as payment_status,
        coalesce(js.payment_amount, abc.payment_amount) as payment_amount,
        coalesce(js.created_at, abc.created_at) as created_at,
        coalesce(js._batched_at, abc._batched_at) as _batched_at

    from spine
    
    left join js  using (customer_payment_id)
    
    left join abc using (customer_payment_id)

)

select * from quality 
