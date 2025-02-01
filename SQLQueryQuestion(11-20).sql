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
	FORMAT(BirthDate,'yyyy-MM-dd') AS DateOnlyBirthDate
FROM dbo.Employees;