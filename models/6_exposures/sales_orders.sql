{% set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] %}

with orders as (

    select * from {{ ref('sales_orders__enrich') }}

),

payments as (

    select * from {{ ref('customer_payments__base') }}

),

customer as (

    select * from {{ ref('customer__agg') }}

),

order_payments as (

    select
        sales_order_id,

        {% for payment_method in payment_methods -%}
        sum(case when payment_method = '{{ payment_method }}' then payment_amount else 0 end) as total_{{ payment_method }}_amount,
        {% endfor -%}

        sum(payment_amount) as total_amount

    from payments

    group by 1

),

joined as (

    select
        orders.sales_order_id,
        struct(
            orders.customer_id,
            customer.customer,
            customer.first_name,
            customer.last_name,
            customer.first_order,
            customer.most_recent_order,
            customer.count_of_sales_orders, 
            customer.count_of_sales_orders_completed, 
            customer.total_customer_historical_value,
            customer.total_customer_historical_value_completed
        ) as customer,
        orders.sales_order_date,
        orders.sales_order_status,
        {%- for payment_method in payment_methods -%}
        order_payments.total_{{ payment_method }}_amount,
        {%- endfor -%}
        order_payments.total_amount as total_payment_amount

    from orders

    left join order_payments using (sales_order_id)

    left join customer using (customer_id)

)

select * from joined
