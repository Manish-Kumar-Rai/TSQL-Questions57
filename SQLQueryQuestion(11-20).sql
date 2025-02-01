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

/*
15. Show the date of the first order ever made in the Orders table.
*/

SELECT
	TOP (1)
	CONVERT(DATE,OrderDate) AS OrderDate
FROM dbo.Orders
ORDER BY OrderDate;

SELECT
	MIN(CONVERT(DATE,OrderDate)) AS FirstOrderDate
FROM dbo.Orders;

/*
16. Show a list of countries where the Northwind company has customers.
*/

SELECT DISTINCT Country FROM dbo.Customers;

SELECT
	Country
FROM dbo.Customers
GROUP BY Country;

/*
17. Show a list of all the different values in the Customers table for
ContactTitles. Also include a count for each ContactTitle.
This is similar in concept to the previous question “Countries where
there are customers”, except we now want a count for each ContactTitle.
*/

SELECT
	ContactTitle,
	COUNT(1) AS TotalContactTitle
FROM dbo.Customers
GROUP BY ContactTitle;

/*
18. We’d like to show, for each product, the associated Supplier. Show the
ProductID, ProductName, and the CompanyName of the Supplier. Sort
by ProductID.
This question will introduce what may be a new concept, the Join clause
in SQL. The Join clause is used to join two or more relational database
tables together in a logical way.
*/

SELECT
	P.ProductID,
	P.ProductName,
	S.CompanyName
From dbo.Products AS P
LEFT JOIN dbo.Suppliers AS S
	ON P.SupplierID = S.SupplierID
ORDER BY P.ProductID;

/*
19. We’d like to show a list of the Orders that were made, including the
Shipper that was used. Show the OrderID, OrderDate (date only), and
CompanyName of the Shipper, and sort by OrderID.
In order to not show all the orders (there’s more than 800), show only
those rows with an OrderID of less than 10300.
*/

SELECT 
	O.OrderID,
	CONVERT(DATE,O.OrderDate) AS OrderDate,
	S.CompanyName
FROM dbo.Orders AS O
LEFT JOIN dbo.Shippers AS S
	ON O.ShipVia = S.ShipperID
WHERE OrderID < 10300
ORDER BY OrderID;

/*
20. For this problem, we’d like to see the total number of products in each
category. Sort the results by the total number of products, in descending
order.
*/

SELECT
	C.CategoryName,
	Count(*) AS TotalProducts
FROM dbo.Products AS P
LEFT JOIN dbo.Categories AS C
	ON P.CategoryID = C.CategoryID
GROUP BY C.CategoryName
ORDER BY TotalProducts DESC;
