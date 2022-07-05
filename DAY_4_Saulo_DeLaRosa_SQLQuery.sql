USE Northwind
--1.
CREATE VIEW [view_product_order_De_La_Rosa] AS 
SELECT ProductName, UnitsOnOrder
FROM Products

--2.
CREATE PROCEDURE sp_product_order_quantity_De_La_Rosa @product_id int, @total_quantities int OUTPUT
AS
BEGIN
SELECT @total_quantities = UnitsOnOrder
FROM Products
WHERE ProductID = @product_id
END

DECLARE @quantity int
EXEC sp_product_order_quantity_De_La_Rosa @product_id = 2, @total_quantities = @quantity OUTPUT
PRINT @quantity


--3.
CREATE PROCEDURE sp_product_order_city_De_La_Rosa @product_name nvarchar(40)
AS
BEGIN
SELECT c.City, SUM(od.Quantity) AS [Number Sold]
FROM Customers AS [c]
JOIN Orders AS [o] ON c.CustomerID = o.CustomerID
JOIN [Order Details] AS [od] ON o.OrderId = od.OrderId
JOIN Products AS [p] ON p.ProductID = od.ProductID
WHERE ProductName = @product_name 
GROUP BY c.City
ORDER BY SUM(od.Quantity) DESC
END

EXEC sp_product_order_city_De_La_Rosa @product_name = 'Chai'

--4.
CREATE TABLE people_delarosa(

)

CREATE TABLE city_delarosa(

)

