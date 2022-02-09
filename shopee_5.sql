with odd as(
select
count(ot.buyerid) total_buyer_id
, ut.country
from order_tab ot
join user_tab ut
on ot.shopid = ut.shopid
and ot.buyerid = ut.buyerid
where MOD (ot.itemid, 2) = 1 -- odd
group by ut.country)

, even as (
select
count(ot.buyerid) total_buyer_id
, ut.country
from order_tab ot
join user_tab ut
on ot.shopid = ut.shopid
and ot.buyerid = ut.buyerid
where MOD (ot.itemid, 2) = 0 -- even
group by ut.country)

select 
(odd.total_buyer_id + even.total_buyer_id) total_buyer_id
, coalesce(odd.country, even.country) country
from odd
join even
on odd.country = even.country
;