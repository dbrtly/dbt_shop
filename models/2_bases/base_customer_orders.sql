select
    id as customer_order_id,
    user_id as customer_id,
    order_date,
    status as customer_order_status,
    case lower(status)
        when 'delivered' then true
        else false
    end as is_delivered
    
from {{ source('jaffle_shop', 'customer_orders') }}
