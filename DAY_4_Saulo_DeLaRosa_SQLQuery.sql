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
	ID int,
	City text
)
INSERT INTO people_delarosa
VALUES (1, 'Seattle')

INSERT INTO people_delarosa
VALUES (2, 'Green Bay')

CREATE TABLE city_delarosa(
	id int,
	Name text,
	City int
)

INSERT INTO city_delarosa
VALUES (1, ' Aaron Rodgers', 2)

INSERT INTO city_delarosa
VALUES (2, 'Russell Wilson', 1)

INSERT INTO city_delarosa
VALUES (3, 'Jody Nelson', 2)

UPDATE people_delarosa
SET City = 'Madison'
WHERE id = 1

CREATE VIEW [Packers_DELAROSA] AS 
SELECT Name
FROM city_delarosa
WHERE City = 2

DROP TABLE people_delarosa
DROP TABLE city_delarosa
DROP VIEW Packers_DELAROSA


--5.
CREATE PROCEDURE sp_birthday_employees_DELAROSA
AS
BEGIN
	SELECT FirstName, LastName , BirthDate
	INTO birthday_employees_DELAROSA
		FROM EMPLOYEES
		WHERE MONTH(BirthDate) = 2
END

EXEC sp_birthday_employees_DELAROSA

--6.
--One way to check if two tables of the same structure have identical 
--contenct is to use the EXCEPT operator along side UNION ALL. 
--TABLE test_table_a EXCEPT TABLE test_table_b
--UNION ALL
--TABLE test_table_b EXCEPT TABLE test_table_a
--If they are different it will return records that are in one table but not the other.

