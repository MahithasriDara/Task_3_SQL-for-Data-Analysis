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



