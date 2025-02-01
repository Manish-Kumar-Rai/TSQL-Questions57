------------------------------ Question (11 - 20)-------------------------------
USE Northwind;

/*
11.Showing the Employees in order of
BirthDate, we see the time of the BirthDate field, which we don’t want.
Show only the date portion of the BirthDate field.
*/

SELECT
	FirstName,
	LastName,
	Title,
	CONVERT(DATE,BirthDate) AS DateOnlyBirthDate
FROM dbo.Employees;

/*
12. Show the FirstName and LastName columns from the Employees table,
and then create a new column called FullName, showing FirstName and
LastName joined together in one column, with a space in-between.
*/

SELECT
	FirstName,
	LastName,
	CONCAT_WS(' ',FirstName,LastName) AS FullName
FROM dbo.Employees;

/*
13. In the OrderDetails table, we have the fields UnitPrice and Quantity.
Create a new field, TotalPrice, that multiplies these two together. We’ll
ignore the Discount field for now.
In addition, show the OrderID, ProductID, UnitPrice, and Quantity.
Order by OrderID and ProductID.
*/

SELECT
	OrderID,
	ProductID,
	UnitPrice,
	Quantity,
	(UnitPrice * Quantity) AS TotalPrice
FROM dbo.OrderDetails;

/*
14. How many customers do we have in the Customers table? Show one
value only, and don’t rely on getting the recordcount at the end of a
resultset.
*/

SELECT COUNT(CustomerID) AS TotalCustomers FROM dbo.Customers;

SELECT
	SUM(CASE WHEN CustomerID IS NOT NULL THEN 1 ELSE 0 END) AS TotalCustomers
FROM dbo.Customers;