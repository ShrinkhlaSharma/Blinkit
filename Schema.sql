CREATE DATABASE IF NOT EXISTS SalesDB;
USE SalesDB;

-- Create tables
-- Customers
CREATE TABLE IF NOT EXISTS Customers (
  CustomerID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  SignupDate DATE
);
-- Products
CREATE TABLE IF NOT EXISTS Products (
  ProductID INT AUTO_INCREMENT PRIMARY KEY,
  ProductName VARCHAR(100),
  Category VARCHAR(50),
  Price DECIMAL(10,2),
  Stock INT
);
-- Orders
CREATE TABLE IF NOT EXISTS Orders (
  OrderID INT AUTO_INCREMENT PRIMARY KEY,
  CustomerID INT,
  OrderDate DATE,
  Status VARCHAR(50),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- OrderItems
CREATE TABLE IF NOT EXISTS OrderItems (
  OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT,
  UnitPrice DECIMAL(10,2),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert sample data
INSERT IGNORE INTO Customers (Name, Email, SignupDate) VALUES
  ('Alice Smith','alice@example.com','2024-01-15'),
  ('Bob Johnson','bob@example.com','2024-02-10'),
  ('Carol Williams','carol@example.com','2024-03-05'),
  ('David Brown','david@example.com','2024-01-20'),
  ('Eva Davis','eva@example.com','2024-02-25');

INSERT IGNORE INTO Products (ProductName,Category,Price,Stock) VALUES
  ('Laptop Model A','Electronics',750.00,25),
  ('Wireless Mouse','Electronics',25.00,100),
  ('Office Chair','Furniture',150.00,40),
  ('Standing Desk','Furniture',300.00,20),
  ('Notebook Pack','Stationery',10.00,200);

INSERT IGNORE INTO Orders (CustomerID,OrderDate,Status) VALUES
  (1,'2024-03-01','Completed'),
  (2,'2024-03-02','Completed'),
  (1,'2024-03-05','Pending'),
  (3,'2024-03-10','Completed'),
  (4,'2024-03-15','Cancelled'),
  (5,'2024-03-20','Completed');

INSERT IGNORE INTO OrderItems (OrderID,ProductID,Quantity,UnitPrice) VALUES
  (1,1,1,750.00),
  (1,2,2,25.00),
  (2,3,1,150.00),
  (3,2,1,25.00),
  (3,5,3,10.00),
  (4,4,1,300.00),
  (6,5,10,10.00);