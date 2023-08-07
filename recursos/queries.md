# SQL y sus cláusulas (queries)

## 1. Introducción a las bases de datos y SQL

Una base de datos es un conjunto organizado de datos. SQL (Structured Query Language) **es un lenguaje que se utiliza para interactuar con bases de datos**, como recuperar datos, insertar registros, actualizar registros y eliminar registros.

Para nuestros ejemplos, utilizaremos tres tablas de datos imaginarias: "Employees", "Products" y "Orders", y una tabla de unión "OrderItems".

_Tabla "Employees":_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 32 |
| 3 | Alice | Johnson | 28 |
| 4 | Bob | Smith | 45 |

_Tabla "Customers":_
| CustomerID | FirstName | LastName | Email |
|------------|-----------|------------|------------------|
| 1 | Slavoj | Zizek | <slavoj@gmail.com> |
| 2 | Alice | Johnson | <alice@gmail.com> |
| 3 | Yanis | Varoufakis | <yanis@gmail.com> |
| 4 | Steve | Morris | <steve@gmail.com> |
| 5 | Tom | Bailey | <thomas@gmail.com> |
| 6 | Bob | Smith | <robert@gmail.com> |

_Tabla "Products":_
| ProductID | ProductName | Price |
|-----------|--------------|-------|
| 1 | Apples | 1.20 |
| 2 | Bananas | 0.75 |
| 3 | Cherries | 2.00 |
| 4 | Dates | 3.00 |
| 5 | Eclair | 2.50 |

_Tabla "Orders":_
| OrderID | EmployeeID | OrderDate |
|---------|------------|------------|
| 1 | 1 | 2023-01-01 |
| 2 | 2 | 2023-01-02 |
| 3 | 3 | 2023-01-03 |
| 4 | 1 | 2023-01-04 |
| 5 | 2 | 2023-01-05 |

_Tabla "OrderItems":_
| OrderItemID | OrderID | ProductID | Quantity |
|-------------|---------|-----------|----------|
| 1 | 1 | 1 | 10 |
| 2 | 2 | 2 | 15 |
| 3 | 3 | 3 | 20 |
| 4 | 4 | 4 | 25 |
| 5 | 5 | 5 | 30 |

## 2. Creación de las Tablas e Inserción de Datos

Para poder seguir los ejemplos, primero debemos crear la base de datos, sus tablas y llenarlas con datos.

