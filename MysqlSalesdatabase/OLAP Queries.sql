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



/* 4 - number of unit sales of a item in a quarter*/

select ssitem.ItemId , sstimedim.TimeQuarter , sum(sssales.SalesUnits)
from
(
ssitem join sssales on ssitem.ItemId = sssales.ItemId
)
join sstimedim on sstimedim.TimeNo = sssales.timeno
where ssitem.ItemId = 'I0036566'
group by sstimedim.TimeQuarter;

/* 5- number of item sales by customes of a particular area[state] */

select  ssitem.ItemId, sssales.SalesUnits , sscustomer.CustState , sum(sssales.SalesUnits)
from
(
sssales join ssitem on sssales.ItemId = ssitem.ItemId
)
join sscustomer on sscustomer.CustId = sssales.CustId
where ssitem.ItemId = 'I0036577'
group by sscustomer.CustState;

/* it shows there are no customers from State BC for I0036566*/

/* */