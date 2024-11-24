USE POS;
GO

/*
  Function GetExpiredLots retrieves expired product lots respect to a given date (usually today).

  Parameters:
    - @GivenDate: specified date for determining expiration of product lots.
  Return:
    - Return a table with ProductLotID, ProductTypeID, QuantityInLot, ExpireDate for product lots
	that have been expired.
	- If @GivenDate is null, return empty table.
*/
CREATE FUNCTION dbo.GetExpiredLots(@GivenDate DATE)
RETURNS @ExpiredLots TABLE (
	ProductLotID INT,
	ProductTypeID NVARCHAR(20),
	QuantityInLot INT,
	ExpireDate DATE
)
AS
BEGIN
	IF @GivenDate IS NULL
	BEGIN
		RETURN;
	END;

	DECLARE @ProductLotID INT;
    DECLARE @ProductTypeID NVARCHAR(20);
    DECLARE @QuantityInLot INT;
	DECLARE @ExpireDate DATE;

	-- Create a cursor for looping through ProductLot table
	DECLARE LotCursor CURSOR FOR
	SELECT ProductLotID, ProductTypeID, QuantityInLot, ExpireDate
	FROM ProductLot;

	OPEN LotCursor;
	FETCH NEXT FROM LotCursor INTO @ProductLotID, @ProductTypeID, @QuantityInLot, @ExpireDate;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Add product lot to the returned table if it is expired respect to GivenDate
		IF @ExpireDate < @GivenDate
		BEGIN
			INSERT INTO @ExpiredLots (ProductLotID, ProductTypeID, QuantityInLot, ExpireDate)
			VALUES (@ProductLotID, @ProductTypeID, @QuantityInLot, @ExpireDate);
		END;

		FETCH NEXT FROM LotCursor INTO @ProductLotID, @ProductTypeID, @QuantityInLot, @ExpireDate;
	END;

	-- Clean up cursor and return table
	CLOSE LotCursor;
	DEALLOCATE LotCursor;
	RETURN;
END;

GO

-- Example for GetExpiredLots: getting ProductLot with ID 4 in which there are expired product types before 2025-01-10
SELECT * FROM dbo.GetExpiredLots('2025-01-10')
WHERE ProductLotID = 4;

GO

/*
  Function CalcBillPrice retrieves the total price of a given bill.

  Parameters:
    - @BillID: the ID of an entry in Bill table.
  Return:
    - Return calculated total price of the specified bill.
	- If @BillID is not found, return null.
*/
CREATE FUNCTION dbo.CalcBillPrice(@BillID INT)
RETURNS DECIMAL(10, 3)
AS
BEGIN
	IF NOT EXISTS (
        SELECT 1 FROM Bill
        WHERE BillID = @BillID
    )
    BEGIN
        RETURN NULL;
    END;

	DECLARE @ProductTypeID NVARCHAR(20);
	DECLARE @ProductLotID INT;
	DECLARE @QuantityInBill INT;
	DECLARE @SalePrice DECIMAL(10, 3);

	-- Create price accumulator
	DECLARE @TotalPrice DECIMAL(10, 3) = 0;

	-- Create a cursor for looping through Bill_ProductLot table
	DECLARE BillCursor CURSOR FOR
	SELECT ProductTypeID, ProductLotID, QuantityInBill, SalePrice
	FROM Bill_ProductLot
	WHERE BillID = @BillID;

	OPEN BillCursor;
	FETCH NEXT FROM BillCursor
	INTO @ProductTypeID, @ProductLotID, @QuantityInBill, @SalePrice;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Add to total price if data entry is valid
		IF @QuantityInBill > 0 AND @SalePrice > 0
		BEGIN
			SET @TotalPrice = @TotalPrice + @QuantityInBill * @SalePrice;
		END;

		FETCH NEXT FROM BillCursor
		INTO @ProductTypeID, @ProductLotID, @QuantityInBill, @SalePrice;
	END;

	-- Clean up cursor and return accumulator
	CLOSE BillCursor;
	DEALLOCATE BillCursor;
	RETURN @TotalPrice;
