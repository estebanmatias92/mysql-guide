-- Eliminar la tabla OrderItems si existe
DROP TABLE IF EXISTS OrderItems;
-- Eliminar la tabla Orders si existe
DROP TABLE IF EXISTS Orders;
-- Eliminar la tabla Products si existe
DROP TABLE IF EXISTS Products;
-- Eliminar la tabla Customers si existe
DROP TABLE IF EXISTS Customers;

-- Crear tabla Customers
CREATE TABLE IF NOT EXISTS Customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Email TEXT
);

-- Crear tabla Products
CREATE TABLE IF NOT EXISTS Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Price REAL
);

-- Crear tabla Orders
CREATE TABLE IF NOT EXISTS Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATE,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

-- Crear tabla OrderItems
CREATE TABLE IF NOT EXISTS OrderItems (
    OrderItemID INTEGER PRIMARY KEY,
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

-- Insertar datos en la tabla Customers
INSERT OR IGNORE INTO Customers (FirstName, LastName, Email) VALUES 
('George', 'Davis', 'george.davis@example.com'),
('Hannah', 'Garcia', 'hannah.garcia@example.com'),
('Diana', 'Brown', 'diana.brown@example.com'),
('Barbara', 'Johnson', 'barbara.johnson@example.com'),
('Edward', 'Jones', 'edward.jones@example.com'),
('Adam', 'Smith', 'adam.smith@example.com'),
('Fiona', 'Miller', 'fiona.miller@example.com'),
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Doe', 'jane.doe@example.com'),
('Isaac', 'Rodriguez', 'isaac.rodriguez@example.com');

-- Insertar datos en la tabla Products
INSERT OR IGNORE INTO Products (ProductName, Price) VALUES 
('Raspberry', 3.0),
('Orange', 0.8),
('Mango', 1.7),
('Carrot', 0.7),
('Tomato', 1.0),
('Quince', 1.8),
('Iceberg Lettuce', 1.1),
('Eggplant', 0.9),
('Apple', 0.5),
('Grapes', 2.0),
('Honeydew', 3.0),
('Banana', 0.3),
('Jalapeno', 0.4),
('Dates', 1.2),
('Kiwi', 1.3),
('Lemon', 0.5),
('Nectarine', 1.6),
('Papaya', 2.5),
('Fig', 1.5),
('Strawberry', 2.3);

-- Insertar datos en la tabla Orders
INSERT OR IGNORE INTO Orders (CustomerID, OrderDate) VALUES 
(7, '2023-01-01'),
(2, '2023-01-01'),
(5, '2023-01-02'),
(9, '2023-01-02'),
(1, '2023-01-03'),
(3, '2023-01-03'),
(8, '2023-01-04'),
(6, '2023-01-05'),
(10, '2023-01-05'),
(4, '2023-01-06'),
(5, '2023-01-06'),
(3, '2023-01-07'),
(2, '2023-01-08'),
(1, '2023-01-09'),
(7, '2023-01-09'),
(6, '2023-01-10'),
(4, '2023-01-10'),
(8, '2023-01-11'),
(9, '2023-01-11'),
(10, '2023-01-12'),
(1, '2023-01-12'),
(5, '2023-01-13'),
(7, '2023-01-14'),
(2, '2023-01-15'),
(3, '2023-01-16'),
(6, '2023-01-17'),
(4, '2023-01-17'),
(9, '2023-01-18'),
(8, '2023-01-19'),
(10, '2023-01-20');

-- Insertar datos en la tabla OrderItems
INSERT OR IGNORE INTO OrderItems (OrderID, ProductID, Quantity) VALUES 
(1, 8, 9),
(2, 14, 7),
(3, 5, 2),
(4, 2, 5),
(5, 12, 6),
(6, 10, 9),
(7, 15, 8),
(8, 4, 9),
(9, 9, 4),
(10, 18, 4),
(11, 16, 7),
(12, 15, 5),
(13, 6, 4),
(14, 14, 6),
(15, 20, 1),
(16, 18, 3),
(17, 6, 2),
(18, 16, 6),
(19, 11, 8),
(20, 13, 6),
(21, 17, 7),
(22, 1, 8),
(23, 20, 8),
(24, 12, 1),
(25, 7, 9),
(26, 19, 4),
(27, 3, 2),
(28, 7, 1),
(29, 10, 2),
(30, 17, 1);
