SELECT 
    CustomerID,
    FirstName,
    LastName,
    EmailAddress,
    Phone
FROM SalesLT.Customer;

-- Monthly Sales
SELECT 
    MONTH(OrderDate) AS Month,
    SUM(TotalDue) AS TotalSales
FROM SalesLT.SalesOrderHeader
GROUP BY MONTH(OrderDate)
ORDER BY TotalSales;

-- Sales in May 2011
SELECT *
FROM SalesLT.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011
AND MONTH(OrderDate) = 5;

-- Top Customers
SELECT TOP 5 
    c.FirstName,
    c.LastName,
    SUM(h.TotalDue) AS TotalSales
FROM SalesLT.Customer c
JOIN SalesLT.SalesOrderHeader h
ON c.CustomerID = h.CustomerID
GROUP BY c.FirstName, c.LastName
ORDER BY TotalSales DESC;

-- Ranking Customers
SELECT 
    CustomerID,
    TotalDue,
    RANK() OVER (ORDER BY TotalDue DESC) AS RankBySales
FROM SalesLT.SalesOrderHeader;

GO
CREATE PROCEDURE GetCustomerSales
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
AS
BEGIN
    SELECT 
        c.FirstName,
        c.LastName,
        SUM(h.TotalDue) AS TotalSales
    FROM SalesLT.Customer c
    JOIN SalesLT.SalesOrderHeader h
        ON c.CustomerID = h.CustomerID
    WHERE c.FirstName = @FirstName
    AND c.LastName = @LastName
    GROUP BY c.FirstName, c.LastName;
END;

GO
CREATE VIEW MonthlySales AS
SELECT 
    MONTH(OrderDate) AS Month,
    SUM(TotalDue) AS TotalSales
FROM SalesLT.SalesOrderHeader
GROUP BY MONTH(OrderDate);