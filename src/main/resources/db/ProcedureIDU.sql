/*select * from branch
select * 
from employee
select * 
from manager

*/

GO

-- thủ tục thêm nhân viên mới 
create proc insertemp 
	@manv INT ,
	@ho NVARCHAR(10) ,
	@tenlot NVARCHAR(20),
	@ten NVARCHAR(10) ,
	@cccd VARCHAR(13) ,
	@sdt VARCHAR(10) ,
	@email NVARCHAR(320) ,
	@luongnv DECIMAL(6, 3) ,
	@nguoigiamsat INT,
	@machinhanh INT
 as 
begin
	declare @luongql decimal(6,3); 
	select @luongql = salary from employee e join manager m on e.employeeID = m.employeeID
	where @machinhanh = m.branchID; 
	if exists (select * from employee where @cccd = CCCD or @manv = employeeID) -- kiểm tra nv đã tồn tại chưa
	begin 
		raiserror('Nhân viên đã tồn tại',16,1 ) ;
		return; 
	end
	if not exists ( select * from Branch where branchID = @machinhanh) -- kiểm tra chi nhánh tồn tại chưa 
	begin 
		raiserror('Chi nhánh không tồn tại',16,1); 
		return; 
	end
	if not exists (select * from employee where employeeid = @nguoigiamsat) and (@nguoigiamsat is not null ) 
	begin 
		raiserror('Nhân viên giám sát không tồn tại',16,1);
		return; 
	end
	if( len(@cccd) != 12)    -- kiểm tra cccd có đủ 12 ký tự không 
	begin 
		raiserror('Căn cước công dân không hợp lệ',16,1); 
		return; 
	end
	if (@email not like '%@%' ) 
	begin 
		raiserror('Email không hợp lệ',16,1);
		return; 
	end
	if (@sdt not like '0%')  -- kiểm tra sdt có bắt đầu bằng 0 
	begin 
		raiserror('Số điện thoại không hợp lệ',16,1); 
		return; 
	end
	if(@luongnv >= @luongql)  -- kiểm tra lương nhân viên có ít hơn lương quản lí không 
	begin 
		raiserror('Lương nhân viên phải thấp hơn lương quản lí', 16,1);
		return; 
	end
 INSERT INTO Employee (EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID)
VALUES (@manv,@ho,@tenlot, @ten, @cccd,@sdt,@email,@luongnv,@nguoigiamsat,@machinhanh);
end;
---------------------
drop proc insertemp
---------------------
begin try 
	exec insertemp  120, 'Trương', 'Gia', 'Hân','079305102880', '0353215330', 'dhan@gmail.com', 100, null, 1
	print('Nhập thông tin thành công'); 
	end try 
begin catch 
	select 
	ERROR_MESSAGE() as Message,
	ERROR_LINE() as Line,
	ERROR_NUMBER() as Number, 
	ERROR_SEVERITY() as Severity, 
	ERROR_STATE() as State, 
	Error_procedure() as ErrorProcedure
end catch; 

-- thủ tục xóa nhân viên
create proc deleteemployee 
@manv int
as 
begin	
	if not exists (select * from employee where employeeid = @manv)
	begin 
		raiserror ('Nhân viên không tồn tại',16,1); 
		return;
	end 
	if exists ( select * from manager where @manv = employeeid) 
	begin 	
		raiserror ('Không thể xóa quản lí chi nhánh',16,1); 
		return 
	end 
	if exists ( select supervisorid from employee where supervisorid = @manv) 
	begin 
		update employee set supervisorID = null where SupervisorID = @manv;
	end; 
	delete from employee where employeeid = @manv; 
end;
-----------------------------
drop proc deleteemployee
---------------------------------------------------------
begin try 
	exec deleteemployee 44
	print ('Xóa nhân viên thành công')
end try 
begin catch 
	select 
	ERROR_LINE() as Line, 
	ERROR_MESSAGE() as Message, 
	ERROR_PROCEDURE() as ErrorProcedure
end catch
---------------------------------------------------------


--thủ tục update lương nhân viên
create proc updateSalary
@manv int, 
@luongnv decimal(6,3)
as 
begin 
	declare @machinhanh int; 
	select @machinhanh = branchID from employee where employeeID = @manv; 
	declare @maql int; 
	select @maql = EmployeeID from manager where BranchID=@machinhanh; 
	declare @luongql decimal(6,3); 
	select @luongql = salary from employee where EmployeeID = @maql; 
	if not exists (select * from employee where employeeid = @manv)
	begin 
		raiserror ('Nhân viên không tồn tại',16,1); 
		return;
	end	
	if ( @maql != @manv and @luongnv >= @luongql) 
	begin 
		raiserror('Lương nhân viên phải thấp hơn quản lí của họ',16,1); 
		return;
	end 
	update employee set salary = @luongnv where EmployeeID = @manv 
end; 
-------------------------
drop proc updatesalary
-------------------------
begin try 
	exec updatesalary 2, 30
	print('Cập nhật lương thành công')
end try 
begin catch 
	select 
	ERROR_LINE() as Line, 
	ERROR_MESSAGE() as Message, 
	ERROR_PROCEDURE() as ErrorProcedure
end catch;  

