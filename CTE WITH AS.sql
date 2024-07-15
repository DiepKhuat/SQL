with [short_e] AS (
SELECT [EmployeeID],[LastName],[FirstName]
  FROM [NORTHWND].[dbo].[Employees]
                )
  select * from short_e;


--lay tt orders cung vs tong gia tri don hang va ty le giua tong gia tri va phi giao hang
select OrderID,freight,
     (
	  (select sum(UnitPrice*Quantity) from [Order Details] od where o.OrderID=od.OrderID)/Freight
	  ) as ratio,
      (select sum(UnitPrice*Quantity) from [Order Details] od where o.OrderID=od.OrderID) as sumprice
from orders o;
---CTE
with OrderTotals AS (
        select orderid, 
		       sum(UnitPrice*Quantity) as totalprice from [Order Details] 
			   group by OrderID
			         )
select  o.OrderID,o.Freight, ot.totalprice/o.Freight ratio, ot.totalprice 
from Orders o
join OrderTotals ot on o.OrderID=ot.OrderID;