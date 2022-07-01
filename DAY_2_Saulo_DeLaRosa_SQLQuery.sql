USE AdventureWorks2019;

--1.
SELECT COUNT(ProductID) AS [number of products in table]
FROM Production.Product

--2.
SELECT COUNT(ProductID) AS [number of products in subcat]
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

--3.
SELECT ProductSubcategoryID, COUNT(ProductID) AS [CountedProducts]
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
GROUP BY ProductSubcategoryID

--4.
SELECT COUNT(ProductID) AS [num without subcat]
FROM Production.Product
WHERE ProductSubcategoryID IS NULL;

--5.
SELECT SUM(Quantity) AS [total quantity of all prudcts]
FROM Production.ProductInventory;

--6.
SELECT ProductID, SUM(Quantity) AS [TheSum]
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING  SUM(Quantity) < 100

--7.
SELECT Shelf, ProductID, SUM(Quantity) AS [TheSum]
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf, ProductID
HAVING  SUM(Quantity) < 100

--8.
SELECT  AVG(Quantity) AS [Average quantity]
FROM Production.ProductInventory
WHERE LocationID = 10


--9.
SELECT ProductID, Shelf, AVG(Quantity) AS [TheAvg]
FROM Production.ProductInventory
GROUP BY Shelf, ProductID
ORDER BY Shelf ASC

--10.
SELECT ProductID, Shelf, AVG(Quantity) AS [TheAvg]
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY Shelf, ProductID
ORDER BY Shelf ASC

--11.
SELECT Color, Class, COUNT(ProductID) AS [TheCount], AVG(StandardCost) AS [TheAvg]
FROM Production.Product
WHERE (Color IS NOT NULL) AND (Class IS NOT NULL)
GROUP BY Color, Class

--12.
SELECT c.name AS [Country], s.name AS [Province]
FROM Person.CountryRegion AS c
JOIN Person.StateProvince AS s ON c.CountryRegionCode = s.CountryRegionCode

--13.
SELECT c.name AS [Country], s.name AS [Province]
FROM Person.CountryRegion AS c
JOIN Person.StateProvince AS s ON c.CountryRegionCode = s.CountryRegionCode
WHERE (c.name = 'Germany') OR c.name = 'Canada'

--Using Northwnd Database

USE Northwind

--14.
SELECT p.ProductName, SUM(od.Quantity) AS [Number sold in past 25 years.]
FROM dbo.Products AS p
JOIN dbo.[Order Details] AS od ON p.ProductID = od.ProductID
JOIN dbo.Orders AS o ON od.OrderID = o.OrderID
WHERE (o.ShipPostalCode IS NOT NULL) AND (DATEDIFF(year, o.OrderDate, GETDATE())< 25)
GROUP BY p.ProductName
ORDER BY SUM(od.Quantity) DESC

--15.
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) AS [Number sold]
FROM dbo.[Order Details] AS od
JOIN dbo.Orders AS o ON od.OrderID = o.OrderID
WHERE o.ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER BY SUM(od.Quantity) DESC

--16.
SELECT TOP 5 o.ShipPostalCode, SUM(od.Quantity) AS [Number sold]
FROM dbo.[Order Details] AS od
JOIN dbo.Orders AS o ON od.OrderID = o.OrderID
WHERE (o.ShipPostalCode IS NOT NULL) AND (DATEDIFF(year, o.OrderDate, GETDATE())< 25)
GROUP BY o.ShipPostalCode
ORDER BY SUM(od.Quantity) DESC

--17.
SELECT City, COUNT(CustomerID)
FROM customers
WHERE City IS  NOT NULL
GROUP BY City 
ORDER BY 2 DESC;

--18.
SELECT City, COUNT(CustomerID)
FROM customers
WHERE City IS  NOT NULL
GROUP BY City 
HAVING COUNT(CustomerID) > 2
ORDER BY 2 DESC;

--19.
SELECT ContactName, o.OrderDate 
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
WHERE OrderDate > '01.01.1998 00:00:00'

--20.
SELECT ContactName, o.OrderDate 
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
ORDER BY OrderDate DESC

--21.
SELECT ContactName, SUM(od.Quantity) AS [total products bought]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS [od] ON o.OrderID = od.OrderID
GROUP BY ContactName
ORDER BY SUM(od.Quantity) DESC

--22.
SELECT c.CustomerID, SUM(od.Quantity) AS [total products bought]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS [od] ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING  SUM(od.Quantity) > 100
ORDER BY SUM(od.Quantity) DESC

--23.
SELECT s.CompanyName, ship.CompanyName
FROM Products AS [p]
JOIN Suppliers AS [s] ON p.SupplierID = s.SupplierID
JOIN [Order Details] AS [od] ON p.ProductID = od.ProductID
JOIN Orders AS [o] ON od.OrderID = o.OrderID
CROSS JOIN Shippers as [Ship]

--24.
SELECT p.ProductName, o.OrderDate
FROM Products AS [p]
JOIN [Order Details] AS [od] ON p.ProductID = od.ProductID
JOIN Orders AS [o] ON od.OrderID = o.OrderID

--25.
SELECT E1.FirstName + E1.LastName [EmployeeName 1], E2.FirstName + E2.LastName [EmployeeName 2]
FROM Employees [E1]
JOIN Employees as [E2] ON E1.Title = E2.Title 
WHERE (E1.FirstName + E1.LastName != E2.FirstName + E2.LastName)

--26.
SELECT E1.FirstName +' ' + E1.LastName AS [employee name], Count(E1.EmployeeID) [number of employees reporting to them]
FROM Employees AS [E1]
LEFT JOIN Employees AS [E2] ON E1.EmployeeID = E2.ReportsTo
GROUP BY E1.FirstName +' ' + E1.LastName
HAVING Count(E1.EmployeeID) > 2

--27.
SELECT
CASE 
	WHEN c.CustomerID IS NOT NULL THEN c.City
	ELSE s.City
END AS City,
CASE 
	WHEN c.CompanyName IS NOT NULL THEN c.CompanyName
	ELSE s.CompanyName
END AS CompanyName,
CASE 
	WHEN c.ContactName IS NOT NULL THEN c.ContactName
	ELSE s.ContactName
END AS ContactName,
CASE 
	WHEN c.CustomerID IS NOT NULL THEN 'Customer'
	ELSE 'Supplier'
END AS Type
FROM Products AS [p]
FULL OUTER JOIN Suppliers AS [s] ON p.SupplierID = s.SupplierID
FULL OUTER JOIN [Order Details] AS [od] ON p.ProductID = od.ProductID
FULL OUTER JOIN Orders AS [o] ON od.OrderID = o.OrderID
FULL OUTER JOIN Customers AS [c] ON o.CustomerID = c.CustomerID



