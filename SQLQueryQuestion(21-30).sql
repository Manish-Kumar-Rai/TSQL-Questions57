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