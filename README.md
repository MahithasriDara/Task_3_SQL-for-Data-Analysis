# Task_3_SQL-for-Data-Analysis
Analyzing data from a database by using SQL Queries

# 🛒 E-Commerce SQL Data Analysis

## 📌 Objective
This project demonstrates how to perform structured SQL queries on an e-commerce dataset to extract insights related to customer behavior, product sales, and overall business performance.

---

## 📁 Dataset

- **Source**: [Kaggle - E-Commerce Data](https://www.kaggle.com/datasets/carrie1/ecommerce-data)
- **File Used**: `data.csv`
- **Description**: The dataset contains transactions from a UK-based online retail store. It includes details such as:
  - `InvoiceNo`, `StockCode`, `Description`, `Quantity`
  - `InvoiceDate`, `UnitPrice`, `CustomerID`, `Country`

---

## 🛠 Tools & Technologies

- **Language**: SQL
- **Database**: MySQL
- **Environment**: Jupyter Notebook, MySQL Workbench
- **Libraries** (for preprocessing): Pandas

---

## 📊 Steps Performed

### 1. 🔍 Data Cleaning

- Read the dataset in Jupyter Notebook using:
  ```python
  df = pd.read_csv("data.csv", encoding='ISO-8859-1')
  ```
- Cleaned missing values.
- Exported clean data to CSV and imported into MySQL database.

---

### 2. 🧱 Database Setup

```sql
CREATE TABLE data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(100)
);
```

---

### 3. 📈 SQL Queries

#### a. Select All Data
```sql
SELECT * FROM data;
```

#### b. Filter by Country
```sql
SELECT * FROM data
WHERE Country = 'United Kingdom';
```

#### c. Top 5 Most Sold Products
```sql
SELECT Description, SUM(Quantity) AS TotalSold
FROM data
GROUP BY Description
ORDER BY TotalSold DESC
LIMIT 5;
```

#### d. INNER JOIN with Sample Customers
```sql
CREATE TABLE customers (
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(100)
);

INSERT INTO customers VALUES
('17850', 'John Doe'),
('13047', 'Jane Smith');

SELECT e.InvoiceNo, e.Description, c.CustomerName
FROM data e
INNER JOIN customers c ON e.CustomerID = c.CustomerID;
```

#### e. Most Expensive Item
```sql
SELECT * FROM data
WHERE UnitPrice = (
    SELECT MAX(UnitPrice) FROM data
);
```

#### f. Average Unit Price
```sql
SELECT AVG(UnitPrice) AS AveragePrice FROM data;
```

#### g. Total Revenue by Country
```sql
SELECT Country, SUM(Quantity * UnitPrice) AS Revenue
FROM data
GROUP BY Country
ORDER BY Revenue DESC;
```

#### h. Views: Top Selling Products
```sql
CREATE VIEW TopSellingProducts AS
SELECT Description, SUM(Quantity) AS TotalSold
FROM data
GROUP BY Description
ORDER BY TotalSold DESC;

-- Using the view
SELECT * FROM TopSellingProducts LIMIT 10;
```

#### i. Performance Optimization: Indexes
```sql
CREATE INDEX idx_customer ON data(CustomerID);
CREATE INDEX idx_invoice_date ON data(InvoiceDate);
```

---



## 📚 Outcomes

- Identified best-selling products
- Found top-revenue-generating countries
- Optimized performance with indexing
- Practiced data joins and subqueries


---

## 🗂 Repository Structure

```
📦 ecommerce-sql-analysis
┣ 📄 data.csv
┣ 📄 analysis_queries.sql
┣ 📄 README.md
┣ 📂 screenshots
```
