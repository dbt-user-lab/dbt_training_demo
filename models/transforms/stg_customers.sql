{{
  config(
    materialized='incremental',
    incremental_strategy='merge',
	unique_key = 'customer_id'
  )
}}

select
    customer_id as customer_id,
    trim(name) as customer_name, 
    trim(country) as country, 
    created_date as created_date,
    lastmodified_date as lastmodified_date,
    'NA' as region
from {{ ref('raw_customers') }}

{% if is_incremental() %}

    where lastmodified_date > (select max(lastmodified_date) from {{ this }})

{% endif %}
