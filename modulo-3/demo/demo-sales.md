# Numpy, Pandas - Carga y Manipulacion de Datos

## Introduccion del Dataset

Utilizaremos una base de datos de ventas con las siguientes tablas: Customers, Products, Orders y OrderItems. [**Schema SQL**](https://github.com/estebanmatias92/curso-python-avanzado-plan-de-estudio-CFL415/blob/main/modulo-3/demo/sales.sql)

### Customers

| Campo | Tipo | Especificaciones |
| --- | --- | --- |
| CustomerID | INTEGER | PRIMARY KEY |
| FirstName | TEXT | |
| LastName | TEXT | |
| Email | TEXT | |

### Products

| Campo | Tipo | Especificaciones |
| --- | --- | --- |
| ProductID | INTEGER | PRIMARY KEY |
| ProductName | TEXT | |
| Price | REAL | |

### Orders

| Campo | Tipo | Especificaciones |
| --- | --- | --- |
| OrderID | INTEGER | PRIMARY KEY |
| CustomerID | INTEGER | FOREIGN KEY REFERENCES Customers(CustomerID) |
| OrderDate | DATE | |

### OrderItems

| Campo | Tipo | Especificaciones |
| --- | --- | --- |
| OrderItemID | INTEGER | PRIMARY KEY |
| OrderID | INTEGER | FOREIGN KEY REFERENCES Orders(OrderID) |
| ProductID | INTEGER | FOREIGN KEY REFERENCES Products(ProductID) |
| Quantity | INTEGER | |

## Carga de Datos

Para cargar los datos de la base de datos ([sales.db](https://github.com/estebanmatias92/curso-python-avanzado-plan-de-estudio-CFL415/blob/main/modulo-3/demo/sales.db)) en Python, usaremos la biblioteca sqlite3 para conectarnos a la base de datos y la biblioteca Pandas para cargar los datos en un DataFrame.

```python
import sqlite3
import pygame

# Conectar a la base de datos
conn = sqlite3.connect('sales.db')

# Cargar los datos en un DataFrame
df_customers = pd.read_sql_query("SELECT * FROM Customers", conn)
df_products = pd.read_sql_query("SELECT * FROM Products", conn)
df_orders = pd.read_sql_query("SELECT * FROM Orders", conn)
df_order_items = pd.read_sql_query("SELECT * FROM OrderItems", conn)

# Cerrar la conexión a la base de datos
conn.close()
```

## Numpy

Podemos usar Numpy para realizar cálculos en los datos de las tablas. Por ejemplo, podríamos calcular el precio total de cada pedido.

```python
import numpy as np

# Convertir las columnas de precios y cantidades a arrays de Numpy
prices = np.array(df_products['Price'])
quantities = np.array(df_order_items['Quantity'])

# Calcular el precio total de cada pedido
total_prices = prices * quantities
print(total_prices)
```

## Pandas

Podemos usar Pandas para manipular y analizar los datos de las tablas. Por ejemplo, podríamos agrupar los pedidos por cliente y calcular el total de ventas para cada cliente.

```python
# Unir los DataFrames
df = pd.merge(df_orders, df_order_items, on='OrderID')
df = pd.merge(df, df_products, on='ProductID')

# Calcular el total de ventas para cada pedido
df['TotalPrice'] = df['Price'] * df['Quantity']

# Agrupar por CustomerID y calcular el total de ventas para cada cliente
total_sales = df.groupby('CustomerID')['TotalPrice'].sum()
print(total_sales)
```

## Matplotlib

Podemos usar Matplotlib para visualizar los datos de las tablas. Por ejemplo, podríamos crear un gráfico de barras del total de ventas para cada cliente.

```python
import matplotlib.pyplot as plt

# Crear un gráfico de barras del total de ventas para cada cliente
plt.bar(total_sales.index, total_sales.values)
plt.xlabel('Customer ID')
plt.ylabel('Total Sales')
plt.show()
```
