USE POS;
GO
CREATE TABLE Users (
	username VARCHAR(50) PRIMARY KEY,
	password VARCHAR(200) NOT NULL,
);

CREATE TABLE Employee (
	EmployeeID INT NOT NULL,
	LastName NVARCHAR(10) NOT NULL,
	MiddleName NVARCHAR(20),
	FirstName NVARCHAR(10) NOT NULL,
	CCCD VARCHAR(12) NOT NULL,
	PhoneNo VARCHAR(10) NOT NULL,
	Email NVARCHAR(320) NOT NULL,
	Salary DECIMAL(6, 3) NOT NULL,
	SupervisorID INT,
	BranchID INT NOT NULL,

	CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),

	CONSTRAINT FK_SupervisorEmployee FOREIGN KEY (SupervisorID)
		REFERENCES Employee(EmployeeID) ON DELETE NO ACTION,

	CONSTRAINT UC_CCCD UNIQUE (CCCD),
);

CREATE TABLE Cashier (
	EmployeeID INT NOT NULL,
	TypingSpeed DECIMAL(5, 2),

	CONSTRAINT PK_Cashier PRIMARY KEY (EmployeeID),
	
	CONSTRAINT FK_CashierEmployee FOREIGN KEY (EmployeeID)
		REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
);


CREATE TABLE Manager (
	EmployeeID INT NOT NULL,
	Degree NVARCHAR(320) NOT NULL,
	BranchID INT NOT NULL,
	ManageStartDate DATE NOT NULL,
	CONSTRAINT PK_Manager PRIMARY KEY (EmployeeID),
	
	CONSTRAINT FK_ManagerEmployee FOREIGN KEY (EmployeeID)
		REFERENCES Employee(EmployeeID),
);

CREATE TABLE Shift (
	EmployeeID INT NOT NULL,
	ShiftTime INT NOT NULL,
	ShiftDay VARCHAR(2) NOT NULL,

	CONSTRAINT PK_WorkShift PRIMARY KEY (EmployeeID, ShiftTime, ShiftDay),
	
	CONSTRAINT FK_WorkShiftEmployee FOREIGN KEY (EmployeeID)
		REFERENCES Employee(EmployeeID) ON DELETE CASCADE,
);

CREATE TABLE Branch (
	BranchID INT NOT NULL,
	BranchAddress NVARCHAR(320) NOT NULL,

	CONSTRAINT PK_Branch PRIMARY KEY (BranchID),
);

ALTER TABLE Employee
ADD CONSTRAINT FK_EmployeeBranch FOREIGN KEY (BranchID)
	REFERENCES Branch(BranchID);

ALTER TABLE Manager 
ADD CONSTRAINT FK_ManagedBranch FOREIGN KEY (BranchID)
		REFERENCES Branch(BranchID);

CREATE TABLE BranchSchedules (
	BranchID INT NOT NULL,
	OpenDays NVARCHAR(100) NOT NULL,
	OpenTime TIME NOT NULL,
	CloseTime TIME NOT NULL,

	CONSTRAINT PK_BranchSchedule PRIMARY KEY (BranchID, OpenDays, OpenTime, CloseTime),

	CONSTRAINT FK_ScheduledBranch FOREIGN KEY (BranchID)
		REFERENCES Branch(BranchID),
);

CREATE TABLE Bill (
	BillID INT NOT NULL,
	OrderDate DATETIME NOT NULL,
	CashierID INT,

	CONSTRAINT PK_Bill PRIMARY KEY (BillID),
	
	CONSTRAINT FK_BillCashier FOREIGN KEY (CashierID)
		REFERENCES Cashier(EmployeeID) ON DELETE SET NULL,
);

CREATE TABLE Supplier (
	SupplierID INT NOT NULL,
	SupplierName NVARCHAR(100) NOT NULL,
	Email NVARCHAR(320) NOT NULL,
	ZipCode VARCHAR(5) NOT NULL,
	PhoneNo VARCHAR(20) NOT NULL,

	CONSTRAINT PK_Supplier PRIMARY KEY (SupplierID),
);

CREATE TABLE ProductType (
	ProductTypeID NVARCHAR(20) NOT NULL,
	ProductTypeName NVARCHAR(100) NOT NULL,
	SupplierID INT NOT NULL,
	StockQuantity INT NOT NULL,
	SalePrice DECIMAL(10, 3) NOT NULL,

	CONSTRAINT PK_ProductType PRIMARY KEY (ProductTypeID),

	CONSTRAINT FK_ProductTypeSupplier FOREIGN KEY (SupplierID)
		REFERENCES Supplier(SupplierID),
);

CREATE TABLE ProductLot (
	ProductLotID INT NOT NULL, 
	ProductTypeID NVARCHAR(20) NOT NULL, 
	QuantityInLot INT,
	ExpireDate DATE NOT NULL,

	CONSTRAINT PK_Product PRIMARY KEY (ProductLotID, ProductTypeID),

	CONSTRAINT FK_ProductType FOREIGN KEY (ProductTypeID)
		REFERENCES ProductType(ProductTypeID),
)