-- thủ tục update chi nhánh làm việc
create proc updateBranch 
@manv int, 
@machinhanh int
as
begin 
	if not exists (select * from employee where @manv = EmployeeID) 
	begin 
		raiserror('Nhân viên không tồn tại',16,1); 
		return; 
	end; 
	if not exists ( select * from branch where @machinhanh = branchid ) 
	begin 
		raiserror('Chi nhánh không tồn tại',16,1); 
		return; 
	end; 
	update employee set branchid = @machinhanh where employeeid = @manv;
end;
-----------------------------------------------------------------------
drop proc updatebranch 
------------------------------------------------------------------------
exec updatebranch 1,15
-------------------------------------------------------------------------
-- Thủ tục cập nhật email 
create proc updateEmail
@manv	int, 
@email	NVARCHAR(320)
as 
begin 
	if not exists (select * from employee where @manv = EmployeeID) 
	begin 
		raiserror('Nhân viên không tồn tại',16,1); 
		return; 
	end; 
	if (@email not like '%@%' ) 
	begin 
		raiserror('Email không hợp lệ',16,1);
		return; 
	end
	update Employee set email = @email where employeeid = @manv; 
end; 
------------------------------------------------
drop proc updateEmail 
----------------------------------------------
begin try 
	exec updateEmail 102,'dgh@gmail.com' 
	print('Cập nhật email thành công'); 
end try 
begin catch 
select 
	ERROR_LINE() as Line, 
	ERROR_MESSAGE() as Message, 
	ERROR_PROCEDURE() as ErrorProcedure
end catch

-- thủ tục cập nhật cccd 
create proc updateCCCD
@manv	int,
@cccd	varchar(13)
as
begin 
	if not exists (select * from employee where @manv = EmployeeID) 
	begin 
		raiserror('Nhân viên không tồn tại',16,1); 
		return; 
	end; 
	if (len(@cccd ) != 12) 
	begin 
		raiserror ('Căn cước công dân không hợp lệ',16,1) 
		return; 
	end
	update employee set cccd = @cccd where employeeid = @manv;
end; 

drop proc updateCCCD

exec updateCCCD 1,'24444'
--thủ tục update sdt 
create proc updatePhoneno
@manv	int, 
@sdt	varchar(10)
as 
begin 
	if not exists (select * from employee where @manv = EmployeeID) 
	begin 
		raiserror('Nhân viên không tồn tại',16,1); 
		return; 
	end; 
	if (@sdt not like '0%') 
	begin 
		raiserror ('Số điện thoại không hợp lệ',16,1);
		return ; 
	end
	update employee set phoneno = @sdt where employeeid = @manv; 
end ;
---------------------------------------------------
exec updatePhoneno 1,'023423421234'
---------------------------------------------------
--thủ tục update người giám sát 
create proc updateSupervisor 
@manv	int, 
@nguoigiamsat	int
as 
begin
	if not exists (select * from employee where @manv = EmployeeID) 
	begin 
		raiserror('Nhân viên không tồn tại',16,1); 
		return; 
	end; 
	if not exists (select * from employee where employeeid = @nguoigiamsat) and (@nguoigiamsat is not null ) 
	begin 
		raiserror('Nhân viên giám sát không tồn tại',16,1);
		return; 
	end
	if (@manv = @nguoigiamsat) 
	begin 
		raiserror('Nhân viên không thể là người giám sát của mình',16,1);
		return; 
	end
	update employee set supervisorid = @nguoigiamsat where employeeid = @manv
end
------------------------------------------
drop proc updateSupervisor
--------------------------------------------
exec updateSupervisor 1,12
-- thủ tục update tên nhân viên 
create proc updateName 
@manv	int, 
@ho		nvarchar(10) ,
@tenlot nvarchar(20) , 
@ten	nvarchar(10)
as 
begin 
	update employee set Lastname = @ho, Middlename = @tenlot, firstname = @ten where employeeid = @manv
end; 
------------------------------------------
drop proc updateName
--------------------------------------------
exec updateName 1,N'Nguyễn',N'Mỹ',N'Trang'


















-- thủ tục xóa chi nhánh 
create proc deletebranch 
 @machinhanh INT 
as 
begin 
	delete from branch where branchid = @machinhanh
end

begin try 
	exec deletebranch 1 
	print('Xóa dữ liệu thành công'); 
end try 
begin catch 
	select 
	ERROR_LINE() as Line, 
	ERROR_MESSAGE() as Message, 
	ERROR_PROCEDURE() as ErrorProcedure
end catch

--thủ tục thay đổi giờ làm và kiểm tra hợp lệ 
create proc updateshifttime
@manv  INT,
@giolam INT,
@ngaylam VARCHAR(2),
@giolammoi INT
as 
begin 
	if not exists( select * from employee where @manv = EmployeeID) 
	begin 
		raiserror('Nhân viên không tồn tại',16,1); 
	end 
	if not exists (select * from shift where @giolam = shifttime and @ngaylam = shiftday) 
	begin
		raiserror ('Ca làm không tồn tại',16,1);
	end 
	update shift set shifttime = @giolammoi 
	where @manv =employeeId and @giolam = shifttime and @ngaylam =shiftday;
end; 


begin try 
	exec updateshifttime 1,2,'8',2
	print('Đổi ca làm thành công'); 
end try
begin catch 
	select 
	ERROR_MESSAGE() as Message,
	ERROR_LINE() as Line,
	ERROR_NUMBER() as Number, 
	ERROR_SEVERITY() as Severity, 
	ERROR_STATE() as State, 
	Error_procedure() as ErrorProcedure
end catch; 

select * from shift where employeeid =1 

 