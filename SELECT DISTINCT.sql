SELECT [ProductName],[QuantityPerUnit],[UnitPrice]
FROM [dbo].[Products];

SELECT[Country]
FROM[dbo].[Customers];

SELECT DISTINCT PostalCode
FROM Suppliers;

SELECT DISTINCT LastName, TitleOfCourtesy
FROM Employees;

SELECT DISTINCT ShipVia
FROM Orders;

SELECT TOP 5*
FROM Customers;

SELECT TOP 100 PERCENT *
FROM Employees;

--query distinct 5 columns customers id of orders tables
SELECT DISTINCT TOP 5 CustomerID
FROM Orders;
--query 3 frist columns distinct categoryID of products tables
SELECT DISTINCT TOP 3 CategoryID
from Products;
--query company name with alias c?ng ty and postalcode by m? b?u ?i?n of table customers 
SELECT [CompanyName] AS[T?N C?NG TY], PostalCode AS "M? B?U ?I?N", City "TH?NH PH?"
FROM Customers;

SELECT [LastName] AS HO, FirstName AS TEN
FROM Employees;

-- L?Y 15 d?ng ??u ti?n t?t c? c?c c?t trong b?ng Orders, ??t t?n thay th? cho b?ng orders l? O
SELECT TOP 15 O.*
FROM Orders AS O;
-- Vi?t 5 sp trong b?ng product thay th? b?ng p, c?c c?t productname- t?n s?n ph?m, supplierid- m? nh? cung c?p, categoryid- m? th? lo?i
SELECT TOP 5 p.ProductName AS "T?N S?N PH?M", p.SupplierID AS "M? NH? CUNG C?P", p.CategoryID AS "M? TH? LO?I"
FROM Products AS p
SELECT DISTINCT K.City
FROM Employees AS K;


--query to take all product name
SELECT[ProductName]
FROM[dbo].[Products];

--query product name, unite price, quantityperunit of products
SELECT[ProductName],[UnitPrice],[QuantityPerUnit]
FROM[dbo].[Products]; 

--query CompanyName, Country of customers
SELECT[CompanyName],[Country]
FROM[dbo].[Customers];

-- query contact name and phone of suppliers
SELECT ContactName,Phone
FROM dbo.Suppliers;
--query all colums of products
SELECT*
FROM dbo.Products;

-- query all colums of customers
SELECT*
FROM dbo. Customers;

SELECT*
FROM [dbo].Suppliers;

