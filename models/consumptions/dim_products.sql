{{
  config(
    schema = 'consumption',
    materialized='view'
  )
}}

select
    product_id,
    product_name, 
    unit_price,
    created_date
    from {{ ref('stg_products') }}