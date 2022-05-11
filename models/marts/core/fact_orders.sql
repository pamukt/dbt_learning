with orders as (
    select order_id, customer_id, order_date from {{ref('stg_orders')}}
),

payment as (
    select order_id, amount from {{ref('stg_payments')}}
    where status = 'success'
)
select o.order_id, o.customer_id, p.amount, o.order_date
from orders o
left join payment p on p.order_id = o.order_id
