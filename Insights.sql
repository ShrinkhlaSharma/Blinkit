1. Total Revenue

SELECT SUM(Quantity * UnitPrice) AS TotalRevenue
FROM OrderItems;

2. Monthly Revenue Trend
SELECT DATE_FORMAT(o.OrderDate, '%Y-%m') AS Month,
       SUM(oi.Quantity * oi.UnitPrice) AS Revenue
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
WHERE o.Status = 'Completed'
GROUP BY Month
ORDER BY Month;

3. Top Customers by Revenue
SELECT c.CustomerID,
       c.Name,
       SUM(oi.Quantity * oi.UnitPrice) AS CustomerRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderItems oi ON o.OrderID = oi.OrderID
WHERE o.Status = 'Completed'
GROUP BY c.CustomerID, c.Name
ORDER BY CustomerRevenue DESC
LIMIT 5;

4. Product Performance
SELECT p.ProductID,
       p.ProductName,
       COALESCE(SUM(oi.Quantity),0) AS UnitsSold,
       COALESCE(SUM(oi.Quantity * oi.UnitPrice),0) AS Revenue
FROM Products p
LEFT JOIN OrderItems oi ON p.ProductID = oi.ProductID
GROUP BY p.ProductID, p.ProductName
ORDER BY Revenue DESC;

5.
SELECT ProductID,
       ProductName,
       Stock
FROM Products
WHERE Stock <= 20 OR Stock IS NULL;