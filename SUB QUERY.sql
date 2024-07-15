--list toàn bộ sp
select ProductID,ProductName,UnitPrice
from Products;
-- avg cac sp tren
select AVG(UnitPrice)
from Products;
--loc nhung  sp có giá> giá avg sub query
select ProductID,ProductName,UnitPrice
from Products
where UnitPrice>(select AVG(UnitPrice)
from Products);




--loc khach hang co so don hang >10
select CompanyName
from Customers
where CustomerID in(
					select CustomerID
					from Orders 
					group by CustomerID
					having count(orderid)>10);
-- cách dùng having ko cần dùng subquery
select c.CompanyName, count(o.orderid) as[NumberOrders]
from Customers as c, Orders as o
where c.CustomerID=o.CustomerID
group by c.CompanyName
having count(OrderID)>10;



--tinh so tien cua tung don hang theo bang order. 
--tức là chèn thêm cột sum vào bảng order id. chỉ cần select thêm sum thôi, ko cần group by vì cần 1 cột orderid
select o.*,(
			select sum (UnitPrice*Quantity-Discount) from [Order Details] od where od.OrderID=o.OrderID
           ) as totalmoneyorders
from Orders o;


--mỗi 1 sp lọc ra tên sp, tổng số đơn hàng của sp
select p.productid, p.productname,
		(
		select count(orderid)from [Order Details] od where p.productid=od.productid
		) as [totalorders]
from products p;


-- in ra ma don hang va luong sp cua don hang do
select o.OrderID,
      (select count(od.ProductID) from [Order Details] od where od.OrderID=o.OrderID ) as totalproduct
from orders o;


--liet ke nh san pham ma ko co order
select productid
from Products
where ProductID not in (select distinct ProductID from [Order Details]);
--lay tt don hang va ten sp thuoc don chua dc giao cho khach
select p.ProductName,o.OrderID
from Orders o
join [Order Details] od on od.OrderID=o.OrderID
join Products p on p.ProductID=od.ProductID
where o.OrderID in (
select OrderID from Orders where ShippedDate is null);

--lay tt cac sp co so luong ton kho it hon so luong ton kho trung binh trong all sp
select*
from Products
where UnitsInStock <(select AVG(UnitsInStock)from Products);

--lay tt khach hang co tong gia tri don hang max
select c.CompanyName, c.ContactName from Customers c
join Orders o on c.CustomerID=o.CustomerID
join [Order Details] od on od.OrderID=o.OrderID
where (od.UnitPrice*od.Quantity) =
(select max(UnitPrice*Quantity) from [Order Details]);
