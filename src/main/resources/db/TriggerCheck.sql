GO

-- Constraint on employee's salary
CREATE TRIGGER trg_SalaryCheck_Employee
ON Employee
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Salary < 5)
    BEGIN
        RAISERROR(N'Tiền lương phải ít nhất là 5 triệu.', 16, 1);
        ROLLBACK;
    END
END

GO

-- Constraint on available shift's time
CREATE TRIGGER trg_TimeCheck_Shift
ON Shift
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE ShiftTime NOT IN (1, 2, 3))
    BEGIN
        RAISERROR('Ca làm cần phải nhận giá trị 1 hoặc 2 hoăc 3.', 16, 1);
        ROLLBACK;
    END
END

GO

-- Constraint on Discount's discount rate (in %)
CREATE TRIGGER trg_RangeCheck_Discount
ON Discount
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE Discount < 5 OR Discount > 90)
    BEGIN
        RAISERROR('Tỉ lệ giảm giá phải từ 5% đến 90%.', 16, 1);
        ROLLBACK;
    END
END

GO

-- Constraint on the number of each product type in a batch
CREATE TRIGGER trg_QuantityCheck_ImportBatch
ON ImportBatch
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE ProductQuantity <= 0 OR ProductQuantity > 3000)
    BEGIN
        RAISERROR('Số lượng mỗi loại sản phẩm chỉ nằm từ 1 đến 3000 sản phẩm.', 16, 1);
        ROLLBACK;
    END
END

GO

-- Constraint on typing speed of a cashier
CREATE TRIGGER trg_Cashier_TypingSpeed_Check
ON Cashier
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE TypingSpeed <= 0 OR TypingSpeed > 10)
    BEGIN
        RAISERROR('Tốc độ đánh máy phải dương và không vượt quá 10 WPS.', 16, 1);
        ROLLBACK;
    END
END

GO

-- Constraint on order date of a bill
CREATE TRIGGER trg_Bill_OrderDate_Check
ON Bill
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE OrderDate > GETDATE())
    BEGIN
        RAISERROR('Thời gian đặt hàng của hóa đơn không thể nằm ở tương lai.', 16, 1);
        ROLLBACK;
    END
END

GO

-- Constraint on warranty period of equipment
CREATE TRIGGER trg_WarrantyPeriodCheck_Equipments
ON Equipments
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE WarrantyPeriod <= 0)
    BEGIN
        RAISERROR('Thời hạn bảo hành phải dương.', 16, 1);
        ROLLBACK;
    END
END