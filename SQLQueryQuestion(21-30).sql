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

/*
24. A salesperson for Northwind is going on a business trip to visit
customers, and would like to see a list of all customers, sorted by
region, alphabetically.
However, he wants the customers with no region (null in the Region
field) to be at the end, instead of at the top, where you’d normally find
the null values. Within the same region, companies should be sorted by
CustomerID.
*/

SELECT
	CustomerID,
	CompanyName,
	Region
FROM dbo.Customers
ORDER BY
	CASE WHEN Region IS NULL THEN 1 ELSE 0 END,
	REGION,
	CompanyName;

SELECT
	CustomerID,
	CompanyName,
	Region,
	CASE WHEN Region IS NULL THEN 1 ELSE 0 END AS ComputedField
FROM dbo.Customers
ORDER BY
	ComputedField,
	Region,
	CompanyName;

/*
25. Some of the countries we ship to have very high freight charges. We'd
like to investigate some more shipping options for our customers, to be
able to offer them lower freight charges. Return the three ship countries
with the highest average freight overall, in descending order by average
freight.
*/

SELECT
	TOP (3)
	ShipCountry,
	AVG(Freight) AS Avg_Freight
FROM dbo.Orders
GROUP BY ShipCountry
ORDER BY AVG(Freight) DESC;

/*
26. We're continuing on the question above on high freight charges. Now,
instead of using all the orders we have, we only want to see orders from
the year 2015.
*/

SELECT
	TOP 3
	ShipCountry,
	AVG(Freight) AS Avg_Freight
FROM dbo.Orders
WHERE YEAR(OrderDate) = 2015
GROUP BY ShipCountry
ORDER BY AVG(Freight) DESC;