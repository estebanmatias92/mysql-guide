
-- Eliminar la tabla OrderItems si existe
DROP TABLE IF EXISTS OrderItems;
-- Eliminar la tabla Orders si existe
DROP TABLE IF EXISTS Orders;
-- Eliminar la tabla Products si existe
DROP TABLE IF EXISTS Products;
-- Eliminar la tabla Customers si existe
DROP TABLE IF EXISTS Customers;
-- Eliminar la tabla Employees si existe
DROP TABLE IF EXISTS Employees;

-- Crear tabla Employees, dentro de la base de datos Shopping
CREATE TABLE IF NOT EXISTS Employees (
  EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT,
  FirstName TEXT,
  LastName TEXT,
  Age INTEGER
);

-- Crear tabla Customers
CREATE TABLE IF NOT EXISTS Customers (
  CustomerID INTEGER PRIMARY KEY AUTOINCREMENT, 
  FirstName TEXT,
  LastName TEXT,
  Email TEXT 
);

-- Crear tabla Products
CREATE TABLE IF NOT EXISTS Products (
  ProductID INTEGER PRIMARY KEY AUTOINCREMENT,
  ProductName TEXT,
  Price REAL
);

-- Crear tabla Orders con clave foranea (depende de Employees)
CREATE TABLE IF NOT EXISTS Orders (
  OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
  EmployeeID INTEGER,
  OrderDate DATE,
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Crear tabla OrderItems con claves foráneas (depende de Employees y Orders)
CREATE TABLE IF NOT EXISTS OrderItems (
  OrderItemID INTEGER PRIMARY KEY AUTOINCREMENT,
  OrderID INTEGER,
  ProductID INTEGER,
  Quantity INTEGER,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insertar datos en la tabla Employees
INSERT INTO Employees (FirstName, LastName, Age) 
VALUES 
('John', 'Doe', 30), 
('Jane', 'Doe', 32), 
('Alice', 'Johnson', 28), 
('Bob', 'Smith', 45);


-- Insertar datos en la tabla Customers
INSERT INTO Customers (FirstName, LastName, Email)
VALUES
('Slavok', 'Sizek', 'slavok@gmail.com'),
('Alice', 'Johnson', 'alice@gmail.com'), 
('Yanis', 'Varoufakis', 'yanis@gmail.com'),
('Steve', 'Morris', 'steve@gmail.com'),
('Tom', 'Bailey', 'thomas@gmail.com'),
('Bob', 'Smith', 'robert@gmail.com');

-- Insertar datos en la tabla Products
INSERT INTO Products (ProductName, Price) 
VALUES 
('Apples', 1.20), 
('Bananas', 0.75), 
('Cherries', 2.00), 
('Dates', 3.00),
('Eclair', 2.50);

-- Insertar datos en la tabla Orders
INSERT INTO Orders (EmployeeID, OrderDate) 
VALUES 
(1, '2023-01-01'), 
(2, '2023-01-02'), 
(3, '2023-01-03'), 
(1, '2023-01-04'), 
(2, '2023-01-05');

-- Insertar datos en la tabla OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity) 
VALUES 
(1, 1, 10), 
(2, 2, 15), 
(3, 3, 20), 
(4, 4, 25), 
(5, 5, 30);