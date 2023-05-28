# Conceptos básicos de las bases de datos

## 1. Base de datos

Una base de datos **es una colección organizada de datos**. Estos datos se organizan de manera que soporten procesos que requieren información, como consultas y reportes.

```ascii
+-----------+
| Base de   |
| Datos     |
+-----------+
| Tabla 1   |
| Tabla 2   |
| ...       |
+-----------+
```

## 2. Tabla

Una tabla es una **colección de datos relacionados organizados en filas (registros) y columnas (campos)**. Cada tabla tiene un nombre único.

```ascii
+---------------------------------------+
|              Tabla 'Usuarios'         |
+--------+---------+--------+-----------+
| UserID | Nombre  | Ciudad | Edad      |
+--------+---------+--------+-----------+
| 1      | Juan    | Madrid | 30        |
| 2      | Ana     | Murcia | 25        |
| 3      | Pedro   | Bilbao | 40        |
+--------+---------+--------+-----------+
```

## 3. Registro

Un registro en una base de datos **es una unidad de información**. Cada registro consiste en un **conjunto de campos relacionados entre sí**. En el contexto de una tabla de base de datos, un registro **se puede visualizar como una fila única en la tabla**. Cada registro generalmente representa un objeto o entidad específica. Por ejemplo, en una tabla "Usuarios", cada registro podría representar a un usuario individual.

```ascii
+--------+---------+--------+-----------+
| UserID | Nombre  | Ciudad | Edad      |
+--------+---------+--------+-----------+
| 2      | Ana     | Murcia | 25        |
+--------+---------+--------+-----------+
```

## 4. Campo

Los campos son los **componentes individuales dentro de un registro** y cada uno almacena un elemento de datos específico. En el contexto de una tabla de base de datos, un campo **se puede visualizar como una columna**. Por ejemplo, en una tabla "Usuarios", podrías tener campos como "UserID", "Nombre", "Ciudad" y "Edad". Cada uno de estos campos almacena un tipo específico de datos relacionados con un usuario.

```ascii
+---------+
| Nombre  |
+---------+
| Juan    |
| Ana     |
| Pedro   |
+---------+
```

### 1. Clave Primaria (PK - Primary Key)

La clave primaria de una tabla **es un campo único que identifica cada fila en la tabla**. No puede haber dos filas (registros) en una tabla con la misma clave primaria.

```ascii
+--------+ 
| UserID |
+--------+
| 1      | 
| 2      | 
| 3      | 
+--------+
```

### 2. Clave Foránea (FK - Foreign Key)

Una clave foránea es un campo en una tabla que **es la clave primaria en otra tabla**. Se utiliza para establecer y hacer cumplir un vínculo entre los datos de dos tablas.

```ascii
+---------+-----------------+
| OrderID | CustomerUserID  |
+---------+-----------------+
| 1001    | 1               |
| 1002    | 2               |
| 1003    | 3               |
+---------+-----------------+
```

## Diagrama Entidad-Relación

Un **Diagrama Entidad-Relación (ERD) es una representación visual de las principales entidades dentro de una base de datos**, así como las relaciones entre ellas. Es una herramienta importante en el diseño de bases de datos. Aquí hay un ejemplo simplificado:

```ascii
+----------------+    +----------------+
|    Usuario     |    |     Pedido     |
+----------------+    +----------------+
| UserID (PK)    |<>--| OrderID (PK)   |
| Nombre         |    | CustomerUserID |
| Ciudad         |    |                |
| Edad           |    | ...            |
+----------------+    +----------------+
```

En este diagrama, la tabla 'Usuario' tiene una relación con la tabla 'Pedido'. La línea entre las dos tablas representa esta relación, y el diamante en el medio indica que es una relación de muchos a uno ('<>' se usa para simbolizar esto), lo que significa que un usuario puede tener muchos pedidos, pero cada pedido pertenece a un solo usuario.

### 1. Uno a Uno (1:1)

