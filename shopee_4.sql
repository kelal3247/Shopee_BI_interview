select * from (
(select
ot.buyerid
, ut.country
, round(avg(ot.gmv),2) gmv
from order_tab ot
join user_tab ut
on ot.shopid = ut.shopid
and ot.buyerid = ut.buyerid
where ut.country = 'ID'
group by 
ot.buyerid
, ut.country
)

union

(select
ot.buyerid
, ut.country
, round(avg(ot.gmv),2) gmv
from order_tab ot
join user_tab ut
on ot.shopid = ut.shopid
and ot.buyerid = ut.buyerid
where ut.country = 'SG'
group by 
ot.buyerid
, ut.country
)
) a
order by a.gmv desc
limit 10
;