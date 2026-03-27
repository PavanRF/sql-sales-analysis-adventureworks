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

CREATE VIEW MonthlySales AS
SELECT 
    MONTH(OrderDate) AS Month,
    SUM(TotalDue) AS TotalSales
FROM SalesLT.SalesOrderHeader
GROUP BY MONTH(OrderDate);
