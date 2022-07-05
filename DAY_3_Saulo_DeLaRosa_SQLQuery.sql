USE Northwind
--1.
SELECT DISTINCT c.City
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
JOIN Employees AS [e] ON c.City = e.City
WHERE (c.City IS NOT NULL) AND (e.City IS NOT NULL)

--2.A
SELECT DISTINCT c.City AS [Customer city] 
FROM Customers AS [c] 
JOIN (SELECT City FROM Employees WHERE City IS NULL) AS [e]
ON c.City = e.City


--2.B
SELECT DISTINCT c.City AS [customer city], e.City [employee city]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
FULL OUTER JOIN Employees AS [e] ON c.City = e.City
WHERE e.City IS NULL

--3.
SELECT p.ProductName, SUM(od.Quantity) AS [Number Sold]
FROM  [Order Details] AS [od]
JOIN Products AS [p] ON od.ProductID = p.ProductID
GROUP BY p.ProductName

--4.
SELECT c.City, SUM(od.Quantity) AS [Number Sold]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS [od] ON o.OrderId = od.OrderId
WHERE (c.City IS NOT NULL) 
GROUP BY c.City

--5A.
SELECT c.City
FROM Customers AS [c]
GROUP BY c.City
HAVING COUNT(CustomerID) >= 2
UNION
SELECT c.City
FROM Customers AS [c]
GROUP BY c.City
HAVING COUNT(CustomerID) >= 2

--5B.
SELECT c.City
FROM (SELECT c.City
		FROM Customers AS [c]
		GROUP BY c.City
		HAVING COUNT(CustomerID) >= 2) AS [c]

--6.
SELECT c.City, COUNT(od.ProductID) AS [kinds of product]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS [od] ON o.OrderId = od.OrderId
GROUP BY c.City
HAVING COUNT(od.ProductID) >= 2

--7.
SELECT DISTINCT c.ContactName, c.City AS [customer city], o.ShipCity AS [ship city]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
WHERE (c.City != o.ShipCity) 

--8.
SELECT TOP 5 p.ProductName, SUM(od.Quantity) AS [number sold], AVG(od.UnitPrice) AS [Average Price]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS [od] ON o.OrderId = od.OrderId
JOIN Products AS [p] ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY SUM(od.Quantity) DESC


--9.A
SELECT DISTINCT j.City
FROM (SELECT e.City, o.OrderID
		FROM Employees AS [e]  LEFT JOIN  Orders AS [o]
		ON  e.City = o.ShipCity
		) AS [j]
WHERE j.OrderID IS NULL

--9.B
SELECT e.City
FROM Employees AS [e]  
LEFT JOIN  Orders AS [o] 
ON  e.City = o.ShipCity
WHERE o.OrderID IS NULL


--10.
SELECT TOP 1 (SELECT TOP 1 ee.City AS [e1]
				FROM Employees AS [ee]
				JOIN Orders AS [oo] ON ee.EmployeeID = oo.EmployeeID
				JOIN [Order Details] AS [od] ON oo.OrderId = od.OrderId
				WHERE (ee.City IS NOT NULL) 
				) AS [City]
FROM Employees AS [e] JOIN Orders AS [o] ON e.EmployeeID = o.EmployeeID
WHERE e.City = City
GROUP BY City
ORDER BY COUNT(o.OrderID) DESC


SELECT TOP 1 ee.City AS [e1]
				FROM Employees AS [ee]
				JOIN Orders AS [oo] ON ee.EmployeeID = oo.EmployeeID
				JOIN [Order Details] AS [od] ON oo.OrderId = od.OrderId
				WHERE (ee.City IS NOT NULL) 
				GROUP BY ee.City
			ORDER BY SUM(od.Quantity) DESC


SELECT TOP 1 e.City AS [City], COUNT(o.OrderID)
FROM Employees AS [e] JOIN Orders AS [o] ON e.EmployeeID = o.EmployeeID
GROUP BY City
ORDER BY COUNT(o.OrderID) DESC


--11.
--One way to remove duplicate entries into a table is to use common table expression along
--with the OVER() function and the PARTITION BY clause. This is done using the ROW_NUMBER()
--functions to add a unique sequential row number for each row. Then using DELETE where
--the duplicates a greater than zero. The RANK() function can be used insted of ROW_NUMBER()
--Another way of removing duplicate records is by using the WHERE ___ NOT IN and 
--the group by clause within a DELETE statement.  