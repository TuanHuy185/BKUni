GO

-- Constraint on total price of an Bill (trigger when Product changes)
CREATE TRIGGER trg_CheckBillTotalPrice_Bill
ON Bill
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @BillID INT;
    DECLARE @TotalPrice DECIMAL(10, 3);

    -- Get the BillID from the inserted or updated data
    SELECT @BillID = BillID FROM inserted;

    -- Calculate the total price for this Bill
   SELECT @TotalPrice = SUM(bp.SalePrice * bp.QuantityInBill)
   FROM Bill_ProductLot AS bp
   WHERE BillID = @BillID;

    -- If the total price exceeds the limit 20,000,000 vnd, raise an error
    IF @TotalPrice > 20000
    BEGIN
        RAISERROR('Tổng giá tiền của hóa đơn không thể vượt quá 20 triệu đồng.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;

GO

-- kiểm tra số ca làm tối đa 
CREATE TRIGGER CheckShift
ON Shift
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @sumofshift INT;
	DECLARE @manv INT;
	SELECT @manv = EmployeeID
	FROM inserted;
	SELECT @sumofshift = COUNT(EmployeeID)
	FROM Shift
	WHERE @manv = EmployeeID;

	IF @sumofshift > 8
	BEGIN
		RAISERROR('Nhân viên làm việc quá 8 ca một tuần', 16, 2);
		ROLLBACK TRANSACTION;
	END;
END;

GO

-- kiểm tra số ca làm tối thiếu của nhân viên 
CREATE TRIGGER CheckshiftMin 
ON Shift
FOR DELETE
AS
BEGIN
	DECLARE @manv INT;
	DECLARE @sumofshift INT;
	SELECT @manv = EmployeeID
	FROM deleted;
	SELECT @sumofshift = COUNT(EmployeeID)
	FROM Shift
	WHERE @manv = EmployeeID;

	iF @sumofshift < 4
	BEGIN
		RAISERROR('Nhân viên làm việc không đủ 4 ca một tuần', 16, 2); 
	END;
END;

GO

-- tự động cập nhật số lượng hàng tồn sau mỗi lần xuất hóa đơn 
CREATE TRIGGER Soluongton 
ON Bill_ProductLot 
AFTER INSERT
AS
BEGIN 
	DECLARE @malo INT;
	DECLARE @maloaisp NVARCHAR(20);
	DECLARE @sluongban INT;

	SELECT @sluongban = QuantityInBill FROM inserted; --  số lượng sản phẩm bán từ bill vừa được insert
	SELECT @malo =  ProductLotID FROM inserted;	-- mã lô được bán
	SELECT @maloaisp = ProductTypeID FROM inserted; -- mã loại sp được bán

	UPDATE ProductLot 	-- cập nhật số sản phẩm tồn ở bảng lô sp
	SET QuantityinLot = quantityinlot - @sluongban
	WHERE ProductLotID = @malo and ProductTypeID = @maloaisp;

	UPDATE ProductType -- cập nhật số sản phẩm tồn ở bảng loại sp 
	SET Stockquantity = stockquantity - @sluongban 
	WHERE ProductTypeID = @maloaisp;
END;

GO

-- Kiem tra trigger
DELETE FROM Shift 
WHERE EmployeeID = 2 AND ShiftTime = 3; 
INSERT INTO Shift VALUES (1,2,6);
INSERT INTO Bill  VALUES (7, '2023-02-02 12:00:00', 35);
DELETE FROM bill WHERE BillID = 7;
INSERT INTO Bill_ProductLot (BillID, ProductLotID, ProductTypeID, QuantityInBill, SalePrice)
VALUES
	(7, 2, 'VNM001', 3, 49.500);
DELETE FROM Bill_ProductLot WHERE BillID = 7;

GO

-- Constraint on the number of supervisors per shift
CREATE TRIGGER trg_CheckShiftSupervisor_Shift
ON Shift
AFTER DELETE
AS
BEGIN
    DECLARE @ShiftTime INT;
    DECLARE @ShiftDay VARCHAR(2);

    -- Create cursor to loop through information of deleted shift
    DECLARE ShiftCursor CURSOR FOR
    SELECT DISTINCT ShiftTime, ShiftDay FROM deleted;
    OPEN ShiftCursor;
    FETCH NEXT FROM ShiftCursor INTO @ShiftTime, @ShiftDay;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        IF NOT EXISTS (
            SELECT 1 FROM Shift sh INNER JOIN Employee em
			ON sh.EmployeeID = em.EmployeeID
            WHERE sh.ShiftTime = @ShiftTime
              AND sh.ShiftDay = @ShiftDay
              AND em.SupervisorID IS NOT NULL
        )
        BEGIN
            RAISERROR('Mỗi ca làm cần ít nhất một nhân viên giám sát. Vui lòng chọn nhân viên giám sát khác trước khi xóa ca làm này.', 16, 1);
            ROLLBACK;
            RETURN;
        END;

        FETCH NEXT FROM ShiftCursor INTO @ShiftTime, @ShiftDay;
    END;

	-- Clean up cursor
    CLOSE ShiftCursor;
    DEALLOCATE ShiftCursor;
END;

GO

-- Constraint on day interval between each batch of the same product type
CREATE TRIGGER trg_CheckBatchDateInterval_ImportBatch
ON ImportBatch
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @ProductTypeID NVARCHAR(20);
	DECLARE @BranchID INT;
    DECLARE @BatchDate DATE;

    -- Create cursor to loop through information of inserted batches
    DECLARE BatchCursor CURSOR FOR
    SELECT ProductTypeID, BranchID, BatchDate FROM inserted;
    OPEN BatchCursor;
    FETCH NEXT FROM BatchCursor INTO @ProductTypeID, @BranchID, @BatchDate;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Get the most recent batch date of this product type
        DECLARE @LatestBatchDate DATE;
        SELECT @LatestBatchDate = MAX(BatchDate) FROM ImportBatch
        WHERE ProductTypeID = @ProductTypeID
		  AND BranchID = @BranchID
		  AND BatchDate < @BatchDate;

		-- Check the constrain if this latest batch date does exist
        IF @LatestBatchDate IS NOT NULL
        BEGIN
            IF DATEDIFF(DAY, @LatestBatchDate, @BatchDate) > 7
            BEGIN
                RAISERROR('Đợt nhập hàng của cùng một loại sản phẩm không thể cách quá 7 ngày so với đợt nhập trước đó.', 16, 1);
                ROLLBACK;
                RETURN;
            END;
        END;

        FETCH NEXT FROM BatchCursor INTO @ProductTypeID, @BranchID, @BatchDate;
    END;

    CLOSE BatchCursor;
    DEALLOCATE BatchCursor;
END;