Usaremos MySQL como manejador de base de datos. Para iniciar MySQL desde la consola por primera vez, puedes seguir las instrucciones en la [documentación oficial de MySQL](https://dev.mysql.com/doc/mysql-getting-started/en/).

Y por último, el script "[demo-script.sql](https://github.com/estebanmatias92/mysql-guide/blob/main/demo/demo-script.sql)", para inicializar nuestra base de datos, con las tablas y datos descritos anteriormente.

_Nota: También se puede [usar MySQL desde la terminal e inicializar la Database desde allí](https://dev.mysql.com/doc/mysql-getting-started/en/)._

## 3. Cláusulas SQL y Funciones de Agregación

### 1. SELECT

Este comando se utiliza para seleccionar datos de una base de datos. Los datos devueltos se almacenan en una tabla de resultados, llamada conjunto de resultados.

_Ejemplo:_
Imagina que deseas obtener la lista de todos los empleados de tu empresa, para ello utilizarías el comando SELECT.

```sql
SELECT * FROM Employees;
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 32 |
| 3 | Alice | Johnson | 28 |
| 4 | Bob | Smith | 45 |

### 2. WHERE

Este comando se utiliza para filtrar registros.

_Ejemplo:_
Si quieres encontrar a los empleados que tienen más de 30 años, podrías utilizar la cláusula WHERE para filtrar los resultados.

```sql
SELECT * FROM Employees WHERE Age > 30;
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 2 | Jane | Doe | 32 |
| 4 | Bob | Smith | 45 |

### 3. INSERT INTO

Este comando se utiliza para insertar nuevos registros en una tabla.

_Ejemplo:_
Imagina que tienes un nuevo empleado que necesita ser agregado a tu base de datos, utilizarías INSERT INTO para agregar sus detalles a la tabla de empleados.

```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, Age) VALUES (5, 'Charlie', 'Brown', 22);
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 32 |
| 3 | Alice | Johnson | 28 |
| 4 | Bob | Smith | 45 |
| 5 | Charlie | Brown | 22 |

### 4. UPDATE

Este comando se utiliza para modificar los registros existentes en una tabla.

_Ejemplo:_
Si un empleado cambia su dirección de correo electrónico, necesitarías actualizar esa información en la base de datos, y para ello utilizarías el comando UPDATE.

```sql
UPDATE Employees SET Age = 33 WHERE EmployeeID = 2;
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 33 |
| 3 | Alice | Johnson | 28 |
| 4 | Bob | Smith | 45 |
| 5 | Charlie | Brown | 22 |

### 5. DELETE

Este comando se utiliza para eliminar registros existentes de una tabla.

_Ejemplo:_
Supón que un empleado deja la empresa y quieres eliminar su registro de la base de datos, utilizarías el comando DELETE para hacerlo.

```sql
DELETE FROM Employees WHERE EmployeeID = 5;
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 33 |
| 3 | Alice | Johnson | 28 |
| 4 | Bob | Smith | 45 |

### 6. JOIN

Este comando se utiliza para combinar filas de dos o más tablas, basándose en una relación entre ciertas columnas en estas tablas.

_Ejemplo:_
Si quieres ver una lista de todos los pedidos junto con el nombre del empleado que los hizo, podrías utilizar JOIN para combinar las tablas "Orders" y "Employees".

```sql
SELECT Orders.OrderID, Employees.FirstName, Employees.LastName 
FROM Orders 
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;
```

_Resultado:_
| OrderID | FirstName | LastName |
|---------|-----------|----------|
| 1 | John | Doe |
| 2 | Jane | Doe |
| 3 | Alice | Johnson |
| 4 | John | Doe |
| 5 | Jane | Doe |

### 7. GROUP BY

Este comando se utiliza a menudo con funciones de agregación (COUNT, MAX, MIN, SUM, AVG) para agrupar el conjunto de resultados por una o más columnas.

_Ejemplo:_
Si quieres saber cuántos pedidos ha hecho cada empleado, podrías utilizar GROUP BY para agrupar los pedidos por empleado.

```sql
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) 
FROM Orders 
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID 
GROUP BY Employees.EmployeeID;
```

_Resultado:_
| FirstName | LastName | COUNT(Orders.OrderID) |
|-----------|----------|-----------------------|
| John | Doe | 2 |
| Jane | Doe | 2 |
| Alice | Johnson | 1 |

### 8. HAVING

Este comando se utiliza para filtrar los resultados de las funciones de agregación.

_Ejemplo:_
Si quieres saber qué empleados han hecho más de un pedido, podrías utilizar HAVING para filtrar los resultados.

```sql
SELECT Employees.FirstName, Employees.LastName, COUNT(Orders.OrderID) 
FROM Orders 
JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID 
GROUP BY Employees.EmployeeID 
HAVING COUNT(Orders.OrderID) > 1;
```

_Resultado:_
| FirstName | LastName | COUNT(Orders.OrderID) |
|-----------|----------|-----------------------|
| John | Doe | 2 |
| Jane | Doe | 2 |

### 9. ORDER BY

Este comando se utiliza para ordenar el conjunto de resultados en orden ascendente o descendente.

_Ejemplo:_
Si quieres ver una lista de empleados ordenada por edad, podrías utilizar ORDER BY para ordenar los resultados.

```sql
SELECT * FROM Employees ORDER BY Age;
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 3 | Alice | Johnson | 28 |
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 33 |
| 4 | Bob | Smith | 45 |

### 10. LIMIT

Este comando se utiliza para especificar el número máximo de registros a devolver.

_Ejemplo:_
Si solo quieres ver los primeros 3 empleados en tu lista ordenada por edad, podrías utilizar LIMIT para limitar los resultados.

```sql
SELECT * FROM Employees ORDER BY Age LIMIT 3;
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 3 | Alice | Johnson | 28 |
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 33 |

### 11. DISTINCT

Este comando se utiliza para devolver solo valores distintos (diferentes).

_Ejemplo:_
Si quieres ver una lista de todas las edades distintas de tus empleados, podrías utilizar DISTINCT para eliminar los duplicados.

```sql
SELECT DISTINCT Age FROM Employees;
```

_Resultado:_
| Age |
|-----|
| 28 |
| 30 |
| 33 |
| 45 |

### 12. COUNT

Esta es una función de agregación que se utiliza para contar el número de filas que coinciden con un criterio específico.

_Ejemplo:_
Si quieres saber cuántos empleados tienes en total, podrías utilizar COUNT para contar todos los registros en la tabla de empleados.

```sql
SELECT COUNT(*) FROM Employees;
```

_Resultado:_
| COUNT(*) |
|----------|
| 4 |

### 13. SUM

Esta es una función de agregación que se utiliza para sumar todos los valores de una columna específica.

_Ejemplo:_
Si quieres saber cuántos productos se han vendido en total, podrías utilizar SUM para sumar todos los valores en la columna "Quantity" de la tabla "OrderItems".

```sql
SELECT SUM(Quantity) FROM OrderItems;
```

_Resultado:_
| SUM(Quantity) |
|---------------|
| 100 |

### 14. AVG

Esta es una función de agregación que se utiliza para calcular el valor medio de una columna específica.

_Ejemplo:_
Si quieres saber la edad media de tus empleados, podrías utilizar AVG para calcular el valor medio de la columna "Age" en la tabla "Employees".

```sql
SELECT AVG(Age) FROM Employees;
```

_Resultado:_
| AVG(Age) |
|----------|
| 34 |

### 15. MIN y MAX

Estas son funciones de agregación que se utilizan para encontrar el valor mínimo y máximo de una columna específica, respectivamente.

_Ejemplo:_
Si quieres saber cuál es la edad del empleado más joven y del más viejo, podrías utilizar MIN y MAX para encontrar los valores mínimo y máximo de la columna "Age" en la tabla "Employees".

```sql
SELECT MIN(Age), MAX(Age) FROM Employees;
```

_Resultado:_
| MIN(Age) | MAX(Age) |
|----------|----------|
| 28 | 45 |

### 16. INNER JOIN

Este comando se utiliza para seleccionar registros que tienen valores coincidentes en ambas tablas.

_Ejemplo:_
Si quieres ver una lista de todos los pedidos junto con el nombre del producto y la cantidad pedida, podrías utilizar INNER JOIN para combinar las tablas "OrderItems" y "Products".

```sql
SELECT OrderItems.OrderID, Products.ProductName, OrderItems.Quantity 
FROM OrderItems 
INNER JOIN Products ON OrderItems.ProductID = Products.ProductID;
```

_Resultado:_
| OrderID | ProductName | Quantity |
|---------|-------------|----------|
| 1 | Apples | 10 |
| 2 | Bananas | 15 |
| 3 | Cherries | 20 |
| 4 | Dates | 25 |
| 5 | Eclair | 30 |

### 17. LEFT JOIN (o LEFT OUTER JOIN)

Este comando se utiliza para seleccionar todos los registros de la tabla izquierda, y los registros coincidentes de la tabla derecha. El resultado es NULL en el lado derecho si no hay coincidencia.

_Ejemplo:_
Si quieres ver una lista de todos los empleados junto con los pedidos que han hecho (si los hay), podrías utilizar LEFT JOIN para combinar las tablas "Employees" y "Orders".

```sql
SELECT Employees.FirstName, Employees.LastName, Orders.OrderID 
FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;
```

_Resultado:_
| FirstName | LastName | OrderID |
|-----------|----------|---------|
| John | Doe | 1 |
| John | Doe | 4 |
| Jane | Doe | 2 |
| Jane | Doe | 5 |
| Alice | Johnson | 3 |
| Bob | Smith | NULL |

### 18. RIGHT JOIN (o RIGHT OUTER JOIN)

Este comando se utiliza para seleccionar todos los registros de la tabla derecha, y los registros coincidentes de la tabla izquierda. El resultado es NULL en el lado izquierdo si no hay coincidencia.

_Ejemplo:_
Si quieres ver una lista de todos los pedidos junto con el nombre del empleado que los hizo (si los hay), podrías utilizar RIGHT JOIN para combinar las tablas "Employees" y "Orders".

```sql
SELECT Employees.FirstName, Employees.LastName, Orders.OrderID 
FROM Employees 
RIGHT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;
```

_Resultado:_
| FirstName | LastName | OrderID |
|-----------|----------|---------|
| John | Doe | 1 |
| Jane | Doe | 2 |
| Alice | Johnson | 3 |
| John | Doe | 4 |
| Jane | Doe | 5 |

### 19. FULL JOIN (o FULL OUTER JOIN)

Este comando se utiliza para seleccionar todos los registros cuando hay una coincidencia en la tabla izquierda o la tabla derecha.

_Nota: MySQL no soporta directamente FULL JOIN, pero puedes lograr el mismo resultado combinando LEFT JOIN y UNION._

_Ejemplo:_
Si quieres ver una lista de todos los empleados y todos los pedidos, podrías utilizar FULL JOIN para combinar las tablas "Employees" y "Orders".

```sql
SELECT Employees.FirstName, Employees.LastName, Orders.OrderID 
FROM Employees 
LEFT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
UNION
SELECT Employees.FirstName, Employees.LastName, Orders.OrderID 
FROM Employees 
RIGHT JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;
```

_Resultado:_
| FirstName | LastName | OrderID |
|-----------|----------|---------|
| John | Doe | 1 |
| Jane | Doe | 2 |
| Alice | Johnson | 3 |
| John | Doe | 4 |
| Jane | Doe | 5 |
| Bob | Smith | NULL |

### 20. SELF JOIN

Este comando se utiliza para unir una tabla a sí misma como si la tabla fuera dos tablas, renombrándola temporalmente para su uso en la consulta.

_Ejemplo:_
Si quieres encontrar los pares de empleados que tienen la misma edad, podrías utilizar SELF JOIN para unir la tabla "Employees" a sí misma.

```sql
SELECT A.FirstName, A.LastName, B.FirstName, B.LastName 
FROM Employees A, Employees B 
WHERE A.Age = B.Age AND A.EmployeeID <> B.EmployeeID;
```

_Resultado:_
| A.FirstName | A.LastName | B.FirstName | B.LastName |
|-------------|------------|-------------|------------|
| John | Doe | Jane | Doe |
| Jane | Doe | John | Doe |

### 21. UNION

Este comando se utiliza para combinar el conjunto de resultados de dos o más SELECT en un solo conjunto de resultados que incluye todas las filas pertenecientes a todas las consultas en la unión. La UNION elimina los registros duplicados.

_Ejemplo:_
Si quieres una lista de todos los nombres de empleados y clientes, podrías utilizar UNION para combinar los resultados de dos SELECT.

```sql
SELECT FirstName FROM Employees 
UNION 
SELECT FirstName FROM Customers;
```

_Resultado:_
| FirstName |
|-----------|
| John |
| Jane |
| Alice |
| Bob |
| Slavoj |
| Yanis |
| Steve |
| Tom |

### 22. UNION ALL

Este comando se utiliza para combinar el conjunto de resultados de dos o más SELECT en un solo conjunto de resultados que incluye todas las filas pertenecientes a todas las consultas en la unión. A diferencia de UNION, UNION ALL no elimina los registros duplicados.

_Ejemplo:_
Si quieres una lista de todos los nombres de empleados y clientes, incluyendo duplicados, podrías utilizar UNION ALL para combinar los resultados de dos SELECT.

```sql
SELECT FirstName FROM Employees 
UNION ALL
SELECT FirstName FROM Customers;
```

_Resultado:_
| FirstName |
|-----------|
| John |
| Jane |
| Alice |
| Bob |
| Slavoj |
| Alice |
| Yanis |
| Steve |
| Tom |
| Bob |

### 23. GROUP_CONCAT

Esta función se utiliza para concatenar valores de columna en una cadena.

_Ejemplo:_
Si quieres una lista de todos los productos pedidos en cada pedido, podrías utilizar GROUP_CONCAT para concatenar los nombres de los productos.

```sql
SELECT Orders.OrderID, GROUP_CONCAT(Products.ProductName) 
FROM OrderItems 
JOIN Products ON OrderItems.ProductID = Products.ProductID 
GROUP BY Orders.OrderID;
```

_Resultado:_
| OrderID | GROUP_CONCAT(Products.ProductName) |
|---------|-----------------------------------|
| 1 | Apples |
| 2 | Bananas |
| 3 | Cherries |
| 4 | Dates |
| 5 | Eclair |

### 24. LIKE

Este comando se utiliza en una cláusula WHERE para buscar un patrón específico en una columna.

_Ejemplo:_
Si quieres encontrar todos los empleados cuyo nombre comienza con 'J', podrías utilizar LIKE para buscar este patrón específico.

```sql
SELECT * FROM Employees WHERE FirstName LIKE 'J%';
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 33 |

### 25. IN

Este comando se utiliza para permitir múltiples valores en una cláusula WHERE.

_Ejemplo:_
Si quieres encontrar todos los pedidos realizados por John Doe o Jane Doe, podrías utilizar IN para incluir múltiples valores en la cláusula WHERE.

```sql
SELECT * FROM Orders WHERE EmployeeID IN (1, 2);
```

_Resultado:_
| OrderID | EmployeeID | OrderDate |
|---------|------------|------------|
| 1 | 1 | 2023-01-01 |
| 2 | 2 | 2023-01-02 |
| 4 | 1 | 2023-01-04 |
| 5 | 2 | 2023-01-05 |

### 26. BETWEEN

Este comando se utiliza para seleccionar valores dentro de un rango. Los valores pueden ser números, texto o fechas.

_Ejemplo:_
Si quieres encontrar todos los empleados que tienen entre 30 y 40 años, podrías utilizar BETWEEN para seleccionar valores dentro de este rango.

```sql
SELECT * FROM Employees WHERE Age BETWEEN 30 AND 40;
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age |
|------------|-----------|----------|-----|
| 1 | John | Doe | 30 |
| 2 | Jane | Doe | 33 |

### 27. ALIAS

Este comando se utiliza para dar un nombre temporal a una tabla o columna en una consulta.

_Ejemplo:_
Si quieres hacer una consulta JOIN pero los nombres de las columnas son demasiado largos, podrías utilizar ALIAS para darles un nombre temporal más corto.

```sql
SELECT o.OrderID, e.FirstName, e.LastName 
FROM Orders AS o 
JOIN Employees AS e ON o.EmployeeID = e.EmployeeID;
```

_Resultado:_
| OrderID | FirstName | LastName |
|---------|-----------|----------|
| 1 | John | Doe |
| 2 | Jane | Doe |
| 3 | Alice | Johnson |
| 4 | John | Doe |
| 5 | Jane | Doe |

### 28. TRUNCATE

Este comando se utiliza para eliminar todos los registros de una tabla y liberar el espacio ocupado por esos registros.

_Ejemplo:_
Si quieres eliminar todos los registros de la tabla "Orders", podrías utilizar TRUNCATE.

```sql
TRUNCATE TABLE Orders;
```

_Resultado:_
La tabla "Orders" ahora está vacía.

### 29. DROP

Este comando se utiliza para eliminar una tabla existente en una base de datos.

_Ejemplo:_
Si quieres eliminar la tabla "Orders" completamente, podrías utilizar DROP.

```sql
DROP TABLE Orders;
```

_Resultado:_
La tabla "Orders" ha sido eliminada.

### 30. ALTER

Este comando se utiliza para agregar, eliminar/descartar o modificar columnas en una tabla existente. También se utiliza para agregar y soltar restricciones en una tabla existente.

_Ejemplo:_
Si quieres agregar una nueva columna "Email" a la tabla "Employees", podrías utilizar ALTER.

```sql
ALTER TABLE Employees ADD Email varchar(255);
```

_Resultado:_
| EmployeeID | FirstName | LastName | Age | Email |
|------------|-----------|----------|-----|-------|
| 1 | John | Doe | 30 | NULL |
| 2 | Jane | Doe | 33 | NULL |
| 3 | Alice | Johnson | 28 | NULL |
| 4 | Bob | Smith | 45 | NULL |

### 31. RENAME

Este comando se utiliza para cambiar el nombre de una tabla.

_Ejemplo:_
Si quieres cambiar el nombre de la tabla "Employees" a "Staff", podrías utilizar RENAME.

```sql
RENAME TABLE Employees TO Staff;
```

_Resultado:_
La tabla "Employees" ahora se llama "Staff".

### 32. CREATE DATABASE

Este comando se utiliza para crear una nueva base de datos.

_Ejemplo:_
Si quieres crear una nueva base de datos llamada "TestDB", podrías utilizar CREATE DATABASE.

```sql
CREATE DATABASE TestDB;
```

### 33. SHOW DATABASES

Este comando se utiliza para mostrar todas las bases de datos.

_Ejemplo:_
Si quieres ver todas las bases de datos disponibles, podrías utilizar SHOW DATABASES.

```sql
SHOW DATABASES;
```

### 34. USE

Este comando se utiliza para seleccionar una base de datos para su uso.

_Ejemplo:_
Si quieres usar la base de datos "TestDB", podrías utilizar USE.

```sql
USE TestDB;
```

### 35. DROP DATABASE

Este comando se utiliza para eliminar una base de datos existente.

_Ejemplo:_
Si quieres eliminar la base de datos "TestDB", podrías utilizar DROP DATABASE.

```sql
DROP DATABASE TestDB;
```

### 36. ALTER DATABASE

Este comando se utiliza para modificar una base de datos existente.

_Ejemplo:_
Si quieres cambiar el conjunto de caracteres de la base de datos "TestDB" a utf8, podrías utilizar ALTER DATABASE.

```sql
ALTER DATABASE TestDB CHARACTER SET utf8 COLLATE utf8_general_ci;
```

### 37. CREATE INDEX

Este comando se utiliza para crear un índice en una tabla. Los índices son utilizados para recuperar datos de la base de datos más rápidamente.

_Ejemplo:_
Si quieres crear un índice en la columna "LastName" de la tabla "Staff", podrías utilizar CREATE INDEX.

```sql
CREATE INDEX idx_lastname ON Staff (LastName);
```

### 38. SHOW INDEX

Este comando se utiliza para mostrar todos los índices en una tabla.

_Ejemplo:_
Si quieres ver todos los índices en la tabla "Staff", podrías utilizar SHOW INDEX.

```sql
SHOW INDEX FROM Staff;
```

### 39. DROP INDEX

Este comando se utiliza para eliminar un índice existente en una tabla.

_Ejemplo:_
Si quieres eliminar el índice "idx_lastname" de la tabla "Staff", podrías utilizar DROP INDEX.

```sql
DROP INDEX idx_lastname ON Staff;
```
