sqlq "INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) 
VALUES ('STUD3', 'Student Company', 'Mary Lebens', 'USA');"
sqlq "SELECT CustomerID, CompanyName FROM Customers WHERE CustomerID = 'STUDE';"
sqlq "INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, ShipCountry) 
VALUES ('STUDE', 1, GETDATE(), 'USA');"
sqlq "SELECT TOP 1 OrderID FROM Orders WHERE CustomerID = 'STUDE' ORDER BY OrderID DESC;"
sqlq "UPDATE Customers SET ContactName = 'New Contact Name' WHERE CustomerID = 'STUDE';"
sqlq "SELECT ContactName FROM Customers WHERE CustomerID = 'STUDE';"
sqlq "UPDATE Orders SET ShipCountry = 'New Country' WHERE CustomerID = 'STUDE';"
sqlq "SELECT ShipCountry FROM Orders WHERE CustomerID = 'STUDE';"
sqlq "DELETE FROM Orders WHERE CustomerID = 'STUDE';"
sqlq "SELECT OrderID, CustomerID FROM Orders WHERE CustomerID = 'STUDE';"
sqlq "DELETE FROM Customers WHERE CustomerID = 'STUDE';"
sqlq "SELECT CustomerID, CompanyName FROM Customers WHERE CustomerID = 'STUDE';"

splq "INSERT INTO Suppliers (CompanyName, ContactName, ContactTitle, Country)
VALUES ('Pop-up Foods', 'Your Name', 'Owner', 'Your Country');"
sqlq "SELECT * FROM Suppliers WHERE CompanyName = 'Pop-up Foods';"
sqlq "INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock)
VALUES ('House Special Pizza', (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Pop-up Foods'), 2, 15.99, 50);
"
sqlq "SELECT * FROM Products WHERE ProductName = 'House Special Pizza';"
sqlq "UPDATE Products"
sqlq "SET UnitPrice = 15.99"
sqlq "WHERE ProductName = 'House Special Pizza';"
sqlq "UPDATE Products"
sqlq "SET UnitsInStock = 25, UnitPrice = 17.99"
sqlq "WHERE ProductName = 'House Special Pizza';"
sqlq "DELETE FROM Products"
sqlq "WHERE ProductName = 'House Special Pizza';"

sqlq "INSERT INTO Products (ProductName, SupplierID, CategoryID, UnitPrice, UnitsInStock)
VALUES ('Veggie Delight Salad', (SELECT SupplierID FROM Suppliers WHERE CompanyName = 'Pop-up Foods'), 3, 9.99, 100);
"
sqlq "SELECT * FROM Products WHERE ProductName = 'Veggie Delight Salad';"
sqlq "UPDATE Products"
sqlq "SET UnitPrice = 10.99, UnitsInStock = 80"
sqlq "WHERE ProductName = 'Veggie Delight Salad';"
sqlq "SELECT * FROM Products WHERE ProductName = 'Veggie Delight Salad';"
sqlq "DELETE FROM Products"
sqlq "WHERE ProductName = 'Veggie Delight Salad';"
sqlq "SELECT * FROM Products WHERE ProductName = 'Veggie Delight Salad';"