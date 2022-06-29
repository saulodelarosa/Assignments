--1.
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product;


--2.
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE ListPrice != 0;


--3.
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE Color IS NULL;


--4.
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE Color IS NOT NULL;


--5.
SELECT ProductID, Name, Color, ListPrice 
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice > 0;


--6.
SELECT Name + Color AS [Name and Color]
FROM Production.Product
WHERE Color IS NOT NULL;


--7.
SELECT TOP 6 Name, Color 
FROM Production.Product
WHERE Color IS NOT NULL;


--8.
SELECT ProductID, Name
FROM Production.Product
WHERE ProductID BETWEEN 400 and 500;


--9.
SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color IN ('Blue', 'Black');


--10.
SELECT Name
FROM Production.Product
WHERE Name LIKE 'S%';


--11.
SELECT TOP 6 Name, ListPrice 
FROM Production.Product
WHERE Name LIKE 'S%'
ORDER BY Name ASC;


--12.
SELECT TOP 6 Name, ListPrice 
FROM Production.Product
WHERE Name LIKE 'A%' OR (Name LIKE 'S%')
ORDER BY Name ASC;


--13.
SELECT  Name
FROM Production.Product
WHERE Name LIKE 'SPO[^k]%'
ORDER BY Name ASC;


--14.
SELECT DISTINCT Color
FROM Production.Product
WHERE Color IS NOT NULL
ORDER BY Color DESC;


--15.
SELECT ProductSubcategoryID, Color
FROM Production.Product
WHERE (ProductSubcategoryID IS NOT NULL) AND (Color IS NOT NULL)
GROUP BY ProductSubcategoryID, Color
ORDER BY ProductSubcategoryID;



