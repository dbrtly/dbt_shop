select
    customer_order_id,
    customer_id,
    order_date,
    customer_order_status,
    coalesce(lower(customer_order_status)='completed', false)
        as is_completed
    
from {{ ref('customer_orders__base') }}
