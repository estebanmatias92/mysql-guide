CREATE DATABASE TestDB;

USE TestDB;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
    Product VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Age) VALUES (1, 'John', 'Doe', 30);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age) VALUES (2, 'Jane', 'Doe', 32);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age) VALUES (3, 'Alice', 'Johnson', 28);
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age) VALUES (4, 'Bob', 'Smith', 45);

INSERT INTO Orders (OrderID, EmployeeID, Product) VALUES (1, 1, 'Apples');
INSERT INTO Orders (OrderID, EmployeeID, Product) VALUES (2, 2, 'Bananas');
INSERT INTO Orders (OrderID, EmployeeID, Product) VALUES (3, 3, 'Cherries');
INSERT INTO Orders (OrderID, EmployeeID, Product) VALUES (4, 1, 'Dates');
INSERT INTO Orders (OrderID, EmployeeID, Product) VALUES (5, 2, 'Eclair');