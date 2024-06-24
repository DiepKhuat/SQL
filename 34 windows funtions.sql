--Ranking products according to price
select ProductID, ProductName, CategoryID, unitprice,
      rank () over (order by [unitprice] desc) as ranking
from Products;


--Ranking products according to category
select ProductID, ProductName, CategoryID, unitprice,
      rank () over (partition by [categoryid] -- phân vùng theo categoryid
	  order by [unitprice] desc) as ranking
from Products;

--Create table 
CREATE TABLE [sinh_vien] (
    [ma_sinh_vien] INT PRIMARY KEY,
    [ho_ten] NVARCHAR(255),
    [diem_trung_binh] DECIMAL(3, 2),
    [ma_lop_hoc] INT
); -- cách tạo bảng
INSERT INTO [sinh_vien] ([ma_sinh_vien], [ho_ten], [diem_trung_binh], [ma_lop_hoc])
VALUES
    (1, N'Nguyễn Văn A', 3.75, 101),
    (2, N'Trần Thị B', 3.88, 102),
    (3, N'Phạm Văn C', 3.75, 101),
    (4, N'Huỳnh Thị D', 3.92, 103),
    (5, N'Lê Văn E', 3.60, 102),
    (6, N'Ngô Thị F', 3.78, 101),
    (7, N'Trịnh Văn G', 3.65, 102),
    (8, N'Võ Thị H', 3.80, 103),
    (9, N'Đặng Văn I', 3.55, 101),
    (10, N'Hoàng Thị K', 3.95, 102),
    (11, N'Mai Thị L', 3.70, 103),
    (12, N'Lý Thị M', 3.62, 101),
    (13, N'Chu Thị N', 3.85, 102),
    (14, N'Đỗ Thị P', 3.58, 103),
    (15, N'Dương Văn Q', 3.72, 101),
    (16, N'Lâm Thị R', 3.85, 102),
    (17, N'Nguyễn Văn S', 3.68, 101),
    (18, N'Nguyễn Thị T', 3.75, 103),
    (19, N'Nguyễn Văn U', 3.93, 102),
    (20, N'Nguyễn Thị V', 3.67, 101);




--Ranking all of students based on averge of score desc
select [ma_sinh_vien],[ho_ten],[diem_trung_binh],[ma_lop_hoc],
      rank () over ( order by [diem_trung_binh] desc) as ranking
from [dbo].[sinh_vien];

--Ranking students based on classes
select [ma_sinh_vien],[ho_ten],[diem_trung_binh],[ma_lop_hoc],
      rank () over ( partition by [ma_lop_hoc] order by [diem_trung_binh] desc) as ranking
from [dbo].[sinh_vien];


--Ranking students based on classes and dense rank(nhay xep hang)
select [ma_sinh_vien],[ho_ten],[diem_trung_binh],[ma_lop_hoc],
      dense_rank () over ( partition by [ma_lop_hoc] order by [diem_trung_binh] desc) as ranking
from [dbo].[sinh_vien];

--Ranking students based on classes and dense rank, ko trung
select [ma_sinh_vien],[ho_ten],[diem_trung_binh],[ma_lop_hoc],
      row_number () over ( partition by [ma_lop_hoc] order by [diem_trung_binh] desc) as ranking
from [dbo].[sinh_vien];


-- sử dụng hàm lag() để lấy thông tin về đơn order
-- và datedorder của order trước đó. như kiểu cskh, xem tt đơn mà khách mua trc đó
select CustomerID, OrderDate, OrderID,
 lag(OrderDate) over (partition by customerid order by orderdate asc) as [previse orderdate]
from Orders
order by CustomerID, OrderDate;

--Total price for each year by each customer and ranking it by totalprice (by msyseft)
with cte as (
select (od.Quantity*od.UnitPrice-od.Discount) as totalprice, o.CustomerID, year(OrderDate) as years 
from [Order Details] od
join orders o on o.orderid=od.orderid)
 select CustomerID, years, sum(totalprice) as sales,
  dense_rank () over (partition by years order by sum(totalprice) desc ) as ranking
 from cte
 group by CustomerID, years;

 --cách khác siêu nhanh (bạn #) same quest
SELECT c.CustomerID, c.ContactName, YEAR(o.OrderDate) AS YearOrder, SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) AS [TotalAmount],
		RANK() OVER (PARTITION BY YEAR(o.OrderDate) ORDER BY SUM(od.Quantity*od.UnitPrice*(1-od.Discount)) DESC) AS Ranking
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID
				JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.ContactName, YEAR(o.OrderDate);

--cách groupby orderid
WITH OrderPayments AS (
	SELECT 
		OrderID
		, SUM(Quantity * UnitPrice) as TotalPayment
	FROM [Order Details]
	GROUP BY OrderID
)

SELECT 
	o.CustomerID
	, YEAR(o.OrderDate) as OrderedYear
	, SUM(op.TotalPayment) as TotalPayment
	, RANK() OVER (
		PARTITION BY YEAR(o.OrderDate)
		ORDER BY SUM(TotalPayment) DESC
	) AS Ranking
FROM Orders o 
JOIN OrderPayments op ON op.OrderID = o.OrderID
GROUP BY 
	o.CustomerID
	, YEAR(o.OrderDate)
