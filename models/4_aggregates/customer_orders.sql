with 

customers as (
    select * from {{ ref('base_customer') }} ),

orders as (
    select * from {{ ref('base_customer_orders') }} ),

payments as (
    select * from {{ ref('base_customer_payments') }} ),

customer_orders__agg as (

    select
        customer_id,

        min(order_date) as first_order,
        max(order_date) as most_recent_order,
        count(customer_order_id) as count_of_customer_orders,
        count(if(is_delivered, true, null)) as count_of_customer_orders_delivered
        
    from orders

    group by 1

),

customer_payments as (

    select
        orders.customer_id,
        sum(payments.payment_amount) as customer_historical_value,
        sum(
            if(
                orders.is_delivered, 
                payments.payment_amount, 
                null
            )
        ) as customer_historical_value_delivered

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
        customer_orders__agg.count_of_customer_orders_delivered, 
        customer_payments.customer_historical_value,
        customer_payments.customer_historical_value_delivered

    from customers

    left join customer_orders__agg using (customer_id)

    left join customer_payments using (customer_id)

)

select * from joined
