select CUSTOMER_ID, NAME, COUNTRY, 
to_date(concat(split_part(CREATED_DATETINE,'/',3), '-', split_part(CREATED_DATETINE,'/',1) , 
'-' ,split_part(CREATED_DATETINE,'/',2))) as CREATED_DATETINE,
to_date(concat(split_part(CREATED_DATETINE,'/',3), '-', split_part(CREATED_DATETINE,'/',1) ,
 '-' ,split_part(CREATED_DATETINE,'/',2))) as LASTMODIFIED_DATE
 from  {{source('src_raw','seed_customers')}}