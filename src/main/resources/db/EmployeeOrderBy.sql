CREATE PROCEDURE EmployeeInfor AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY EmployeeID ASC;
END
EXEC dbo.EmployeeInfor 
DROP PROCEDURE EmployeeInfor

/*
Sắp xếp theo EmployeeID
*/
CREATE PROCEDURE employeeID_ASC AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY EmployeeID ASC;
END
EXEC dbo.employeeID_ASC 
DROP PROCEDURE employeeID_ASC

CREATE PROCEDURE employeeID_DESC AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY EmployeeID DESC;
END
EXEC dbo.employeeID_DESC 
DROP PROCEDURE employeeID_DESC

/*
Sắp xếp theo BranchID
*/
CREATE PROCEDURE BranchID_ASC AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY BranchID ASC;
END
EXEC dbo.BranchID_ASC 
DROP PROCEDURE BranchID_ASC

CREATE PROCEDURE BranchID_DESC AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY BranchID DESC;
END
EXEC dbo.BranchID_DESC 
DROP PROCEDURE BranchID_DESC

/*
Sắp xếp theo SupervisorID
*/
CREATE PROCEDURE SupervisorID_ASC AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY SupervisorID ASC;
END
EXEC dbo.SupervisorID_ASC 
DROP PROCEDURE SupervisorID_ASC

CREATE PROCEDURE SupervisorID_DESC AS
BEGIN
	SELECT * FROM EMPLOYEE ORDER BY SupervisorID DESC;
END
EXEC dbo.SupervisorID_DESC 
DROP PROCEDURE SupervisorID_DESC

/*
Tìm employee theo EmployeeID
*/
CREATE PROCEDURE FindEmployeeByEmployeeID 
 @EmployeeID INT
AS
BEGIN
	SELECT *
	FROM EMPLOYEE
	WHERE EmployeeID = @EmployeeID
END

EXEC dbo.FindEmployeeByEmployeeID 
@EmployeeID = 1
DROP PROCEDURE FindEmployeeByEmployeeID

