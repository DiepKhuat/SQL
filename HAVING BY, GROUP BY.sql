 --select all orders that be shipped with conditions:
 --a/ shipcountry is brazil, uk , germany
select*
from Orders
where ShipCountry='germany'or ShipCountry='uk'or ShipCountry='brazil';

select*
from Orders
where ShipCountry in('germany','UK','brazil');
--b/ shipcountry is not from germany, uk, brazil
select*
from Orders
where ShipCountry not in ('germany','UK','brazil');

--select all products that have categoryid is not 2,3,4
select*
from Products
where CategoryID not in (2,3,4);

--select employees who not women
select*
from Employees
where TitleOfCourtesy not in('mrs.','ms.');

--select all customer from 3 cities berlin, london, warszawa
select*
from Customers
where City in ('berlin', 'london', 'warszawa');


--NHÓM CÁC DỮ LIỆU BẰNG GROUP BY
-- cho biết mỗi khách hàng đã đặt bn đơn hàng
select CustomerID, count([OrderID])as[totalorders]
from Orders
group by[CustomerID];

--tính giá trị đơn giá trung bình theo mỗi suppilersid 
select[SupplierID], AVG([UnitPrice]) as[avgUnitPrice]
from Products
group by [SupplierID];

--tính mỗi unitinstock có tổng số bn sp trong kho
select [CategoryID], sum([UnitsInStock])
from Products
group by[CategoryID];

-- cho biết giá vc lớn nhất và thấp nhất của các đơn hàng theo từng thành phố và quốc gia khác nhau
select[ShipCountry] , [ShipCity],min([Freight])as[minFreight],max([Freight])as[maxfreight]
from Orders
group by ShipCountry, ShipCity
order by ShipCountry asc, ShipCity asc;
--thống kê nhân viên theo từng quốc gia khác nhau
select [Country],count ([EmployeeID])as [totalemployee]
from Employees
group by Country;
--thống kê các khách hàng có chữ a trong tên theo thành phố và country từ a-z. 
select[Country],[City], COUNT([CustomerID])as [TheNumberCustomer]
from Customers
where[CompanyName]like'%a%'
group by [Country],[City]
order by [Country] asc;
--Tính số lượng đơn đặt hàng trong năm 1997 của từng khách hàng
select[CustomerID], 
     count(*)as [totalorder],
	 year([OrderDate]) as [year]
from Orders
where year ([orderdate])=1997
group by[CustomerID],year([OrderDate]);
--lọc ra đơn orders vào tháng 5 năm 1997
select *
from Orders
where month([orderdate])=5 and year([OrderDate])=1997;
--lấy ds khách hàng trong năm 1998 và số đơn hàng mỗi tháng sx theo tháng tăng dần
select[CustomerID],
      month([OrderDate]) as [ month],
	  count (*) as [totalOrders]
from Orders
where year ([orderdate])=1998
group by [CustomerID],month([OrderDate]) 
order by month([OrderDate]) asc;
-- Lọc đơn đã dc giao vào tháng 5 và sx theo tăng dần theo năm
select[OrderID],
      month([ShippedDate]) as [ month],
	  year([ShippedDate]) as [year],
	  count (*) as [totalOrders]
from Orders
where month([ShippedDate])=5
group by[OrderID],month([ShippedDate]), year([ShippedDate])
order by year([ShippedDate]) asc;

-- HAVING LỌC DỮ LIỆU SAU GROUP BY
--lọc dữ liệu khách hàng đặt nh hơn 20 đơn và sx thứ tự tổng số đơn giảm dần
select[CustomerID],count([OrderID])as[TotalOrders]
from Orders
group by [CustomerID]
having count([OrderID])>20
order by count([OrderID]) desc;
--lọc ra nhà cung cấp sp có tổng unitinstock>30 và trung bình unitprice<50
select [SupplierID],sum(UnitsInStock)as[TotalUnitsInStock], AVG([UnitPrice]) as [avgprice]
from Products
group by [SupplierID]
having sum([UnitsInStock])>30 and AVG([UnitPrice])<50;
--tổng số tiền vc từng tháng, trong nửa năm sau của 1996, sx theo tháng tăng dần
select month([ShippedDate])as [monthshipped], sum([Freight])as[totalfreight]
from Orders
where month([ShippedDate])>6 and year([ShippedDate])=1996
group by month([ShippedDate])
order by month([ShippedDate]) asc;
--lọc nhg city có số lg đơn hàng>16 và sx tổng số luongj giảm dần
select[ShipCity], count([OrderID])as[totalorders]
from Orders
group by [ShipCity]
having  count([OrderID])>16
order by count([OrderID])desc;