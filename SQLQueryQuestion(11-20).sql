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