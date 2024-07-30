select
    customer_id,
    customer_name, 
    country, 
    created_date,
    region
from {{ ref('stg_customers') }}