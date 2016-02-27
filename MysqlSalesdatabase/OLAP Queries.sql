show tables;

/* 1 */
select sscustomer.CustId,  ssitem.ItemBrand from
(
 sscustomer join sssales on sscustomer.CustId= sssales.CustId
)

join ssitem on sssales.ItemId = ssitem.ItemId;

/* 2 */


select ssstore.StoreId, sssales.SalesUnits, ssitem.ItemUnitPrice,sssales.SalesUnits*ssitem.ItemUnitPrice as 'total_Item_price',
ssitem.ItemId,sssales.CustId, sum(sssales.SalesUnits)
from
(
ssstore join sssales on ssstore.StoreId = sssales.StoreId
)

join ssitem on sssales.ItemId = ssitem.ItemId
group by sssales.StoreId;


/* 3 - total sales of all models in the quarter 1*/

select  sstimedim.TimeQuarter,
sum(sssales.SalesDollar)
from
(
sssales join ssitem on sssales.ItemId = ssitem.ItemId
)
join sstimedim on sssales.timeno = sstimedim.TimeNo
where ( sstimedim.TimeQuarter = 1)
group by sstimedim.TimeQuarter
;
