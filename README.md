# 🛒 E-Commerce Data Analysis Using MySQL

This project focuses on analyzing eCommerce transactional data using MySQL. The dataset provides rich insights into customer behavior, product performance, and regional sales trends. All analysis is done through structured SQL queries.

---

## 📁 Dataset

**Source**: [Kaggle - E-Commerce Data](https://www.kaggle.com/datasets/carrie1/ecommerce-data)

**Features**:
- `InvoiceNo`: Invoice number
- `StockCode`: Product/item code
- `Description`: Product description
- `Quantity`: Number of items purchased
- `InvoiceDate`: Date and time of purchase
- `UnitPrice`: Price per item
- `CustomerID`: Customer identification number
- `Country`: Country of the customer

---

## 🔍 SQL Tasks Performed

### ✅ Basic Queries
- **Select all records**
  ```sql
  SELECT * FROM data;
  ```
- **Transactions from the United Kingdom**
  ```sql
  SELECT * FROM data
  WHERE Country = 'United Kingdom';
  ```

### ✅ Aggregation & Grouping
- **Top 5 most sold products**
  ```sql
  SELECT Description, SUM(Quantity) AS TotalSold
  FROM data
  GROUP BY Description
  ORDER BY TotalSold DESC
  LIMIT 5;
  ```

- **Average Unit Price**
  ```sql
  SELECT AVG(UnitPrice) AS AveragePrice FROM data;
  ```

- **Total Revenue by Country**
  ```sql
  SELECT Country, SUM(Quantity * UnitPrice) AS Revenue
  FROM data
  GROUP BY Country
  ORDER BY Revenue DESC;
  ```

### ✅ Joins
- **Create customer table & join**
  ```sql
  CREATE TABLE customers (
      CustomerID VARCHAR(20),
      CustomerName VARCHAR(100)
  );

  INSERT INTO customers VALUES ('17850', 'John Doe'), ('13047', 'Jane Smith');

  SELECT e.InvoiceNo, e.Description, c.CustomerName
  FROM data e
  INNER JOIN customers c ON e.CustomerID = c.CustomerID;
  ```

### ✅ Subqueries
- **Most expensive item**
  ```sql
  SELECT * FROM data
  WHERE UnitPrice = (
      SELECT MAX(UnitPrice) FROM data
  );
  ```

### ✅ Views
- **Top selling products view**
  ```sql
  CREATE VIEW TopSellingProducts AS
  SELECT Description, SUM(Quantity) AS TotalSold
  FROM data
  GROUP BY Description
  ORDER BY TotalSold DESC;
  
  SELECT * FROM TopSellingProducts LIMIT 10;
  ```

### ✅ Index Optimization
- **Create indexes for performance**
  ```sql
  CREATE INDEX idx_customer ON data(CustomerID);
  CREATE INDEX idx_invoice_date ON data(InvoiceDate);
  ```

### ✅ Additional Insights
- **Top 10 customers by total spending**
  ```sql
  SELECT CustomerID, SUM(Quantity * UnitPrice) AS TotalSpent
  FROM data
  GROUP BY CustomerID
  ORDER BY TotalSpent DESC
  LIMIT 10;
  ```

- **Number of unique customers per country**
  ```sql
  SELECT Country, COUNT(DISTINCT CustomerID) AS UniqueCustomers
  FROM data
  GROUP BY Country
  ORDER BY UniqueCustomers DESC;
  ```

---

## 💡 Learnings

- Efficient data querying with `GROUP BY`, `ORDER BY`, and subqueries
- Creating and using `VIEWS` for reusable logic
- Performance optimization using `INDEXES`
- Gaining insights into customer segments and product performance

---






