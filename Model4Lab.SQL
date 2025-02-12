--- Join customers and orders table because the customer ID is a field
--- in both tables (primary Key in customers and the foriegn key in orders)

select C.CompanyName,O.OrderDate FROM customers AS c 
JOIN Orders AS o on c.CustomerID = o.CustomerID;

--- Query to see all customers ( left table) and the orders (right table)
--- Uses a left join (order date and order id will be null if the customer exists but has no orders)
SELECT c.CustomerID,c.CompanyName, o.OrderID, o.OrderDate
FROM Customers c LEFT Join Oders o on c. customerID = o.customerID;
-- Example of using built-in functions SUM(), ROUND() and COUNT()
SELECT OrderID, ROUND(SUM(UnitPrice * Quantity * (1 - Discount)),2) AS TotalValue, COUNT(*) AS NumberOfItems 
FROM [Order Details] GROUP BY OrderID ORDER BY TotalValue DESC; /* Show the highest value first*/
--Example of using GROUP BY with a HAVING Clause
SELECT p.ProductID, p.ProductName, COUNT(od.OrderID) AS TimesOrdered 
FROM Products p INNER JOIN [Order Details] od ON p.ProductID = od.ProductID 
GROUP BY p.ProductID, p.ProductName 
HAVING COUNT(od.OrderID) > 10 
ORDER BY TimesOrdered DESC;
-- Subquery Example
SELECT ProductName, UnitPrice FROM Products 
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice;

-- This query we limit the results to the TOP 5 records
SELECT TOP 5 
c.CustomerID, c.CompanyName, 
ROUND(SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)), 2) AS TotalPurchase 
FROM Customers c 
INNER JOIN Orders o ON c.CustomerID = o.CustomerID 
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID 
WHERE YEAR(o.OrderDate) = 1997  
GROUP BY c.CustomerID, c.CompanyName 
ORDER BY TotalPurchase DESC;


SELECT TOP 10
    o.CustomerID,
    ROUND(SUM(od.Quantity * od.UnitPrice), 2) AS TotalRevenue,
    COUNT(o.OrderID) AS NumberOfOrders
FROM 
    Orders o
JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
WHERE 
    YEAR(o.OrderDate) = 1997
GROUP BY 
    o.CustomerID
ORDER BY 
    TotalRevenue DESC;