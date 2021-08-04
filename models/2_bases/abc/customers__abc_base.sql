select 
    id as customer_id,
    concat(first_name, last_name) as customer,
    first_name,
    last_name
    
from {{ ref('abc_customer') }}
