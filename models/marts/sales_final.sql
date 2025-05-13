{{ config(
    materialized='view'   
)}}

SELECT
    country,
    product_name,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    {{ dynamic_partition('order_date', 'MONTH') }},
    {{ price_after_discount('amount', 'discount')}} AS price_after_discount
FROM {{ ref('stg_sales') }}
GROUP BY 1, 2, 5, 6