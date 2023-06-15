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
INSERT INTO Customers (FirstName, LastName, Email) VALUES 
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Doe', 'jane.doe@example.com');

-- Insertar datos en la tabla Products
INSERT INTO Products (ProductName, Price) VALUES 
('Apple', 0.5),
('Banana', 0.3);

-- Insertar datos en la tabla Orders
INSERT INTO Orders (CustomerID, OrderDate) VALUES 
(1, '2023-01-01'),
(2, '2023-01-02');

-- Insertar datos en la tabla OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES 
(1, 1, 10),
(2, 2, 15);
