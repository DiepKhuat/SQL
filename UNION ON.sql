--CÂU LÊNH UNION KẾT HỢP CÁC KẾT QUẢ
--đưa ra các đơn có quantity bằng 10 hoặc 20 I 22rows
select OrderID
from [Order Details]
where unitprice between 100 and 200;

--II 433rows
select OrderID
from [Order Details]
where Quantity in (10,20);
 
--III 7 rows
select OrderID
from [Order Details]
where unitprice between 100 and 200 
and Quantity in (10,20);
--iv 448 rows
select OrderID
from [Order Details]
where (unitprice between 100 and 200)
or( Quantity in (10,20));

--V 360 rows
select distinct OrderID
from [Order Details]
where (unitprice between 100 and 200)
or( Quantity in (10,20));
--V=I or II dùng câu lệnh union
select OrderID from [Order Details] where unitprice between 100 and 200
union
select OrderID from [Order Details] where Quantity in (10,20);
--IV(ko có disticnt)= I or II dùng câu lệnh union all = 448 +7 =455 rows
select OrderID from [Order Details] where unitprice between 100 and 200
union all
select OrderID from [Order Details] where Quantity in (10,20);

--tạo countries dictionary trong 2 bảng supppliers, customers theo lệnh union và union all
select Country from Customers
union
select country from Suppliers;

select Country from Customers
union all
select country from Suppliers;
--tạo list city và country trong đó nhà cc từ london hoặc khhang từ nc bắt đầu chữ u hoặc ship đến nước usa
select City, Country from Customers where Country like 'U%'
union
select City,Country from Suppliers where City='london'
union
select ShipCity,ShipCountry from Orders where ShipCountry='usa';

select count(city), count(distinct city),
      count(city)-count(distinct city) as difference
from Employees;
