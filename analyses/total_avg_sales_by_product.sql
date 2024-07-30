select
   product_id,
   product_name,
   {{ generate_sales_metrics(['total','average'], 'order_amount') }}
from {{ ref('fact_sales') }}
group by all