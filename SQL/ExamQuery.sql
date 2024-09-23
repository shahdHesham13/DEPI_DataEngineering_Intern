-- Create a new database
CREATE DATABASE ExamDB;
USE ExamDB;

-- Create a table and insert data

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    BirthDate DATE,
    Job VARCHAR(30),
	PhoneNumber VARCHAR(15)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, BirthDate, Job ,PhoneNumber) VALUES 
(1, 'shahd', 'Hesham', '2002-12-01', 'Software Engineer','1234567890'),
(2, 'Jimin', 'Park', '1995-10-13', 'Data Analyst','0987654321');


-- Write and execute a SQL query

SELECT * FROM Employees

-- Calculate total sales, average sales, and maximum sales

SELECT Category, SUM(saleAmount) AS 'Total Sales', AVG(saleAmount) AS 'Average Sales', MAX(saleAmount) AS 'Maximum Sales' FROM Sales

WHERE  saleDate >= '2024-09-01' AND  saleDate <= '2024-12-30'
GROUP BY  Category; -- 'GROUP BY' so the result of each aggregate function be for each product category

-- Create a stored procedure

CREATE PROCEDURE customerorderhistory
 @CustomerID INT
AS
BEGIN
  SELECT orderID, orderDate, totalOrderAmount, orderStatus FROM  Orders
  WHERE CustomerID = @CustomerID
  ORDER BY orderDate;
END;

-- Retrieve top 3 customers by total order value

SELECT TOP 3 CustomerID, totalOrderValue
FROM  (SELECT CustomerID, SUM(totalAmount) AS 'total Order Value' FROM Orders GROUP BY CustomerID)  AS 'Customer Order Values'
ORDER BY totalOrderValue DESC;


-- Handle unexpected results due to implicit data type conversion
Use ExamDB;
SELECT * FROM Employees

-- Implicit conversion (SQL Server will automatically convert the value data type)
SELECT * FROM Employees WHERE PhoneNumber = 1234567890;

-- Explicit conversion (using CAST or CONVERT functions to covert it)
SELECT * FROM Employees WHERE PhoneNumber = CAST(1234567890 AS VARCHAR(15));
