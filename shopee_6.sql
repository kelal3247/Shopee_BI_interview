select
ot.shopid
, count(ot.orderid) total_order
, sum(pt.total_clicks) total_clicks
, sum(pt.item_views) total_views
, sum(pt.impressions) total_impressions
from order_tab ot
join performance_tab pt
on ot.shopid = pt.shopid
join user_tab ut
on pt.shopid = ut.shopid
and ot.buyerid = ut.buyerid
group by ot.shopid
;