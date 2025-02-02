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

/*
27. 
Another (incorrect) answer to the problem above is this:

	Select Top 3
	ShipCountry
	,AverageFreight = avg(freight)
	From Orders
	Where
	OrderDate between '1/1/2015' and '12/31/2015'
	Group By ShipCountry
	Order By AverageFreight desc;

Notice when you run this, it gives Sweden as the ShipCountry with the
third highest freight charges. However, this is wrong - it should be
France.
What is the OrderID of the order that the (incorrect) answer above is
missing?
*/

/*
Why is There a Difference?
YEAR(OrderDate) = 2015 ensures that all records with any date in 2015 are included, 
regardless of the time part.
BETWEEN '1/1/2015' AND '12/31/2015' might miss orders on 12/31/2015 
if they have a time component (e.g., '2015-12-31 23:59:59.997') because '12/31/2015' is implicitly converted 
to '2015-12-31 00:00:00'.
*/
SELECT
	OrderID,OrderDate
FROM dbo.Orders
WHERE OrderDate >= '1/1/2015' AND OrderDate < '1/1/2016'
ORDER BY OrderDate DESC;

/*
28. We're continuing to work on high freight charges. We now want to get
the three ship countries with the highest average freight charges. But
instead of filtering for a particular year, we want to use the last 12
months of order data, using as the end date the last OrderDate in Orders.
*/

SELECT TOP 3
    ShipCountry,
    AVG(Freight) AS Avg_Freight
FROM dbo.Orders
WHERE OrderDate >= DATEADD(MONTH, -12, (SELECT MAX(OrderDate) FROM dbo.Orders)) 
  AND OrderDate < (SELECT MAX(OrderDate) FROM dbo.Orders)
GROUP BY ShipCountry
ORDER BY AVG(Freight) DESC;

/*
29. We're doing inventory, and need to show information like the below, for
all orders. Sort by OrderID and Product ID.
*/

SELECT
	E.EmployeeID,
	E.LastName,
	O.OrderID,
	P.ProductName,
	OD.Quantity
FROM dbo.Orders AS O
JOIN dbo.Employees AS E
	ON O.EmployeeID = E.EmployeeID
JOIN dbo.OrderDetails AS OD
	ON O.OrderID = OD.OrderID
JOIN dbo.Products AS P
	ON OD.ProductID = P.ProductID
ORDER BY O.OrderID,P.ProductID;