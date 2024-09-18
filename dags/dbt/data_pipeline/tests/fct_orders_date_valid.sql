select *
    from {{ref('fct_orders')}}
where 
    date(order_date) > current_date() OR
    date(order_date) < date('1970-01-01')

