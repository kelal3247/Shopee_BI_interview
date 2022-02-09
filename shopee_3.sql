with cte1 as (
select
shopid
, min(order_time) order_time
from
order_tab
group by
shopid
)

select
cte1.shopid
,ot.buyerid
,cte1.order_time
from cte1 cte1
join order_tab ot
on cte1.shopid = ot.shopid
and cte1.order_time = ot.order_time
;