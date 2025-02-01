------------------------------ Question (1 - 10)-------------------------------

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