
select c.CompanyName, count(o.orderid) as  total
from [dbo].[Orders] o 
join [dbo].[Customers] c
on o.CustomerID=c.CustomerID
group by c.CompanyName;

select c.CompanyName, count(o.orderid)
from [dbo].[Orders] o
right join [dbo].[Customers] c
on o.CustomerID=c.CustomerID
group by c.CompanyName;

select c.CompanyName, count(o.orderid)
from [dbo].[Orders] o
full join [dbo].[Customers] c
on o.CustomerID=c.CustomerID
group by c.CompanyName;
-- liệt kê tên sp, tên nhà cung cấp của sp đã dc đặ trong orders detail
-- đồng thời lấy tt sp và nhà cung cấp
select od.ProductID, p.productname, s.CompanyName
from [Order Details] od
join Products p
on od.ProductID=p.ProductID
join Suppliers s
on s.SupplierID=p.ProductID;
--liệt kê tên kh và nv phụ trách trong bảng order, bao gồm cả đơn ko có nv phụ trách
-- kết hợp orders và employees lấy tt khách hàng và nv phụ trách
select e.LastName,e.FirstName,c.companyname
from Orders o
left join Employees e
on e.EmployeeID=o.EmployeeID
left join Customers c
on c.CustomerID=o.CustomerID;
--list tên khhang, nv phụ trách trong bảng orders, bao gồm khách ko có đơn
--kết hợp bảng orders và customers lấy thông tin khách hàng vs nv 
select o.OrderID, e.LastName,e.FirstName,c.companyname
from Orders o
right join Employees e
on e.EmployeeID=o.EmployeeID
right join Customers c
on c.CustomerID=o.CustomerID;
--lấy list khách hàng trong bảng orders kể cả khách ko có đơn hàng nào
select o.OrderID, c.CompanyName
from Orders o
right join Customers c
on c.CustomerID=o.CustomerID;

