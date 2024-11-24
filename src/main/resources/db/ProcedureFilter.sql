
CREATE PROCEDURE FindEmployee
	@BranchID		int
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM Branch WHERE @BranchID = BranchID)
		BEGIN
			RAISERROR('Không tìm thấy chi nhánh có ID: %d', 16, 1, @BranchID);
			RETURN;
		END
	ELSE IF NOT EXISTS (SELECT * FROM Employee)
		BEGIN 
			RAISERROR('Không tìm thấy nhân viên nào thỏa mãn', 16, 1);
			RETURN;
		END
	ELSE 
		BEGIN
			SELECT EmployeeID, LastName, MiddleName, FirstName, CCCD, PhoneNo, Email, Salary, SupervisorID, Employee.BranchID
			FROM Employee, Branch
			WHERE @BranchID = Branch.BranchID AND Employee.BranchID = Branch.BranchID
			ORDER BY Salary ASC;
		END
END

EXEC dbo.FindEmployee
	@BranchID = 1;
DROP PROCEDURE FindEmployee


CREATE PROCEDURE ImportProductBatchAll
AS
BEGIN 
		SELECT B.BranchID, I.BatchDate, P.ProductTypeName, SUM(I.ProductQuantity) AS TotalQuantity, SUM(I.ProductQuantity * P.SalePrice) AS Total
		FROM Branch AS B, ImportBatch AS I, ProductType AS P, Supplier AS S
		WHERE B.BranchID = I.BranchID AND I.ProductTypeID = P.ProductTypeID AND P.SupplierID = S.SupplierID
		GROUP BY B.BranchID, BatchDate, ProductTypeName, ProductQuantity, ProductQuantity * SalePrice, SupplierName
		ORDER BY B.BranchID
END

EXEC dbo.ImportProductBatchAll


CREATE PROCEDURE ImportProductBatch
	@SupplierName		nvarchar(100),
	@MaxMoney			decimal(10, 3)
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM Supplier WHERE @SupplierName = SupplierName)
		BEGIN
			RAISERROR('Không tìm thấy nhà cung cấp: %s', 16, 1, @SupplierName);
			RETURN;
		END
	ELSE 
		BEGIN
			SELECT B.BranchID, I.BatchDate, P.ProductTypeName, SUM(I.ProductQuantity) AS TotalQuantity, SUM(I.ProductQuantity * P.SalePrice) AS Total
			FROM Branch AS B, ImportBatch AS I, ProductType AS P, Supplier AS S
			WHERE B.BranchID = I.BranchID AND I.ProductTypeID = P.ProductTypeID AND P.SupplierID = S.SupplierID AND SupplierName = @SupplierName
			GROUP BY B.BranchID, BatchDate, ProductTypeName, ProductQuantity, ProductQuantity * SalePrice, SupplierName
			HAVING SUM(I.ProductQuantity * P.SalePrice) > @MaxMoney 
			ORDER BY B.BranchID
		END
END

EXEC dbo.ImportProductBatch 
	@SupplierName = N'Công ty Sữa Vinamilk',
	@MaxMoney = 110.000;
DROP PROCEDURE ImportProductBatch

CREATE PROCEDURE ImportProductBatch
