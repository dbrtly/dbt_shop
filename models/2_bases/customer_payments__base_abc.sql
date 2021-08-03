select 
  id as customer_payment_id,
  orderid	as customer_order_id,
  paymentmethod	as payment_method,
  amount as payment_amount
    
from {{ ref('abc_customer_payments') }}
