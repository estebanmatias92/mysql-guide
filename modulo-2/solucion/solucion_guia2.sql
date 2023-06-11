-- Ejercicio 1
-- Agregar un empleado nuevo a la tabla "Employees".
INSERT INTO Employees (FirstName, LastName, Age) 
VALUES ('James', 'Peterson', 40);


-- Ejercicio 2
-- Modificar la edad de "Jane Doe" a 35 años. 
UPDATE Employees 
SET Age = 35 
WHERE FirstName = 'Jane' AND LastName = 'Doe';


-- Ejercicio 3
-- Buscar los empleados que tienen 30 años o más.
SELECT * FROM Employees 
WHERE Age >= 30;


-- Ejercicio 4
-- Agregar un pedido de "Fruits" realizado por James Peterson a la tabla "Orders". 
INSERT INTO Orders (EmployeeID, Product) 
VALUES (5, 'Fruits');


-- Ejercicio 5
-- Buscar todos los pedidos realizados por Jane Doe.
SELECT * FROM Orders 
WHERE EmployeeID = 2;


-- Ejercicio 6
-- Eliminar el empleado "Alice Johnson".
DELETE FROM Employees 
WHERE FirstName = 'Alice' AND LastName = 'Johnson';


-- Ejercicio 7
-- Modificar el pedido "Fruits" a "Berries" realizado por James Peterson.
UPDATE Orders 
SET Product = 'Berries' 
WHERE OrderID = 6;


-- Ejercicio 8
-- Buscar todos los pedidos y a qué empleado pertenecen.
SELECT E.FirstName, O.Product 
FROM Orders O 
JOIN Employees E ON O.EmployeeID = E.EmployeeID;


-- Ejercicio 9
-- Agrupar todos los empleados por edad y contar cuántos hay de cada edad.
SELECT Age, COUNT(EmployeeID) 
FROM Employees 
GROUP BY Age;


-- Ejercicio 10
-- Listar todos los empleados en orden descendente por edad. 
SELECT * FROM Employees ORDER BY Age DESC;


-- Ejercicio 11: 
-- Encuentra todos los pedidos realizados por el empleado de menor edad.
SELECT * 
FROM Orders
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM Employees 
    WHERE Age = (SELECT MIN(Age) FROM Employees)
);


-- Ejercicio 12: 
-- Encuentra los productos que han sido pedidos más de una vez.
SELECT Product, COUNT(OrderID) as OrderCount 
FROM Orders 
GROUP BY Product 
HAVING OrderCount > 1;


-- Ejercicio 13 (opcional):
-- Encuentra todos los pedidos hechos por el empleado con más pedidos.
SELECT * 
FROM Orders
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM Orders
    GROUP BY EmployeeID
    HAVING COUNT(OrderID) = (
        SELECT MAX(OrderCount) 
        FROM (
            SELECT COUNT(OrderID) AS OrderCount 
            FROM Orders 
            GROUP BY EmployeeID
        )
    )
);