CREATE TABLE Bill_ProductLot (
	BillID INT NOT NULL,
	ProductTypeID NVARCHAR(20) NOT NULL,
	ProductLotID INT NOT NULL,
	QuantityInBill INT NOT NULL,
	SalePrice DECIMAL(10, 3) NOT NULL,

	CONSTRAINT PK_BillProductLotList PRIMARY KEY (BillID, ProductTypeID, ProductLotID),

	CONSTRAINT FK_ListBill FOREIGN KEY (BillID)
		REFERENCES Bill(BillID),

	CONSTRAINT FK_ListProductLot FOREIGN KEY (ProductLotID, ProductTypeID)
		REFERENCES ProductLot(ProductLotID, ProductTypeID),
)

CREATE TABLE Equipments (
	ProductLotID INT NOT NULL,
	ProductTypeID NVARCHAR(20) NOT NULL ,
	WarrantyPeriod INT NOT NULL,

	CONSTRAINT PK_Equipment PRIMARY KEY (ProductLotID, ProductTypeID),
	
	CONSTRAINT FK_EquipmentProduct FOREIGN KEY (ProductLotID,ProductTypeID)
		REFERENCES ProductLot(ProductLotID, ProductTypeID),

	CONSTRAINT FK_EquipmentProductType FOREIGN KEY (ProductTypeID)
		REFERENCES ProductType(ProductTypeID),
);

CREATE TABLE FreshFoods (
	ProductLotID INT NOT NULL,
	ProductTypeID NVARCHAR(20) NOT NULL, 
	ManufactureDate DATE NOT NULL,

	CONSTRAINT PK_FreshFoods PRIMARY KEY (ProductLotID, ProductTypeID),

	CONSTRAINT FK_FreshFoodProduct FOREIGN KEY (ProductLotID, ProductTypeID)
		REFERENCES ProductLot(ProductLotID, ProductTypeID),

	CONSTRAINT FK_FreshFoodProductType FOREIGN KEY (ProductTypeID)
		REFERENCES ProductType(ProductTypeID),
);

CREATE TABLE DryFoods (
	ProductLotID INT NOT NULL,
	ProductTypeID NVARCHAR(20) Not null, 
	ProductDescription NVARCHAR(500),
	ExpirationDate DATE NOT NULL,

	CONSTRAINT PK_DryFoods PRIMARY KEY (ProductLotID, ProductTypeID),

	CONSTRAINT FK_DryFoodProduct FOREIGN KEY (ProductLotID,ProductTypeID)
		REFERENCES ProductLot(ProductLotID, ProductTypeID),

	CONSTRAINT FK_DryFoodProductType FOREIGN KEY (ProductTypeID)
		REFERENCES ProductType(ProductTypeID),
);

CREATE TABLE Discount (
	ProductTypeID NVARCHAR(20) NOT NULL,
	DiscountID INT NOT NULL,
	DiscountDate DATETIME NOT NULL,
	Discount DECIMAL(5, 2) NOT NULL,

	CONSTRAINT PK_Discount PRIMARY KEY (ProductTypeID, DiscountID),
	
	CONSTRAINT FK_DiscountProduct FOREIGN KEY (ProductTypeID)
		REFERENCES ProductType(ProductTypeID),
);

CREATE TABLE ImportProduct (
	ProductTypeID NVARCHAR(20) NOT NULL,
	BranchID INT NOT NULL,

	CONSTRAINT PK_Purchase PRIMARY KEY (ProductTypeID,BranchID),

	CONSTRAINT FK_PurchaseProduct FOREIGN KEY (ProductTypeID)
		REFERENCES ProductType(ProductTypeID),

	CONSTRAINT FK_PurchaseBranch FOREIGN KEY (BranchID)
		REFERENCES Branch(BranchID),
);

CREATE TABLE ImportBatch (
	ProductTypeID NVARCHAR(20) NOT NULL,
	BranchID INT NOT NULL,
	ProductQuantity INT NOT NULL,
	BatchDate DATE NOT NULL,

	CONSTRAINT PK_ProductBatch PRIMARY KEY (
		ProductTypeID, BranchID, ProductQuantity, BatchDate
	),

	CONSTRAINT FK_BatchProductType_Branch FOREIGN KEY (ProductTypeID, BranchID)
		REFERENCES ImportProduct(ProductTypeID, BranchID),	
);

-- Constraint on employee's salary
ALTER TABLE Employee
ADD CONSTRAINT CHK_SalaryRange CHECK (Salary >= 5);


-- Constraint on available shift's time
ALTER TABLE [Shift]
ADD CONSTRAINT CHK_ShiftTimeRange CHECK (ShiftTime IN (1, 2, 3));

-- Constraint on Discount's discount rate (in %)
ALTER TABLE Discount
ADD CONSTRAINT CHK_DiscountRange CHECK (Discount >= 5 AND Discount <= 90);

-- Constraint on the number of each product type in a batch
ALTER TABLE ImportBatch
ADD CONSTRAINT CHK_BatchQuantityRange CHECK (ProductQuantity > 0 AND ProductQuantity <= 3000);

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
        RAISERROR('Total price for the Bill exceeds the limit of 20,000,000 vnd.', 16, 1)
        ROLLBACK TRANSACTION
    END
END
