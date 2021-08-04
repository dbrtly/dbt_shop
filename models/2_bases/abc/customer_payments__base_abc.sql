select 
  id as customer_payment_id,
  order_id	as sales_order_id,
  payment_method	as payment_method,
  amount as payment_amount
    
from {{ ref('abc_customer_payments') }}
