with 

js as (

    select * from {{ ref('sales_orders__base_js') }}

),

abc as (

    select * from {{ ref('sales_orders__base_abc') }}

),

spine as (

  select sales_order_id from js
  union distinct
  select sales_order_id from abc

),

quality as (

    select 
        spine.sales_order_id,
        coalesce(js.customer_id, abc.customer_id) as customer_id,
        coalesce(js.sales_order_date, abc.sales_order_date) as sales_order_date,
        coalesce(js.sales_order_status, abc.sales_order_status) as sales_order_status

    from spine
    
    left join js  using (sales_order_id)
    
    left join abc using (sales_order_id)

)

select * from quality 
