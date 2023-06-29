import numpy as np

print("Checkeando lineas horizontales, verticuales y diagonales")
# Creando Matriz con valores aleatorios entre ("X", "O")
board = np.random.choice(["X", "O"], size=(3, 3))
print("\nTablero Original: ")
print(board)


# Obtener, mostrar y checkear una fila
print("\nLinea Horizontal 0 (primera fila):")
linea0 = board[0]
print(linea0)
print("Son todas 'X'?: ", np.all(board[0] == "X"))

# Obtener, mostrar y checkear una columna
print("\nLinea Vertical 0 (primera columna):")
columna0 = board[:, 0]
print(columna0)
print("Son todas 'X'?: ", np.all(columna0 == "X"))

# Obtener, mostrar y checkear la diagonal principal
print("\nDiagonal Principal:")
main_diag = np.diag(board)
print(main_diag)
print("Son todas 'X'?: ", np.all(main_diag == "X"))

# Obtener, mostrar y checkear la diagonal secundaria
print("\nDiagonal Secundaria:")
seconth_diag = np.diag(np.fliplr(board))
print(seconth_diag)
print("Son todas 'X'?: ", np.all(seconth_diag == "X"))

