select 
    line_item.order_item_key,
    line_item.part_key,
    line_item.line_number,
    line_item.extended_price,
    orders.order_key,
    orders.customer_key,
    orders.order_date,
   {{ discounted_amount('line_item.discount_percentage', 'line_item.extended_price')}} as item_discounted_amount

from {{ ref('stg_tpch_orders') }} as orders
join {{ ref('stg_tpch_line_items')}} as line_item
    on orders.order_key = line_item.order_key
ORDER BY
     orders.order_date