END;

GO

-- Example for CalcBillPrice: getting table of total price for each bill
SELECT BillID, dbo.CalcBillPrice(BillID) AS TotalPrice
FROM Bill_ProductLot
GROUP BY BillID;

GO

CREATE PROCEDURE CallAllBill
AS
BEGIN
	SELECT *
	FROM Bill_ProductLot
END;

GO

EXEC dbo.CallAllBill

GO

/*
  Function GetMatchedEmployees retrieves a list of employees that at least one cell match MatchingString.

  Parameters:
    - @MatchingString: the given string to be matched.
  Return:
    - Return a table of employees who has at least one cell matches given string.
*/
CREATE FUNCTION dbo.GetMatchedEmployees(@MatchingString NVARCHAR(320))
RETURNS @MatchedEmployees TABLE (
	EmployeeID INT,
    LastName NVARCHAR(10),
    MiddleName NVARCHAR(20),
    FirstName NVARCHAR(10),
    CCCD VARCHAR(12),
    PhoneNo VARCHAR(10),
    Email NVARCHAR(320),
    Salary DECIMAL(6, 3),
    SupervisorID INT,
    BranchID INT
)
AS
BEGIN
	-- Ensure MatchingString is not null
	IF @MatchingString IS NULL
	BEGIN
		RETURN;
	END;

	-- Remove redundant spaces in MatchingString
	SET @MatchingString = LTRIM(RTRIM(@MatchingString));
	WHILE @MatchingString LIKE '%  %'
	BEGIN
		SET @MatchingString = REPLACE(@MatchingString, '  ', ' ');
	END;
	SET @MatchingString = LOWER(@MatchingString);

	-- Case 1: MatchingString contains no spaces
	--		   MatchingString is likely a single word, CCCD, PhoneNo or Email
	IF CHARINDEX(' ', @MatchingString) = 0
	BEGIN
		INSERT INTO @MatchedEmployees
		SELECT * FROM Employee
		WHERE LOWER(LastName) = @MatchingString OR
			LOWER(MiddleName) = @MatchingString OR
			LOWER(FirstName) = @MatchingString OR
			LOWER(CCCD) = @MatchingString OR
			LOWER(PhoneNo) = @MatchingString OR
			LOWER(Email) = @MatchingString OR
			-- Matching part of email
			(@MatchingString NOT LIKE '@' AND CHARINDEX(@MatchingString, LOWER(Email)) > 0);
		RETURN;
	END
	-- Case 2: MatchingString contains spaces as seperators
	--		   MatchingString is likely a complex name
	ELSE
	BEGIN
		INSERT INTO @MatchedEmployees
		SELECT * FROM Employee
		WHERE @MatchingString = ISNULL(LOWER(MiddleName), '') OR
			  @MatchingString = LOWER(LastName) + ' ' + ISNULL(LOWER(MiddleName), '') OR
			  @MatchingString = LOWER(LastName) + ' ' + LOWER(FirstName) OR
			  @MatchingString = ISNULL(LOWER(MiddleName), '') + ' ' + LOWER(FirstName) OR
			  @MatchingString = LOWER(LastName) + ' ' + ISNULL(LOWER(MiddleName), '') + ' ' + LOWER(FirstName);
		RETURN;
	END;
	
	RETURN;
END;

GO

-- Example for GetMatchedEmployee: getting employees
SElECT * FROM Employee;
SELECT * FROM dbo.GetMatchedEmployees(N'trần');
SELECT * FROM dbo.GetMatchedEmployees(N'trần thị');
SELECT * FROM dbo.GetMatchedEmployees(N' Trần');

GO

-- Function to get all entries in ProductLot table
CREATE FUNCTION dbo.FindAllProductLots()
RETURNS TABLE
AS
RETURN (
	SELECT * FROM ProductLot
);

GO

-- Example for FindAllProductLots
SELECT * FROM dbo.FindAllProductLots();