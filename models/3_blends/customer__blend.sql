with 

js as (

    select * except (email) from {{ ref('customer__base_js') }}

),

abc as (

    select * from {{ ref('customer__base_abc') }}

),

quality as (

    select 
        js.customer_id,
        js.first_name,
        js.last_name,
        {{ extract_email_domain('abc.email') }} as extract_email_domain

    from js
    
    left join abc using (customer_id)

)

select * from quality 
