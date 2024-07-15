--lọc khách hàng order>20 đơn và sx theo tổng số đơn giảm dần
select[CustomerID],count([OrderID])as[totalorders]
from Orders
group by [CustomerID]
having count([OrderID])>20
order by count([OrderID]) desc;

--lọc employeeid có tổng đơn >=100, sx theo tổng số đơn giảm dần
select[EmployeeID],count([OrderID])as[totalorders]
from Orders
group by [EmployeeID]
having count([OrderID])>=100
order by count([OrderID]) desc;

--lọc categoryid có sp khác nhau lớn hơn 11
select[CategoryID], count([ProductID])
from Products
group by [CategoryID]
having count([ProductID])>11;

--lọc quốc gia có nh hơn 7 đơn hàng
select ShipCountry, COUNT([OrderID])as [totalOrder]
from Orders
group by ShipCountry
having COUNT([OrderID])>7;

--những country bắt đầu chữ A hoặc G và có số lượng đơn hàng lớn hơn 29
select ShipCountry, COUNT(*)as[totalOrder]
from Orders
where [ShipCountry] like 'A%' or [ShipCountry] like 'G%'
group by [ShipCountry] 
having  COUNT(*)>29;

--những city có số lượng đơn hàng đc giao là khác 1 và 2, ngày đặt hàng từ ngày '1997-04-01' đến '1997-08-31'
select[ShipCity], count([OrderID]) as [so luong don hang]
from Orders
where  [OrderDate]between '1997-04-01' and '1997-08-31'
group by [ShipCity]
having count([OrderID]) not in (1,2);

