-- Creat a new stored procedure that calculates the 
-- total amount for an order .
-- Our stored procedure accepts two parameters as input
-- Accepts the order ID and the total amount,
-- then return the updated total amount as output
CREATE OR ALTER PROCEDURE CalculateOrderTotal
    @OrderID INT,
    @TotalAmount MONEY OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

 -- Calculate the total amount for the given order.
    SELECT @TotalAmount = SUM(UnitPrice * Quantity * (1 - Discount))
    FROM [Order Details]
    WHERE OrderID = @OrderID;
    -- Check if the order exists - handle the error condition
    -- if the order ID doesn't match any items in the Order Details table
    IF @TotalAmount IS NULL 
    BEGIN
        SET @TotalAmount = 0;
        PRINT 'Order ' + CAST(@OrderID AS NVARCHAR(10)) + ' not found.';
        -- Exits the stored procedure
        RETURN;
    END
    -- Output the total amount for the order
    PRINT 'The total amount for Order ' + CAST(@OrderID AS NVARCHAR(10)) + ' is $' +
     CAST(@TotalAmount AS NVARCHAR(20));
END
-- Go causes the stored procedure to run after it's altered or created
GO

-- Tests the stored procedure with a valid order
-- First declare the variables 
DECLARE @OrderID INT = 10248;
DECLARE @TotalAmount MONEY;EXEC CalculateOrderTotal 
    @OrderID = @OrderID, 
    @TotalAmount = @TotalAmount OUTPUT;

PRINT 'Returned total amount: $' + CAST(@TotalAmount AS NVARCHAR(20));

-- Test with an invalid order
SET @OrderID = 99999;
SET @TotalAmount = NULL;

EXEC CalculateOrderTotal 
    @OrderID = @OrderID, 
    @TotalAmount = @TotalAmount OUTPUT;

PRINT 'Returned total amount: $' + CAST(ISNULL(@TotalAmount, 0) AS NVARCHAR(20));
GO


CREATE OR ALTER PROCEDURE CheckProductStock
    @ProductID INT,
    @NeedsReorder BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Initialize the output parameter
    SET @NeedsReorder = 0;  -- Default to no reorder needed

    -- Check the product stock levels
    IF EXISTS (SELECT 1 FROM Products WHERE ProductID = @ProductID)
    BEGIN
        DECLARE @UnitsInStock INT;
        DECLARE @ReorderLevel INT;

        -- Get the UnitsInStock and ReorderLevel for the specified ProductID
        SELECT @UnitsInStock = UnitsInStock, @ReorderLevel = ReorderLevel
        FROM Products
        WHERE ProductID = @ProductID;

        -- Determine if reorder is needed
        IF @UnitsInStock < @ReorderLevel
        BEGIN
            SET @NeedsReorder = 1;  -- Set to 1 if reorder is needed
        END
    END
    ELSE
    BEGIN
        -- If the product does not exist, you may want to handle this case
        PRINT 'Product not found.';
    END
END
GO

-- Test the new procedure
DECLARE @NeedsReorder BIT;
EXEC CheckProductStock 
    @ProductID = 11,
    @NeedsReorder = @NeedsReorder OUTPUT;
PRINT 'Needs Reorder: ' + CAST(@NeedsReorder AS VARCHAR(1));