select  customer_id, 
        name, 
        country, 
        region_id, 
        to_date(created_date) as created_date , 
        to_date(lastmodified_date) as lastmodified_date 
from {{ source('raw','customers')}}