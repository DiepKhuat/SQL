
-- ORDER BY ASCENDING COMPANYNAME FROM A-Z  OF TABLE SUPPILERS 
SELECT *
FROM Suppliers
ORDER BY [CompanyName] ASC;
-- ORDER BY DESCENDING ALL PRODUCTS  GIA GIAM DAN
SELECT*
FROM Products
ORDER BY [UnitPrice] DESC;
-- ORDERBY  THEO Thứ tự họ và tên đệm a-z, KO DUNG ASC/ DESC
SELECT*
FROM Employees
ORDER BY [LastName] ASC,[FirstName]ASC;
-- Lấy 1 sp có số lượng bán cao nhất từ bẳng order details, ko dùng max
SELECT TOP 1*
FROM [Order Details]
ORDER BY [Quantity] DESC;
SELECT TOP 1[QUANTITY]
FROM [Order Details]
ORDER BY [Quantity] DESC;
-- ORDERBY DESCENDING ALL ORDERID FOLLOW TO ORDERDATE
SELECT[OrderID]
FROM[Orders]
ORDER BY[OrderDate] DESC;
-- liệt kê productname, quantityperunit,unitsinstock of all products theo thứ tự giảm dần của unitsinstock
SELECT[PRODUCTNAME],[QuantityPerUnit],[UnitsInStock]
FROM [dbo].[Products]
ORDER BY[UnitsInStock] DESC;

--tính slg unitsinstock sau khi bán hết các sp đã đặt hàng unitsonorder StockRemaining =UnitsInStock - UnitsOnOrder
SELECT[ProductID],[ProductName],[UnitsInStock],[UnitsOnOrder],
      ([UnitsInStock]-[UnitsOnOrder])AS [StockRemaining]
FROM[dbo].[Products];

-- Tính giá trị đơn hàng chi tiết cho all pr trong OrderDeatails   OrderDetailValue = UnitPrice x Quantity
SELECT*,
([UnitPrice]*[Quantity]) AS ORDERDETAILVALUE
FROM [dbo].[Order Details];

--Tính tỷ lệ giá vc đơn đặt hàng avg của freight so với max freight trong table order  FreightRatio=AVG(freight)/MAX(Freight)
SELECT
AVG([FREIGHT])/MAX([FREIGHT])AS FREIGHTRATIO
FROM[Orders];
-- Liệt kê all pro và unitprice của từng sp SAU KHI dc giảm 10%. c1 dùng phép nhân và chia. c2 chỉ dùng nhân
SELECT[ProductName],[ProductID],
([UnitPrice]/100*90) AS PRICEDISCOUNTED
FROM [Products];

SELECT[ProductName],[ProductID],
([UnitPrice]*0.9) AS [SALE10%]
FROM[Products];