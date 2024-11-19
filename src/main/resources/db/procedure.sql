--Câu số 1
/*
Yêu cầu: 2 bảng trở lên, có where, order by. Tham số đầu vào sẽ nằm trong mệnh đề where or having.
Mô tả: Hiển thị thông tin Họ và tên, Số điện thoại, Lương, ID chi nhánh của nhân viên làm việc tại
		chi nhánh có Địa chỉ là biến đầu vào của thủ tục, và kết quả trả về được sắp xếp theo
		chiều tăng dần của lương. Nếu địa chỉ không hợp lệ, trả về "Không tìm thấy chi nhánh có địa chỉ : biến đầu
		vào". Nếu không có nhân viên nào ở chi nhánh đó thỏa mãn điều kiện thì trả về "Không tìm thấy nhân viên nào thỏa mãn".
*/
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


--Câu số 2
/*
Yêu cầu: 2 bảng trở lên, có hàm(MIN, MAX, SUM, AVG,...), group by, having, order by, where. Tham số đầu vào sẽ nằm trong mệnh đề where or having.
Mô tả: Hiển thị thông tin: ID chi nhánh, Ngày nhập, Tên loại sản phẩm, Tổng số lượng, Tổng tiền nhập của các đợt 
		nhập sản phẩm từ nhà cung cấp với tên là tham số đầu vào. Ngoài ra, ta còn có một tham số đầu vào khác là
		số tiền tối đa để kiểm tra đợt nhập ở mỗi chi nhánh có số tiền vượt quá cho phép. Sắp xếp theo chiều tăng dần của ID 
		chi nhánh kết quả trả về.
*/

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
