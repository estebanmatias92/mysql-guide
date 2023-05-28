
-- Eliminar la tabla Employees si existe
DROP TABLE IF EXISTS Employees;

-- Crear tabla Employees, dentro de la base de datos Shopping
CREATE TABLE IF NOT EXISTS Employees (
  EmployeeID INTEGER PRIMARY KEY,
  FirstName TEXT,
  LastName TEXT,
  Age INTEGER
);

-- Insertar datos en la tabla Employees
INSERT INTO Employees (FirstName, LastName, Age) 
VALUES 
('John', 'Doe', 30), 
('Jane', 'Doe', 32), 
('Alice', 'Johnson', 28), 
('Bob', 'Smith', 45);

-- Eliminar la tabla Products si existe
DROP TABLE IF EXISTS Products;

-- Crear tabla Products
CREATE TABLE IF NOT EXISTS Products (
  ProductID INTEGER PRIMARY KEY,
  ProductName TEXT,
  Price REAL
);

-- Insertar datos en la tabla Products
INSERT INTO Products (ProductName, Price) 
VALUES 
('Apples', 1.20), 
('Bananas', 0.75), 
('Cherries', 2.00), 
('Dates', 3.00),
('Eclair', 2.50);

-- Eliminar la tabla Orders si existe
DROP TABLE IF EXISTS Orders;

-- Crear tabla Orders
CREATE TABLE IF NOT EXISTS Orders (
  OrderID INTEGER PRIMARY KEY,
  EmployeeID INTEGER,
  OrderDate DATE,
  FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insertar datos en la tabla Orders
INSERT INTO Orders (EmployeeID, OrderDate) 
VALUES 
(1, '2023-01-01'), 
(2, '2023-01-02'), 
(3, '2023-01-03'), 
(1, '2023-01-04'), 
(2, '2023-01-05');

-- Eliminar la tabla OrderItems si existe
DROP TABLE IF EXISTS OrderItems;

-- Crear tabla OrderItems con claves foráneas
CREATE TABLE IF NOT EXISTS OrderItems (
  OrderItemID INTEGER,
  OrderID INTEGER,
  ProductID INTEGER,
  Quantity INTEGER,
  PRIMARY KEY (OrderItemID),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insertar datos en la tabla OrderItems
INSERT INTO OrderItems (OrderID, ProductID, Quantity) 
VALUES 
(1, 1, 10), 
(2, 2, 15), 
(3, 3, 20), 
(4, 4, 25), 
(5, 5, 30);