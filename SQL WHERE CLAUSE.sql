-- Mệnh đề WHERE- lọc dữ liệu trong truy vấn
--select column1, column2 ,.. from table-name    where condition; lọc bản ghi khi đáp ứng 1 đk cụ thể

--liệt kê all employees from london, rồi sx kết quả theo lastname A->Z
SELECT*
FROM Employees
WHERE[City]='LONDON'
ORDER BY [LastName] ASC;
-- Liệt kê all orders bị giao muộn RequiredDate ngày cần giao, ShippedDate là ngày giao thực tế
SELECT[OrderID],[RequiredDate],[ShippedDate]
FROM Orders
WHERE[ShippedDate]>[RequiredDate];
SELECT COUNT (*)AS [ LADED]
FROM Orders
WHERE[ShippedDate]>[RequiredDate];
-- Lấy all order details has discount over 10%
SELECT*
FROM [Order Details]
WHERE[Discount]>0.1;
--all orders has been shipped beyond France
select*
from Orders
where [ShipCountry]<>'France';
-- all products in stock over 20
select*
from Products
where [UnitsInStock]>20

-- and, or, not


-- all các unitsInStock khoảng nhỏ hơn 50 hoặc lớn hơn 100
select[UnitsInStock],[ProductName]
from Products
where [UnitsInStock]<50 OR [unitsinstock]>100;
-- all orders from brazil which be lated
select*
from Orders
where [ShipCountry]='brazil'and[ShippedDate]>[RequiredDate];
-- all products have price under 100$ and productid is not 1
select *
from Products
where not ([CategoryID]=1 or [UnitPrice]>=100);
-- all orders have freight in[50,100]$
select*
from Orders
where Freight>50 and Freight<100;
--all products which unitsinstock>20 and unitsonorder <20
select*
from Products
where not( [UnitsInStock]>20 or [UnitsOnOrder]<20);


--Toán tử Between bao gồm giá trị bắt đầu và kết thúc, giá trị là số, vb, or ngày tháng


-- all products which have prices from 10 to 20 dollars
select*
from Products
where [UnitPrice] between 10 and 20;
--all orders have been ordered between 1996/7/1 to 1996/7/31
select*
from Orders
where [OrderDate] between '1996-07-01' and '1996-07-31';
-- sum all freight of orders table between 1996/07/01 to 1996/07/31
select sum([Freight])as [ totaljulyfreight]
from Orders
where [OrderDate] between '1996-07-01' and '1996-07-31';
--orders have been ordered between 1/1/1997 to 31/12/1997 and shipped via ship (shipvia=3)
select*
from Orders
where [ShipVia]=3 and
      [OrderDate]between '1997-1-1' and '1997-12-31';



--Toán tử Like-lọc dữ liệu trong chuối


--lọc all customers from country with begin word A
select*
from Customers
where [Country] like'A%';
-- list orders have been ship to city that has word a
select*
from Orders
where [ShipCity] like '%a%';
-- lọc all orders với đk shipcountry like'U_' và ShipCountry LIKE'U%'
select*
from Orders
where[ShipCountry]like 'U_';
select*
from Orders
where[ShipCountry]like 'U%';
-- lấy all suppilers with companyname contain word b
select*
from Suppliers
where [CompanyName]like'%b%';
-- lấy all customer that contactname is start word H và có chữ thứ 2 là bất ký ký tự nào và hơn 2 ký tự
select*
from Customers
where [ContactName]like'H_%';
-- lấy all orders dc gửi đến city begin chữ L, chữ thứ 2 U hoặc O
select*
from Orders
where [ShipCity]like'l[u,o]%';
-- lấy all orders dc gửi đến city begin chữ L, chữ thứ 2 ko la U hoặc O
select*
from Orders
where [ShipCity]like'l[^uo]%';
--lấy all orders dc gửi đến city begin chữ L, chữ thứ 2 từ a đến u
select[ShipCity]
from Orders
where [ShipCity]like'l[a-u]%';
-- lấy all suppilers with companyname bắt đầu bằng chữ a và ko chứa ký tự b
select*
from Suppliers
where [CompanyName]like'a%[^b]%';

-- giá trị không tồn tại IS NULL, IS NOT NULL


--đếm all orders chưa đc giao hàng
select count(*)
from Orders
where [ShippedDate]is null;
--lấy list customers có khu vực ko bị NULL
select*
from Customers
where [Region] is not null;
-- lấy list customers have no company name
select*
from Customers
where CompanyName is null;
-- lấy đơn hàng chưa dc giao hàng và có shipregion ko bị null
select*
from Orders
where [ShippedDate] is null and [ShipRegion] is not null;