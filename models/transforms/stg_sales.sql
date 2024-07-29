{{
  config(
    schema = 'transform',
    materialized='incremental',
    incremental_strategy='merge',
	unique_key = 'order_id'
  )
}}

select
   sales.order_id as order_id,
   sales.product_id as product_id,
   sales.customer_id as customer_id,
   sales.order_date as order_date,
   sales.order_amount as order_amount,
   sales.created_date as created_date,
   sales.quantity as quantity,
   dim_products.product_name  as product_name ,
   dim_products.unit_price as product_unit_price,
   dim_customers.customer_name as customer_name,
   dim_customers.country  as country,
   sales.lastmodified_date 
from {{ ref('raw_sales') }} sales
left join {{ ref('stg_products')}} dim_products
 on sales.product_id=dim_products.product_id
left join {{ ref('stg_customers')}} dim_customers
  on sales.customer_id = dim_customers.customer_id

{% if is_incremental() %}

    where last_modified_date > (select max(last_modified_date) from {{ this }})

{% endif %}

