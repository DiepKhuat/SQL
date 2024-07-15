--từ bảng products và categories, in ra các thongtin sau mã thể loại,tên thể loại,mã sp, tên sp
select p.CategoryID,p.ProductName,c.CategoryName,p.ProductID
from Products as p, Categories as c
where p.CategoryID=c.CategoryID;
--bảng employees và orders, in ra các tt sau employeeid, last-fristname, số lượng đh mà nv bán dc
select e.EmployeeID,e.LastName,e.FirstName, count(o.[OrderID]) as [totelorders]
from Employees as e, Orders as o
where e.EmployeeID=o.EmployeeID
group by e.[EmployeeID],e.LastName,e.FirstName;
--customers và orders in tt customerid,companyname,contactname, số lg dh đã mua vs dk quốc gia khách hàng là uk
select o.CustomerID, c.companyname, c.contactname, count(o.orderid) as[totalorder]
from Orders as o, Customers as c
where o.ShipCountry='UK'and o.customerid=c.customerid
group by o.[CustomerID],c.companyname, c.contactname;
--orders và shippers, tt sau shipperid,companyname(ship), sum freight, in ra theo thứ tự sx tổng số tiền vc giảm dần
SELECT                 s.ShipperID, s.CompanyName, SUM(o.Freight) AS SumFreight
FROM                   Orders AS o INNER JOIN
                               Shippers AS s ON o.ShipVia = s.ShipperID
GROUP BY          s.ShipperID, s.CompanyName
ORDER BY           SumFreight DESC
--products và suppliers in tt sau supplierid, companyname,tổng các categoryid khác nhau và chỉ in ra duy nhất 1 nhà cung cấp. 
--(priductid bản chất mỗi sp là đã khác nhau),số lượng sp khác nhau nh nhất
select top 1 s.SupplierID, s.CompanyName, count(p.ProductID)
from Suppliers as s, products as p
where s.SupplierID=p.SupplierID
group by s.SupplierID, s.CompanyName
order by count(p.ProductID) desc;
--orders và orders details, lấy mã đơn hàng, mã khng tổng số tiền sp của đơn hàng đó
select od.OrderID,o.[CustomerID], sum(od.UnitPrice*od.Quantity) as[totalproducts]
from Orders as o, [Order Details] as od
where o.OrderID=od.OrderID
group by od.OrderID,o.[CustomerID];

-- từ 3 bảng, lấy tt mã order, tên nv, tổng số tiền sp của đơn hàng
select e.FirstName, e.LastName,sum(od.UnitPrice*od.Quantity) as[totalproducts], od.OrderID
from Orders as o, [Order Details] as od, Employees as e
where od.OrderID=o.OrderID and o.EmployeeID=e.EmployeeID
group by od.OrderID,e.FirstName, e.LastName;

-- từ 3 bảng, lấy tt  mã đơn, tên khách, tên cty vchuyen, chỉ in đơn giao đến uk năm 1997
select o.OrderID, c.ContactName,s.CompanyName
from Customers as c, Orders as o, Shippers as s
where c.CustomerID=o.CustomerID and o.ShipVia=s.ShipperID
and o.ShipCountry='UK' and year([ShippedDate])=1997;

--products và categories lấy sp seafood tt sau mã thể loại, tên thể loại, mã sp, tên sp
select c.CategoryID, c.CategoryName,p.ProductID,p.ProductName
from Products as p, Categories as c
where p.CategoryID=c.CategoryID and CategoryName='seafood'; 
--products và suppliers, lấy sp cung cấp từ đức tt sau mã nhà cc, quốc giá, mã sp, tên sp
select s.SupplierID,s.Country,p.ProductID,p.ProductName
from Products as p, Suppliers as s
where p.SupplierID=p.SupplierID and s.Country='germany';
--customers, orders, shippers lay ma don hag, ten kh/hag, ten cty vc. chi vs don cua kh/hag tu london
select o.OrderID, c.ContactName, s.CompanyName
from Orders as o, Shippers as s, Customers as c
where o.CustomerID=c.CustomerID and o.ShipVia=s.ShipperID and c.City='london';
--tu 3 bang in tt sau ma dhg,ten khg,ten cty vc, requireddate vaf shipped date voi don hag bi giao muon 
select o.OrderID, c.ContactName,s.CompanyName,o.RequiredDate,o.ShippedDate
from Customers as c, orders as o, Shippers as s
where c.CustomerID=o.CustomerID and o.ShipVia=s.ShipperID and o.RequiredDate<o.ShippedDate;

--give these shipcountries for which customers dont come from the us. select only this countries which is over than 100 orders
--display shipcountry and number of orders
select top 1 o.ShipCountry, count(o.orderid) as[NumberOrders]
from Customers as c, Orders as o
where c.CustomerID=o.CustomerID and c.Country <>'USA'
group by o.ShipCountry
having count(OrderID)>100;

