with 

customers as (
    select * from {{ ref('customer') }} ),

orders as (
    select * from {{ ref('customer_orders') }} ),

payments as (
    select * from {{ ref('customer_payments__base') }} ),

customer_orders__agg as (

    select
        customer_order_id,
        customer_id,
        order_date,
        customer_order_status,
        is_completed
        
    from orders

    group by 1

),

customer_payments__pivot as (

    select
        payments.customer_order_id,
        payments.payment_method,
        {{ metric_sum('payments.payment_amount') }} as total_order_value

    from payments

    pivot ({{ metric_sum('payments.payment_amount') }} as total_order_value) 
    for payment_status in ('fail', 'success')

    group by 1, 2

),

joined as (

    select
        customers.customer_id,
        customers.customer,
        customers.first_name,
        customers.last_name,
        customer_orders__agg.first_order,
        customer_orders__agg.most_recent_order,
        customer_orders__agg.count_of_customer_orders, 
        customer_orders__agg.count_of_customer_orders_completed, 
        customer_payments__agg.total_customer_historical_value,
        customer_payments__agg.total_customer_historical_value_completed,

    from customers

    left join customer_orders__agg using (customer_id)

    left join customer_payments__agg using (customer_id)

)

select * from joined
