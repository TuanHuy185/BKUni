create proc callSupplier 
as 
begin 
	select * from supplier 
end; 
----------------------
exec callsupplier
-------------------------
drop proc callSupplier
---------------------
create proc callCashier 
as 
begin 
	select c.EmployeeId, Lastname,Middlename, Firstname, CCCD, PhoneNo, Email, Salary,SupervisorID, BranchID
	from employee e join cashier c on e.employeeid = c.employeeid
end; 
-------------------
exec callCashier
--------------------
drop proc callCashier
-------------------
create proc callManager 
as 
begin 
	select m.Employeeid,Lastname,Middlename, Firstname, CCCD, PhoneNo, Email, Salary, SupervisorID, m.BranchID
	from manager m join employee e on m.employeeid = e.employeeid
end ; 
------------------
drop proc callManager
--------------------
exec callManager
-------------------- 
create proc callSupervisor 
as 
begin 
	select Employeeid,Lastname,Middlename, Firstname, CCCD, PhoneNo, Email, Salary,SupervisorID, BranchID
	from employee 
	where employeeid in ( select supervisorid from employee) 
end 
--------------------
drop proc callSupervisor 
------------------------
exec callSupervisor 
------------------------
CREATE PROCEDURE callNormalEmployee
AS
BEGIN
	SELECT EmployeeID, LastName, MiddleName,FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, BranchID
	FROM Employee AS E
	WHERE 
			E.EmployeeID NOT IN (SELECT EmployeeID FROM Cashier) AND
			E.EmployeeID NOT IN (SELECT EmployeeID FROM Manager) AND
			NOT EXISTS (SELECT SupervisorID FROM Employee WHERE SupervisorID = E.EmployeeID)
END
----------------------
EXEC callNormalEmployee
-------------------------
DROP proc callNormalEmployee
