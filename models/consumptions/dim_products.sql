select
    product_id,
    product_name, 
    unit_price,
    created_date,
    lastmodified_date
    from {{ ref('stg_products') }}