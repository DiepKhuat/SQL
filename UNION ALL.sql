--truy vấn đệ quy  dùng khi muốn xem mối quan hệ giữa các bên thường khi có bảng tree


-- truy vấn đệ quy với bái toàn tính dãy số fibo Sn=S(n-1)+S(n-2)

with fibo (prev_n,n) as (
   -- khởi tạo
   select 0 as prev_n,
          1 as n
union all
 -- đệ quy
 select n as prev_n,
       prev_n +n as n
 from fibo
 )
 select * from fibo
 option (maxrecursion 5);  -- lấy max 5 dòng

 -- truy vấn đệ quy với bải toán giai thừa Sn=n*S(n-1)
 with giaithua (stt,giaithua) as (
   -- khởi tạo
   select 1 as stt,
          1 as giaithua
union all
 -- đệ quy
 select (stt+1) as stt,
       (stt+1)*giaithua as giaithua
 from giaithua
 )
 select * from giaithua
 option (maxrecursion 5);  -- lấy max 5 dòng


 -- truy vấn đệ quy từ bảng employee, cột report lọc tt giữa nhân viên và ng nhận báo cáo
 declare @employeeid int
 set @employeeid=2;  -- set ng có level 2 là ceo

  with e_cte as (
   -- khởi tạo
   select e.EmployeeID, e.LastName +' '+e.FirstName as Name,-- cách ghép nội dung 2 or nh cột vs nhau
          e.ReportsTo as ManagerID,
		  0 as Level
   from [dbo].[Employees] e
   where e.employeeid=2

union all
 -- đệ quy
   select e1.EmployeeID, e1.LastName +' '+e1.FirstName as Name,
          e1.ReportsTo as ManagerID,
		  Level+1 as Level
   from [dbo].[Employees] e1
   join e_cte on e1.reportsto=e_cte.employeeid
 )
 select * from e_cte
 option (maxrecursion 5); 
