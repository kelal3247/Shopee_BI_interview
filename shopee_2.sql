select
buyerid
, count(orderid) total_order
, to_char(order_time, 'Month') as Month
from
order_tab
group by
buyerid
, to_char(order_time, 'Month')
having count(orderid) > 0
order by total_order
;
