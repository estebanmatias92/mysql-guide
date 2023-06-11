# SQL y sus cláusulas (queries)

## 1. Introducción a las bases de datos y SQL

Una base de datos es un conjunto organizado de datos. SQL (Structured Query Language) **es un lenguaje que se utiliza para interactuar con bases de datos**, como recuperar datos, insertar registros, actualizar registros y eliminar registros.

Para nuestros ejemplos, utilizaremos tres tablas de datos imaginarias: "Employees", "Products" y "Orders", y una tabla de unión "OrderItems".

_Tabla "Employees":_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 32  |
| 3          | Alice     | Johnson  | 28  |
| 4          | Bob       | Smith    | 45  |

_Tabla "Products":_

| ProductID | ProductName  | Price |
|-----------|--------------|-------|
| 1         | Apples       | 1.20  |
| 2         | Bananas      | 0.75  |
| 3         | Cherries     | 2.00  |
| 4         | Dates        | 3.00  |
| 5         | Eclair       | 2.50  |

_Tabla "Orders":_

| OrderID | EmployeeID | OrderDate  |
|---------|------------|------------|
| 1       | 1          | 2023-01-01 |
| 2       | 2          | 2023-01-02 |
| 3       | 3          | 2023-01-03 |
| 4       | 1          | 2023-01-04 |
| 5       | 2          | 2023-01-05 |

_Tabla "OrderItems":_

| OrderItemID | OrderID | ProductID | Quantity |
|-------------|---------|-----------|----------|
| 1           | 1       | 1         | 10       |
| 2           | 2       | 2         | 15       |
| 3           | 3       | 3         | 20       |
| 4           | 4       | 4         | 25       |
| 5           | 5       | 5         | 30       |

## 2. Creación de las Tablas e Inserción de Datos

Para poder seguir los ejemplos, primero debemos crear la base de datos, sus tablas y llenarlas con datos.

