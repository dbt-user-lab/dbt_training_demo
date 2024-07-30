{{
  config(
    schema = 'consumption',
    materialized='view'
  )
}}

select
   order_id,
   product_id,
   customer_id,
   order_date,
   order_amount,
   created_date,
   quantity,
   product_name ,
   product_unit_price,
   customer_name,
   country 
from {{ ref('stg_sales') }}