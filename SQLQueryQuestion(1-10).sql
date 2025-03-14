------------------------------ Question (1 - 10)-------------------------------
USE Northwind;

-- 1. Which shippers do we have?

SELECT * From dbo.Shippers;

-- 2. Certain fields from Categories?

SELECT CategoryName,[Description] FROM dbo.Categories;

/* 3. We�d like to see just the FirstName, LastName, and HireDate of all the
employees with the Title of Sales Representative. Write a SQL
statement that returns only those employees. */

SELECT
	FirstName,
	LastName,
	FORMAT(HireDate,'yyyy-MM-dd') AS HireDate
FROM dbo.Employees
WHERE Title = 'Sales Representative';

/*
4. Now we�d like to see the same columns as above, but only for those
employees that both have the title of Sales Representative, and also are
in the United States.
*/

SELECT
	FirstName,
	LastName,
	FORMAT(HireDate,'yyyy-MM-dd') AS HireDate
FROM dbo.Employees
WHERE Title = 'Sales Representative' AND Country = 'USA';

/*
5. Show all the orders placed by a specific employee. The EmployeeID for
this Employee (Steven Buchanan) is 5.
*/

SELECT * FROM dbo.Orders
WHERE EmployeeID = 5;

/*
6. In the Suppliers table, show the SupplierID, ContactName, and
ContactTitle for those Suppliers whose ContactTitle is not Marketing
Manager.
*/

SELECT
	SupplierID,
	ContactName,
	ContactTitle
FROM dbo.Suppliers
WHERE ContactTitle != 'Marketing Manager'; -- WHERE ContactTitle <> 'Marketing Manager';

/*
7. In the products table, we�d like to see the ProductID and ProductName
for those products where the ProductName includes the string �queso�
*/

SELECT
	ProductID,
	ProductName
FROM dbo.Products
WHERE ProductName LIKE '%queso%';

/*
8. Looking at the Orders table, there�s a field called ShipCountry. Write a
query that shows the OrderID, CustomerID, and ShipCountry for the
orders where the ShipCountry is either France or Belgium.
*/

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	ShipCountry
FROM dbo.Orders
WHERE ShipCountry = 'France' OR ShipCountry = 'Belgium';

/*
9. Now, instead of just wanting to return all the orders from France of
Belgium, we want to show all the orders from any Latin American
country. But we don�t have a list of Latin American countries in a table
in the Northwind database. So, we�re going to just use this list of Latin
American countries that happen to be in the Orders table:
Brazil
Mexico
Argentina
Venezuela
It doesn�t make sense to use multiple Or statements anymore, it would
get too convoluted. Use the In statement.
*/

SELECT
	OrderID,
	CustomerID,
	OrderDate,
	ShipCountry
FROM dbo.Orders
WHERE ShipCountry IN ('Brazil','Mexico','Argentina','Venezuela');

/*
10.For all the employees in the Employees table, show the FirstName,
LastName, Title, and BirthDate. Order the results by BirthDate, so we
have the oldest employees first.
*/

SELECT
	FirstName,
	LastName,
	Title,
	FORMAT(BirthDate,'yyyy-MM-dd') AS Birthdate,
	YEAR(BirthDate) AS BirthYear
FROM dbo.Employees
ORDER BY YEAR(BirthDate) ASC;