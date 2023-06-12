# Guía de NumPy

## Introducción y Contexto

**NumPy es una biblioteca** para el lenguaje de programación Python que **proporciona soporte para arrays y matrices grandes y multidimensionales**, junto con una gran **colección de funciones** matemáticas de alto nivel **para operar con estos arrays**.

## Preparación de Datos para trabajar

### Instalación y preparación de herramientas

Para instalar NumPy, puedes usar pip, que es el instalador de paquetes de Python. En tu terminal, simplemente ejecuta:

```bash
pip install numpy
```

Para usar NumPy en tu script de Python, debes importarlo. La convención común es importarlo bajo el alias `np`:

```python
import numpy as np
```

### Creación/obtención de datos para la guía

Vamos a crear algunos arrays NumPy para usar en nuestros ejemplos. En NumPy, puedes crear un array utilizando la función `np.array()`, pasando una lista como argumento:

```python
a = np.array([1, 2, 3])
print(a)
```

Resultado:

```bash
[1 2 3]
```

También puedes crear un **array de dos dimensiones (una matriz)** pasando una lista de listas:

```python
b = np.array([[1, 2, 3], [4, 5, 6]])
print(b)
```

Resultado:

```bash
[[1 2 3]
 [4 5 6]]
```

#### E/S con NumPy

NumPy proporciona varias funciones para guardar y cargar datos de y hacia el disco.

Aquí hay un ejemplo de cómo puedes **guardar un array en un archivo binario en formato .npy y luego cargarlo** de nuevo:

```python
# Crear un array
a = np.array([1, 2, 3, 4, 5, 6])

# Guardar el array en un archivo .npy
np.save('array_a.npy', a)

# Cargar el array desde el archivo
b = np.load('array_a.npy')

print(b)
```

Resultado:

```bash
[1 2 3 4 5 6]
```

También puedes guardar y cargar texto con las funciones `np.savetxt` y `np.loadtxt`.

Aquí hay un ejemplo de cómo puedes **guardar un array en un archivo de texto y luego** cargarlo de nuevo:

```python
# Guardar el array en un archivo de texto
np.savetxt('array_a.txt', a)

# Cargar el array desde el archivo de texto
c = np.loadtxt('array_a.txt')

print(c)
```

Resultado:

```bash
[1. 2. 3. 4. 5. 6.]
```

Estas funciones te permiten guardar tus datos y cargarlos más tarde, lo cual es especialmente útil cuando trabajas con grandes conjuntos de datos.

## NumPy - - Operaciones/Metodos/Conceptos

### Creación de arrays

En NumPy, la creación de arrays es sencilla.

Aquí hay un ejemplo de cómo **crear un array de una dimensión**:

```python
a = np.array([1, 2, 3])    # Crea un array 'a', con los valores 1, 2 y 3
print(a)
```

Resultado:

```bash
[1 2 3]
```

### Operaciones básicas

Las operaciones matemáticas básicas en NumPy son elementales, lo que significa que se realizan elemento por elemento.

Aquí hay un ejemplo de cómo **sumar dos arrays**:

```python

a = np.array([1, 2, 3])
b = np.array([4, 5, 6])
c = a + b   # Suma los arrays 'a' y 'b' para producir el array 'c'
print(c)
```

Resultado:

```bash
[5 7 9]
```

### Indexación y slicing

La indexación y el slicing en NumPy funcionan de manera similar a como lo hacen en las listas de Python.

Aquí hay un ejemplo de cómo **acceder al primer elemento** de un array:

```python
a = np.array([1, 2, 3])
first_element = a[0]    # Obtiene el primer elemento del array 'a'
print(first_element)
```

Resultado:

```bash
1
```

### Funciones de agregación

NumPy proporciona una serie de funciones de agregación, como `np.sum`, `np.min`, `np.max`, `np.mean`, y muchas más.

Aquí hay un ejemplo de cómo calcular la **suma de un array**:

```python
a = np.array([1, 2, 3])
sum_of_a = np.sum(a)    # Calcula la suma del array 'a'
print(sum_of_a)
```

Resultado:

```bash
6
```

### Manipulación de formas

Puedes cambiar la forma de un array en NumPy utilizando la función `reshape`.

Aquí hay un ejemplo de cómo **cambiar la forma de un array** para que tenga dos filas y dos columnas:

```python
a = np.array([1, 2, 3, 4])
b = a.reshape(2, 2)    # Cambia la forma del array 'a' para que sea un array de 2x2, 'b'
print(b)
```

Resultado:

```bash
[[1 2]
 [3 4]]
```

### Broadcasting

El broadcasting es una característica poderosa que permite a NumPy trabajar con arrays de diferentes formas al realizar operaciones aritméticas.

Aquí hay un ejemplo de cómo se puede **sumar un número a todos los elementos de un array**:

```python
a = np.array([1, 2, 3])
b = a + 5    # Suma 5 a cada elemento del array 'a' para producir el array 'b'
print(b)
```

Resultado:

```bash
[6 7 8]
```

### Vectorización

La vectorización es un poderoso concepto en NumPy que permite realizar **operaciones en arrays enteros en lugar de en elementos individuales**. Esto puede hacer que tu código sea más eficiente y más fácil de leer.

Aquí hay un ejemplo de cómo puedes **sumar dos arrays utilizando la vectorización**:

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])
c = a + b
print(c)
```

Resultado:

```bash
[5 7 9]
```

En este ejemplo, `a + b` suma los dos arrays elemento por elemento, lo que es mucho más eficiente que hacer un bucle para sumar los elementos individualmente.

### Vistas

Una vista en NumPy es una forma de **acceder a los datos de un array sin hacer una copia**. Esto puede ser útil para ahorrar memoria cuando estás trabajando con arrays grandes.

Aquí hay un ejemplo de cómo puedes crear una **vista de un array**:

```python
a = np.array([1, 2, 3, 4, 5, 6])
b = a[2:5]
print(b)
```

Resultado:

```bash
[3 4 5]
```

En este ejemplo, `b` es una vista de `a`. Si cambias los datos en `b`, también cambiarán en `a`.

### Copias

A diferencia de las vistas, una copia de un array en NumPy es una nueva matriz que contiene los mismos datos que el array original. Si cambias los datos en la copia, no afectará al array original.

Aquí hay un ejemplo de cómo puedes hacer una **copia de un array**:

```python
a = np.array([1, 2, 3, 4, 5, 6])
b = a.copy()
print(b)
```

Resultado:

```bash
[1 2 3 4 5 6]
```

En este ejemplo, `b` es una copia de `a`. Si cambias los datos en `b`, no afectará a `a`.
