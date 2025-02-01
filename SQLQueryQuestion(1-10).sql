------------------------------ Question (1 - 10)-------------------------------
USE Northwind;

-- 1. Which shippers do we have?

SELECT * From dbo.Shippers;

-- 2. Certain fields from Categories?

SELECT CategoryName,[Description] FROM dbo.Categories;

/* 3. We’d like to see just the FirstName, LastName, and HireDate of all the
employees with the Title of Sales Representative. Write a SQL
statement that returns only those employees. */

SELECT
	FirstName,
	LastName,
	FORMAT(HireDate,'yyyy-MM-dd') AS HireDate
FROM dbo.Employees
WHERE Title = 'Sales Representative';

/*
4. Now we’d like to see the same columns as above, but only for those
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