La relación uno a uno implica que un registro en una tabla está asociado con exactamente un registro en otra tabla. Por ejemplo, considere las siguientes tablas `Empleado` y `Detalles_ID`.

```ascii
Tabla `Empleado`:              Tabla `Detalles_ID`:
+------------+--------+        +------------+------------+
| EmpleadoID | Nombre |        | DetallesID | EmpleadoID |
+------------+--------+        +------------+------------+
|     1      |  Juan  |<------>|     101    |     1      |
|     2      |  Ana   |<------>|     102    |     2      |
+------------+--------+        +------------+------------+
```

En este diagrama, las flechas `<---->` representan la relación entre las tablas `Empleado` y `Detalles_ID`, a través de la columna `EmpleadoID`. Esto indica que cada fila en la tabla `Detalles_ID` está relacionada con una fila en la tabla `Empleado` que tiene el mismo `EmpleadoID`.
**Cada empleado tiene exactamente un detalle de ID correspondiente y viceversa**.

### 2. Uno a Muchos (1:M)

En una relación uno a muchos, un registro en una tabla puede estar asociado con uno o más registros en otra tabla. Por ejemplo, considere las siguientes tablas `Profesor` y `Cursos`.

```ascii
Tabla `Profesor`:              Tabla `Cursos`:
+------------+--------+        +---------+------------+------------+
| ProfesorID | Nombre |        | CursoID |   Nombre   | ProfesorID |
+------------+--------+        +---------+------------+------------+
|     1      | Carlos |<------>|   101   | Matematica |     1      |
|     2      | Maria  |<------>|   102   | Historia   |     1      |
|            |        |<------>|   103   | Biologia   |     2      |
+------------+--------+        +---------+------------+------------+
```

En este diagrama, las flechas `<------>` representan la relación entre las tablas `Profesor` y `Cursos`, a través de la columna `ProfesorID`. Esto indica que cada fila en la tabla `Cursos` está relacionada con una fila en la tabla `Profesor` que tiene el mismo `ProfesorID`.
**Cada profesor puede enseñar varios cursos, pero cada curso es enseñado por un solo profesor.**

### 3. Muchos a Muchos (M:M)

En una relación muchos a muchos, uno o más registros en una tabla pueden estar asociados con uno o más registros en otra tabla. Por ejemplo, considere las siguientes tablas `Alumno`, `Cursos` e `Inscripcion`.

```ascii
Tabla `Alumno`:             Tabla `Inscripcion` (tabla de unión):        Tabla `Cursos`:
+----------+--------+       +---------------+----------+---------+       +---------+------------+ 
| AlumnoID | Nombre |       | InscripcionID | AlumnoID | CursoID |       | CursoID |   Nombre   |
+----------+--------+       +---------------+----------+---------+       +---------+------------+
|    1     | Luis   |<----->|      1        |     1    |   101   |<----->|   101   | Matematica |
|    2     | Pedro  |<----->|      2        |     1    |   102   |<----->|   102   | Historia   |
|    3     | Ana    |<----->|      3        |     2    |   101   |<----->|   103   | Biologia   |
|          |        |<----->|      4        |     3    |   103   |<----->|         |            |
+----------+--------+       +---------------+----------+---------+       +---------+------------+
```

En este diagrama, las flechas `<----->` representan las relaciones entre las tablas `Alumno`, `Cursos`, y `Inscripcion`. La tabla `Inscripcion` es una tabla de unión que asocia a los alumnos con los cursos en los que están inscritos. Cada fila en la tabla `Inscripcion` se relaciona con una fila en la tabla `Alumno` y una fila en la tabla `Cursos` que tienen el mismo `AlumnoID` y `CursoID`, respectivamente.
**Un estudiante puede inscribirse en varios cursos y un curso puede tener varios estudiantes.** La tabla de unión `Inscripcion` se utiliza para resolver esta relación muchos a muchos.
