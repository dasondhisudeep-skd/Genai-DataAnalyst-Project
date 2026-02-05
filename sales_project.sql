
CREATE DATABASE GenAI_Sales_Project;
GO
USE GenAI_Sales_Project;
GO

CREATE TABLE Sales (
    OrderID INT,
    OrderDate DATE,
    Region VARCHAR(50),
    Customer VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);

-- After importing Excel data

-- Total Rows Check
SELECT COUNT(*) AS TotalRows FROM Sales;

-- Region Wise Sales
SELECT Region, SUM(Quantity*UnitPrice) AS TotalSales
FROM Sales
GROUP BY Region
ORDER BY TotalSales DESC;

-- Top Products
SELECT Product, SUM(Quantity) AS TotalQty
FROM Sales
GROUP BY Product
ORDER BY TotalQty DESC;

-- Monthly Trend
SELECT FORMAT(OrderDate,'yyyy-MM') AS Month,
       SUM(Quantity*UnitPrice) AS MonthlySales
FROM Sales
GROUP BY FORMAT(OrderDate,'yyyy-MM')
ORDER BY Month;

-- Performance Indexing
CREATE NONCLUSTERED INDEX IDX_Sales_Region ON Sales(Region);
CREATE NONCLUSTERED INDEX IDX_Sales_Product ON Sales(Product);