Usaremos [SQLite3](https://www.sqlite.org/2023/sqlite-tools-win32-x86-3420000.zip) como manejador de base de datos, donde cada archivo es una base de datos distinta, y no se necesita de las queries `CREATE DATABASE shopping;`, ni `USE shopping;`

Y [DB Browser](https://download.sqlitebrowser.org/DB.Browser.for.SQLite-3.12.2-win32.msi) como cliente grafico de SQL, para visualizar nuestra base de datos.

Y por ultimo, el script "[demo-script.sql](https://github.com/estebanmatias92/curso-python-avanzado-plan-de-estudio-CFL415/blob/main/modulo-2/demo/demo-script.sql)", para inicializar nuestra base de datos, con las tablas y datos descritos anteriormente.

_Nota: Tambien se puede [usar sqlite3 desde la terminal e inicializar la Database desde alli](https://chat.openai.com/share/f998c329-097d-47dd-9fd9-16720ff88f2d)._

## 3. CLausulas SQL y Funciones de Agregacion

### 1. SELECT

Este comando se utiliza para seleccionar datos de una base de datos. Los datos devueltos se almacenan en una tabla de resultados, llamada conjunto de resultados.

_Ejemplo:_

```sql
SELECT * FROM Employees;
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 32  |
| 3          | Alice     | Johnson  | 28  |
| 4          | Bob       | Smith    | 45  |

### 2. WHERE

Este comando se utiliza para filtrar registros.

_Ejemplo:_

```sql
SELECT * FROM Employees WHERE Age > 30;
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 2          | Jane      | Doe      | 32  |
| 4          | Bob       | Smith    | 45  |

### 3. INSERT INTO

Este comando se utiliza para insertar nuevos registros en una tabla.

_Ejemplo:_

```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age) VALUES (5, 'Charlie', 'Brown', 22);
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 32  |
| 3          | Alice     | Johnson  | 28  |
| 4          | Bob       | Smith    | 45  |
| 5          | Charlie   | Brown    | 22  |

### 4. UPDATE

Este comando se utiliza para modificar los registros existentes en una tabla.

_Ejemplo:_

```sql
UPDATE Employees SET Age = 33 WHERE EmployeeID = 2;
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 33  |
| 3          | Alice     | Johnson  | 28  |
| 4          | Bob       | Smith    | 45  |
| 5          | Charlie   | Brown    | 22  |

### 5. DELETE

Este comando se utiliza para eliminar registros existentes de una tabla.

_Ejemplo:_

```sql
DELETE FROM Employees WHERE EmployeeID = 5;
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 33  |
| 3          | Alice     | Johnson  | 28  |
| 4          | Bob       | Smith    | 45  |

### 6. JOIN

Este comando se utiliza para combinar filas de dos o más tablas, basándose en una columna relacionada entre ellas.

_Ejemplo:_

```sql
SELECT Orders.OrderID, Employees.FirstName, Employees.LastName 
FROM Orders 
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;
```

_Resultado:_

| OrderID | FirstName | LastName |
|---------|-----------|----------|
| 1       | John      | Doe      |
| 2       | Jane      | Doe      |
| 3       | Alice     | Johnson  |
| 4       | John      | Doe      |
| 5       | Jane      | Doe      |

### 7. LEFT JOIN

Este comando se utiliza para devolver todas las filas de la tabla izquierda, y las filas correspondientes de la tabla derecha. Si no hay coincidencia, el resultado es NULL en el lado derecho.

_Ejemplo:_

```sql
SELECT Employees.FirstName, Employees.LastName, Orders.OrderID 
FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;
```

_Resultado:_

| FirstName | LastName | OrderID |
|-----------|----------|---------|
| John      | Doe      | 1       |
| Jane      | Doe      | 2       |
| Alice     | Johnson  | 3       |
| Bob       | Smith    | NULL    |
| John      | Doe      | 4       |
| Jane      | Doe      | 5       |

### 8. RIGHT JOIN

Este comando se utiliza para devolver todas las filas de la tabla derecha, y las filas correspondientes de la tabla izquierda. Si no hay coincidencia, el resultado es NULL en el lado izquierdo. Tenga en cuenta que SQLite no soporta la cláusula RIGHT JOIN, pero se puede lograr el mismo resultado con una combinación de LEFT JOIN y UNION.

_Ejemplo:_

```sql
SELECT Employees.FirstName, Employees.LastName, Orders.OrderID 
FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
UNION
SELECT Employees.FirstName, Employees.LastName, Orders.OrderID 
FROM Orders 
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;
```

_Resultado:_

| FirstName | LastName | OrderID |
|-----------|----------|---------|
| John      | Doe      | 1       |
| Jane      | Doe      | 2       |
| Alice     | Johnson  | 3       |
| Bob       | Smith    | NULL    |
| NULL      | NULL     | 4       |
| NULL      | NULL     | 5       |

### 9. INNER JOIN

Este comando se utiliza para seleccionar registros que tienen campos coincidentes en ambas tablas.

_Ejemplo:_

```sql
SELECT Orders.OrderID, Employees.FirstName, Employees.LastName, OrderItems.ProductID, OrderItems.Quantity
FROM ((Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
INNER JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID);
```

_Resultado:_

| OrderID | FirstName | LastName | ProductID | Quantity |
|---------|-----------|----------|-----------|----------|
| 1       | John      | Doe      | 1         | 10       |
| 2       | Jane      | Doe      | 2         | 15       |
| 3       | Alice     | Johnson  | 3         | 20       |
| 4       | John      | Doe      | 4         | 25       |
| 5       | Jane      | Doe      | 5         | 30       |

### 10. GROUP BY

Este comando se utiliza en conjunto con las funciones de agregación para agrupar el conjunto de resultados por una o más columnas.

_Ejemplo:_

```sql
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) as OrderCount 
FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
GROUP BY Employees.EmployeeID;
```

_Resultado:_

| FirstName | LastName | OrderCount |
|-----------|----------|------------|
| John      | Doe      | 2          |
| Jane      | Doe      | 2          |
| Alice     | Johnson  | 1          |
| Bob       | Smith    | 0          |

### 11. HAVING

Este comando se utiliza para filtrar los resultados de una consulta que incluye una cláusula GROUP BY, similar a cómo se utiliza WHERE con SELECT.

_Ejemplo:_

```sql
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) as OrderCount 
FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID 
GROUP BY Employees.EmployeeID
HAVING COUNT(Orders.OrderID) > 1;
```

_Resultado:_

| FirstName | LastName | OrderCount |
|-----------|----------|------------|
| John      | Doe      | 2          |
| Jane      | Doe      | 2          |

### 12. ORDER BY

Este comando se utiliza para ordenar el conjunto de resultados en orden ascendente o descendente según una o más columnas.

_Ejemplo:_

```sql
SELECT * FROM Employees ORDER BY Age DESC;
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 4          | Bob       | Smith    | 45  |
| 2          | Jane      | Doe      | 33  |
| 1          | John      | Doe      | 30  |
| 3          | Alice     | Johnson  | 28  |

### 13. DISTINCT

Este comando se utiliza para retornar solo registros distintos (diferentes) en el conjunto de resultados.

_Ejemplo:_

```sql
SELECT DISTINCT Age FROM Employees;
```

_Resultado:_

| Age |
|-----|
| 45  |
| 33  |
| 30  |
| 28  |

### 14. COUNT

Esta función se utiliza para retornar el número de filas que coinciden con un criterio especificado.

_Ejemplo:_

```sql
SELECT COUNT(*) FROM Employees WHERE Age > 30;
```

_Resultado:_

| COUNT(*) |
|----------|
| 2        |

### 15. AVG

Esta función se utiliza para retornar el valor promedio de una columna numérica.

_Ejemplo:_

```sql
SELECT AVG(Age) FROM Employees;
```

_Resultado:_

| AVG(Age) |
|----------|
| 34       |

### 16. MIN y MAX

Estas funciones se utilizan para retornar el valor mínimo y máximo de una columna numérica, respectivamente.

_Ejemplo:_

```sql
SELECT MIN(Age), MAX(Age) FROM Employees;
```

_Resultado:_

| MIN(Age) | MAX(Age) |
|----------|----------|
| 28       | 45       |

### 17. SUM

Esta función se utiliza para retornar la suma total de una columna numérica.

_Ejemplo:_

```sql
SELECT SUM(Quantity) FROM OrderItems WHERE ProductID = 1;
```

_Resultado:_

| SUM(Quantity) |
|---------------|
| 100           |

### 18. LIKE

Este comando se utiliza en una cláusula WHERE para buscar un patrón especificado en una columna.

_Ejemplo:_

```sql
SELECT * FROM Employees WHERE FirstName LIKE 'J%';
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 33  |

### 19. IN

Este comando se utiliza para permitir múltiples valores en una cláusula WHERE.

_Ejemplo:_

```sql
SELECT * FROM Employees WHERE EmployeeID IN (1, 2);
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 33  |

### 20. BETWEEN

Este comando se utiliza para seleccionar valores dentro de un rango. Los valores pueden ser números, texto o fechas.

_Ejemplo:_

```sql
SELECT * FROM Employees WHERE Age BETWEEN 30 AND 40;
```

_Resultado:_

| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1          | John      | Doe      | 30  |
| 2          | Jane      | Doe      | 33  |

### 21. UNION

Este comando se utiliza para combinar el conjunto de resultados de dos o más consultas SELECT. La UNION elimina los registros duplicados (donde todas las columnas en los resultados son idénticas).

_Ejemplo:_

```sql
SELECT FirstName FROM Employees 
UNION 
SELECT FirstName FROM Customers;
```

_Resultado:_

| FirstName |
|-----------|
| John      |
| Jane      |
| Alice     |
| Bob       |
| Charlie   |
| David     |

### 22. UNION ALL

Este comando se utiliza para combinar el conjunto de resultados de dos o más consultas SELECT. UNION ALL no eliminará los registros duplicados.

_Ejemplo:_

```sql
SELECT FirstName FROM Employees 
UNION ALL
SELECT FirstName FROM Customers;
```

_Resultado:_

| FirstName |
|-----------|
| John      |
| Jane      |
| Alice     |
| Bob       |
| Charlie   |
| David     |
| Alice     |
| Bob       |

### 23. SUBCONSULTA

Una subconsulta es una consulta que se encuentra dentro de otra consulta. Se pueden utilizar en SELECT, INSERT, UPDATE, DELETE y en la cláusula WHERE para definir criterios más avanzados.

_Ejemplo:_

Supongamos que quieres encontrar todos los pedidos hechos por el empleado más joven. Podrías hacerlo de la siguiente manera:

```sql
SELECT * 
FROM Orders
WHERE EmployeeID IN (
    SELECT EmployeeID 
    FROM Employees 
    WHERE Age = (SELECT MIN(Age) FROM Employees)
);

```

_Resultado:_

| OrderID  | EmployeeID | Product  |
|----------|------------|----------|
| 3        | 3          | Cherries |

### 24. NULL

En SQL, NULL es el término usado para representar un valor perdido o desconocido.

_Ejemplo:_

```sql
SELECT * FROM Employees WHERE LastName IS NULL;
```

_Resultado:_

Ningún resultado, ya que en nuestras tablas imaginarias no hay empleados con el campo "LastName" nulo.

### 25. ALTER TABLE

Este comando se utiliza para agregar, eliminar/desactivar o modificar columnas en una tabla existente.

_Ejemplo:_

```sql
ALTER TABLE Employees ADD Email text;
```

Resultado: La tabla "Employees" ahora tiene una nueva columna llamada "Email".

### 26. DROP TABLE

Este comando se utiliza para eliminar una tabla existente en una base de datos.

_Ejemplo:_

```sql
DROP TABLE Customers;
```

Resultado: La tabla "Customers" ha sido eliminada de la base de datos.

### 27. CREATE DATABASE

Este comando se utiliza para crear una nueva base de datos en SQL.

_Ejemplo:_

```sql
CREATE DATABASE TestDatabase;
```

Resultado: Se ha creado una nueva base de datos llamada "TestDatabase".

### 28. USE DATABASE

Este comando se utiliza para seleccionar una base de datos SQL específica en la que se realizarán todas las operaciones siguientes.

Nota: Este comando es soportado en sistemas de gestión de bases de datos como MySQL y SQL Server, pero no es soportado en SQLite.

_Ejemplo:_

```sql
USE TestDatabase;
```

Resultado: Todas las operaciones siguientes se realizarán en la base de datos "TestDatabase".

### 29. ALTER DATABASE

Este comando se utiliza para modificar la base de datos.

Nota: Este comando no es soportado en SQLite. Pero en otros sistemas de gestión de bases de datos, como SQL Server, se puede utilizar para cambiar el nombre de la base de datos, modificar el tamaño de la base de datos, etc.

### 30. CREATE INDEX

Este comando se utiliza para crear un índice en una tabla. Los índices son utilizados para recuperar datos de la base de datos más rápidamente que sin utilizar índices.

_Ejemplo:_

```sql
CREATE INDEX idx_Employees_Age ON Employees(Age);
```

Resultado: Se ha creado un índice en la tabla "Employees" para la columna "Age".

### 31. DROP INDEX

Este comando se utiliza para eliminar un índice existente en una tabla.

_Ejemplo:_

```sql
DROP INDEX idx_Employees_Age;
```

Resultado: Se ha eliminado el índice "idx_Employees_Age" de la tabla "Employees".
