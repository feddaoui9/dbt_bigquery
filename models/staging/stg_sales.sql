{{ config(
    materialized='table',
    partition_by = {
      "field": "order_date",
      "data_type": "date",
      "granularity": "month"
      },
    cluster_by = [
     "country"
    ]      
)}}

SELECT
    order_id,
    order_date,
    product_name,
    amount,
    country,
    discount,
    {{ dynamic_partition('order_date', 'MONTH') }}  
FROM `sales-analytics-459112.sales_dataset.raw_sales`