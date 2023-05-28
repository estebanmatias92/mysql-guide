-- Eliminar primero la tabla Orders si existe
DROP TABLE IF EXISTS Orders;
-- Eliminar luego la tabla Employees si existe
DROP TABLE IF EXISTS Employees;

-- Crear primero la tabla Employees
CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL,
    LastName TEXT NOT NULL,
    Age INTEGER
);

-- Crear luego la tabla Orders que depende de Employees por su clave foranea
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    EmployeeID INTEGER NOT NULL,
    Product TEXT NOT NULL,
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insertar Datos en Employees
INSERT INTO Employees (FirstName, LastName, Age) VALUES ('John', 'Doe', 30);
INSERT INTO Employees (FirstName, LastName, Age) VALUES ('Jane', 'Doe', 32);
INSERT INTO Employees (FirstName, LastName, Age) VALUES ('Alice', 'Johnson', 28);
INSERT INTO Employees (FirstName, LastName, Age) VALUES ('Bob', 'Smith', 45);

-- Insertar Datos en Orders
INSERT INTO Orders (EmployeeID, Product) VALUES (1, 'Apples');
INSERT INTO Orders (EmployeeID, Product) VALUES (2, 'Bananas');
INSERT INTO Orders (EmployeeID, Product) VALUES (3, 'Cherries');
INSERT INTO Orders (EmployeeID, Product) VALUES (1, 'Dates');
INSERT INTO Orders (EmployeeID, Product) VALUES (2, 'Eclair');
