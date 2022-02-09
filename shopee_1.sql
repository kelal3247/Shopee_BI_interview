select
buyerid
, min(order_time) first_order
, max(order_time) last_order
from order_tab
group by 
buyerid
order by 
buyerid
;

