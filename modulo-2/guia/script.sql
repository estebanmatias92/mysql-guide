DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);

DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
    Product VARCHAR(50)
);

INSERT INTO Employees (FirstName, LastName, Age) VALUES ('John', 'Doe', 30);
INSERT INTO Employees (FirstName, LastName, Age) VALUES ('Jane', 'Doe', 32);
INSERT INTO Employees (FirstName, LastName, Age) VALUES ('Alice', 'Johnson', 28);
INSERT INTO Employees (FirstName, LastName, Age) VALUES ('Bob', 'Smith', 45);

INSERT INTO Orders (EmployeeID, Product) VALUES (1, 'Apples');
INSERT INTO Orders (EmployeeID, Product) VALUES (2, 'Bananas');
INSERT INTO Orders (EmployeeID, Product) VALUES (3, 'Cherries');
INSERT INTO Orders (EmployeeID, Product) VALUES (1, 'Dates');
INSERT INTO Orders (EmployeeID, Product) VALUES (2, 'Eclair');