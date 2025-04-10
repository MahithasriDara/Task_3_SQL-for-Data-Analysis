select * from data;

-- Select all transactions from United Kingdom
SELECT * FROM data
WHERE Country = 'United Kingdom';

-- Top 5 most sold products
SELECT Description, SUM(Quantity) AS TotalSold
FROM data
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 5;
CREATE TABLE customers (
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(100)
);

-- Sample Insert
INSERT INTO customers VALUES ('17850', 'John Doe'), ('13047', 'Jane Smith');


SELECT e.InvoiceNo, e.Description, c.CustomerName
FROM data e
INNER JOIN customers c ON e.CustomerID = c.CustomerID;

-- Get the most expensive item(s)
SELECT * FROM data
WHERE UnitPrice = (
    SELECT MAX(UnitPrice) FROM data
);

-- Average Unit Price of all products
SELECT AVG(UnitPrice) AS AveragePrice FROM data;

-- Total Revenue by Country
SELECT Country, SUM(Quantity * UnitPrice) AS Revenue
FROM data
GROUP BY Country
ORDER BY Revenue DESC;

CREATE VIEW TopSellingProducts AS
SELECT Description, SUM(Quantity) AS TotalSold
FROM data
GROUP BY Description
ORDER BY TotalSold DESC;

-- Use the view
SELECT * FROM TopSellingProducts LIMIT 10;

-- Add indexes to improve query speed
CREATE INDEX idx_customer ON data(CustomerID);
CREATE INDEX idx_customer ON data(CustomerID);
-- Transactions with negative quantity (could indicate returns or errors)
SELECT * FROM data
WHERE Quantity < 0;

-- Items with zero or negative price
SELECT * FROM data
WHERE UnitPrice <= 0;

-- Sales trend by month
SELECT MONTH(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS Month, 
       SUM(Quantity * UnitPrice) AS MonthlyRevenue
FROM data
GROUP BY Month
ORDER BY Month;

-- Best hour of day for sales
SELECT HOUR(STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i')) AS Hour,
       SUM(Quantity * UnitPrice) AS HourlyRevenue
FROM data
GROUP BY Hour
ORDER BY HourlyRevenue DESC;

-- Most popular products by quantity sold
SELECT Description, SUM(Quantity) AS TotalSold
FROM data
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 10;

-- Products with highest revenue
SELECT Description, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM data
GROUP BY Description
ORDER BY TotalRevenue DESC
LIMIT 10;




-- Top 10 customers by total spending
SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
FROM data
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

-- Number of unique customers per country
SELECT Country, COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM data
GROUP BY Country
ORDER BY UniqueCustomers DESC;

