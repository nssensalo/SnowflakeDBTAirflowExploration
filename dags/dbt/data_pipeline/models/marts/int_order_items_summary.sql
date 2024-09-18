select 
    order_key,
    sum(extended_price) as gross_items_sales_amount,
    sum(item_discounted_amount) as item_discounted_amount
from
    {{ref('int_order_items')}}
GROUP BY
    order_key