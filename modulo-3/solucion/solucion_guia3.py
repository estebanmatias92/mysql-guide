# Importando las librerías necesarias
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Ejercicio 1: Creación y manipulación de arrays en NumPy
# Creando un array 2D y cambiando su forma
array1 = np.array(range(10)) # Creando un array con 10 elementos
array1 = array1.reshape(5,2) # Cambiando la forma del array a 5x2
print(array1)

# Ejercicio 2: Operaciones básicas en NumPy
# Creando dos arrays y realizando operaciones básicas
array2 = np.array(range(5)) # Creando el primer array
array3 = np.array(range(5,10)) # Creando el segundo array
print(array2 + array3) # Suma
print(array2 - array3) # Resta
print(array2 * array3) # Multiplicación
print(array2 / array3) # División

# Ejercicio 3: Uso de funciones de agregación en NumPy
# Creando un array y calculando agregaciones
array4 = np.array(range(10)) # Creando un array con 10 elementos
print(np.sum(array4)) # Suma
print(np.min(array4)) # Mínimo
print(np.max(array4)) # Máximo
print(np.mean(array4)) # Media

# Ejercicio 4: Indexación y slicing en NumPy
# Creando un array y accediendo a sus elementos
array5 = np.array(range(10)) # Creando un array con 10 elementos
print(array5[:5]) # Primeros 5 elementos
print(array5[-5:]) # Últimos 5 elementos
print(array5[::2]) # Elementos en posiciones impares

# Ejercicio 5: Creación y manipulación de DataFrames en Pandas
# Creando un DataFrame y seleccionando una columna
df1 = pd.DataFrame(np.array(range(30)).reshape(10,3), columns=['A', 'B', 'C']) # Creando un DataFrame
df1['A'] = df1['A'] * 2 # Multiplicando la columna 'A' por 2
print(df1)

# Ejercicio 6: Visualización de datos en Pandas
# Creando un DataFrame y visualizando sus datos
df2 = pd.DataFrame(np.array(range(20)).reshape(10,2), columns=['A', 'B']) # Creando un DataFrame
df2.plot(kind='bar') # Creando un gráfico de barras
plt.show()

# Ejercicio 7: Indexación y slicing en Pandas
# Creando un DataFrame y accediendo a sus elementos
df3 = pd.DataFrame(np.array(range(30)).reshape(10,3), columns=['A', 'B', 'C']) # Creando un DataFrame
print(df3['A']) # Columna 'A'
print(df3[:5]) # Primeras 5 filas
print(df3[-5:]) # Últimas 5 filas
print(df3[::2]) # Filas en posiciones impares

# Ejercicio 8: Funciones de agregación en Pandas
# Creando un DataFrame y calculando agregaciones
df4 = pd.DataFrame(np.array(range(30)).reshape(10,3), columns=['A', 'B', 'C']) # Creando un DataFrame
print(df4['A'].sum())
