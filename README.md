# 📊 Sales Analysis using SQL Server (AdventureWorksLT)

## 📌 Project Overview

This project analyzes sales and customer data using the AdventureWorksLT database in SQL Server. It demonstrates real-world SQL skills including joins, aggregations, window functions, and performance optimization.

---

## 🛠️ Tools Used

* SQL Server Management Studio (SSMS)
* AdventureWorksLT Database

---

## 📂 Dataset

The dataset used is AdventureWorksLT, a sample relational database provided by Microsoft.

---

## 🔍 Key Analysis Performed

* Customer data analysis
* Monthly and yearly sales trends
* Top customers by revenue
* Order-level insights
* Ranking using window functions

---

## 📊 Key SQL Concepts Used

* Joins (INNER JOIN)
* Aggregations (SUM, COUNT)
* GROUP BY and ORDER BY
* Window Functions (RANK)
* Views and Stored Procedures
* Indexing for performance optimization

---

## 🚀 Sample Queries

### Top Customers by Sales

```sql
SELECT TOP 5 
    c.FirstName,
    c.LastName,
    SUM(h.TotalDue) AS TotalSales
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader h
ON c.CustomerID = h.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSales DESC;
```

---

## ⚡ Performance Optimization

* Created indexes on frequently queried columns
* Improved query execution time

---

## 📌 Conclusion

This project showcases SQL skills required for data analysis roles and demonstrates the ability to extract meaningful insights from relational databases.

---

## 📎 Future Improvements

* Power BI dashboard integration
* Advanced analytics using window functions
* Automation using SQL jobs

---
