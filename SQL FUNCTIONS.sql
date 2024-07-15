-- tìm min của các sp unitprice bảng products
SELECT MIN UnitPrice AS MINPRICE
FROM Products;
-- NGÀY ĐẶT HÀNG GẦN ĐÂY NHẤT TỪ BẢNG ORDERS
SELECT MAX(ORDERDATE) AS MAXORDERDATE
FROM Orders;
-- lấy max unitinstock OF products
select MAX(UNITSINSTOCK) AS MAXUNITSINSTOCK
from Products;
SELECT MIN ([BIRTHDATE]) AS "LỚN TUỔI NHẤT"
FROM [dbo].[Employees];
SELECT MIN([UNITSONORDER])
FROM Products;
-- Đếm số lượng khách hàng trong bảng customers
SELECT COUNT([CustomerID]) AS [NUMBER OF CUSTOMERS]
FROM Customers;
-- tổng số tiền vận chuyển (freight) của đơn hàng orders
SELECT SUM([FREIGHT]) 
FROM Orders;
-- trung bình quanity trong order details
SELECT AVG([QUANTITY])
FROM [Order Details];

-- COUNT AND SUM PRODUCTS IN STOCK, AVG PRICE ALL PRODUCTS
SELECT COUNT(*) AS [NUMBER OF PRODUCTS], SUM([UNITSINSTOCK]) AS [TOTAL UNITS IN STOCK], AVG([UnitPrice]) AS [AVG UNIT PRICE]
FROM Products;

SELECT AVG([UNITPRICE]), SUM([Quantity])
FROM DBO.[ORDER DETAILS];
