# Importando las librerías necesarias
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Ejercicio 1: Creación y manipulación de arrays en NumPy
# Creando un array 2D y cambiando su forma
print("\nEjercicio 1:")
array1 = np.array([[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]])   # Creando array de 2x5 elementos
print("\nArray:\n", array1)
print("Forma: ", array1.shape)
array1 = array1.reshape(5, 2)     # Cambiando la forma del array y sobreescribiendo la variable para actualizar el valor
print("\nArray modificado:\n", array1)
print("Forma: ", array1.shape)
print()


# Ejercicio 2: Operaciones básicas en NumPy
# Creando dos arrays y realizando (operaciones básicas
print("\nEjercicio 2:")
array2 = np.arange(5)
array3 = np.arange(5)
print("\nSuma:")
print(array2 + array3)
print("\nResta:")
print(array2 - array3)
print("\nMultiplicacion:")
print(array2 * array3)
print("\nDivision:")
print(array2 / array3)
print()


# Ejercicio 3: Uso de funciones de agregación en NumPy
# Creando un array y calculando agregaciones
print("\nEjercicio 3:")
array4 = np.random.randint(20, size=10)
print("\nArray 1D random:", array4)
print("\nSuma de sus elementos:", array4.sum())
print("Minimo:", array4.min())
print("Maximo:", array4.max())
print("Promedio:", np.mean(array4))
print("Valor del medio:", np.median(array4))
print()


# Ejercicio 4: Indexación y slicing en NumPy
# Creando un array y accediendo a sus elementos
print("\nEjercicio 4:")
array5 = np.random.randint(100, size=10)
print("\nArray 1D random:", array5)
print("\nPrimeros 5 elementos:", array5[:5])
print("Ultimos 5:", array5[-5:])
print("*Indices impares:", array5[::2])
print()


# Ejercicio 5: Creación y manipulación de DataFrames en Pandas
# Creando un DataFrame y seleccionando una columna
print("\nEjercicio 5:")
autos = {
    "marcas": ["Chevrolet", "Ford", "Oldsmobile", "Pontiac", "Honda", "Nissan", "Mitsubishi", "Renault", "Ferrari", "Porsche"],
    "modelos": ["Camaro", "Mustang", "Alero", "Firebird", "Civic", "Altima", "Eclipse", "Clio", "F40", "911"],
    "año": [2020, 2019, 2001, 2002, 2021, 2020, 2003, 2005, 1992, 2022],
    "precio": [25000, 26000, 3000, 4000, 22000, 23000, 7000, 5000, 1300000, 114000],
    "ventas": [5000, 3000, 200, 500, 10000, 8000, 1500, 7000, 10, 1200]
}
df1 = pd.DataFrame(autos)
print(df1)
print("\nMultiplicando 'precio' x 'unidades vendidas':")
df1["total"] = df1["precio"] * df1["ventas"]
print(df1)
print()


# Ejercicio 6: Visualización de datos en Pandas
# Creando un DataFrame y visualizando sus datos
print("\nEjercicio 6:")
df2 = df1[["marcas", "ventas"]].copy()
plt.bar(df2.marcas, df2.ventas)
plt.xlabel("Marcas")
plt.xlabel("Ventas")
plt.show()


# Ejercicio 7: Indexación y slicing en Pandas
# Creando un DataFrame y accediendo a sus elementos
print("\nEjercicio 7:")
marcas = df1["marcas"]
print("\nColumna:")
print(marcas)
print("\nPrimeros 5 indices:")
print(marcas.head())
print("\nUltimoss 5 indices:")
print(marcas[-5:])
print("\nIndices impares: ")
print(marcas[::2])


# Ejercicio 8: Funciones de agregación en Pandas
# Creando un DataFrame y calculando agregaciones
print("\nEjercicio 8:")
precios = df1["precio"]
print("\nPrecios:")
print("\nSuma: ", precios.sum())
print("Precio minimo: ", precios.min())
print("Precio maximo: ", precios.max())
print("Precio promedio: ", precios.mean())
