with 

customers as (
    select * from {{ ref('customer__base') }} ),

orders as (
    select * from {{ ref('customer_orders__curate') }} ),

payments as (
    select * from {{ ref('customer_payments__base') }} ),

customer_orders__agg as (

    select
        customer_id,

        {{ metric_min( 'order_date') }} as first_order,
        {{ metric_max( 'order_date') }} as most_recent_order,
        {{ metric_count( 'customer_order_id') }} as count_of_customer_orders,
        {{ metric_count_when_boolean('customer_order_id', 'is_completed') }} 
            as count_of_customer_orders_completed
        
    from orders

    group by 1

),

customer_payments__agg as (

    select
        orders.customer_id,
        {{ metric_sum('payments.payment_amount') }} as total_customer_historical_value,
        {{ metric_sum_when_boolean('payments.payment_amount', 'orders.is_completed') }} 
            as total_customer_historical_value_completed

    from payments

    left join orders using (customer_order_id)

    group by 1

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
