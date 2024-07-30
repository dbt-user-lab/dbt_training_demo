{{
  config(
    schema = 'raw',
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
    to_date(lastmodified_date) as lastmodified_date
from {{ source('raw','sales') }}