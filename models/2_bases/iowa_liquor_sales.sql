with source as (

    select * from {{ source('iowa_liquor_sales', 'sales') }}

),

renamed as (

    select
        invoice_and_item_number,
        date as invoice_date,
        store_number,
        store_name,
        address,
        city,
        zip_code,
        store_location,
        county_number,
        county,
        category,
        category_name,
        vendor_number,
        vendor_name,
        item_number,
        item_description,
        pack,
        bottle_volume_ml,
        state_bottle_cost,
        state_bottle_retail,
        bottles_sold,
        sale_dollars,
        volume_sold_liters,
        volume_sold_gallons

    from source

)

select * from renamed