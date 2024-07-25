
{% snapshot products_snapshot %}
{{
    config(
    target_schema='raw',
    unique_key='product_id',
    strategy='check',
    check_cols=['product_id'],
)
}}
select * from {{ source('raw','products') }}
{% endsnapshot %}