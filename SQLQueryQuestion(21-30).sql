------------------------------ Question (21 - 30)-------------------------------
USE Northwind;

/*
21. In the Customers table, show the total number of customers per Country
and City.
*/

SELECT
	Country,
	City,
	COUNT(*) AS TotalCustomers
FROM dbo.Customers
GROUP BY Country, City
ORDER BY TotalCustomers DESC;

/*
22. What products do we have in our inventory that should be reordered?
For now, just use the fields UnitsInStock and ReorderLevel, where
UnitsInStock is less than the ReorderLevel, ignoring the fields
UnitsOnOrder and Discontinued.
Order the results by ProductID.
*/

SELECT
	ProductID,
	ProductName,
	UnitsInStock,
	ReorderLevel
FROM dbo.Products
WHERE UnitsInStock < ReorderLevel
ORDER BY ProductID;

/*
23. Now we need to incorporate these fields—UnitsInStock, UnitsOnOrder,
ReorderLevel, Discontinued—into our calculation. We’ll define
“products that need reordering” with the following:
UnitsInStock plus UnitsOnOrder are less than or equal to
ReorderLevel
The Discontinued flag is false (0).
*/

SELECT
	ProductID,
	ProductName,
	UnitsInStock,
	UnitsOnOrder,
	ReorderLevel,
	Discontinued
FROM dbo.Products
WHERE (UnitsInStock + UnitsOnOrder) <= ReorderLevel AND Discontinued = 0
ORDER BY ProductID;