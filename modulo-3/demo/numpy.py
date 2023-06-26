import numpy as np

# Creacion de Array
my_array = np.array([1, 2, 3])
print("\nEsto es un array:\n", my_array)

# Creacion de una Matriz
my_matrix = np.array([
    [1, 2, 3],
    [4, 5, 6]
])
print("\n\nEsto es una matriz:\n", my_matrix)

# Creacion de un Tensor
"""
my_tensor = np.array([
    [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ],
    [
        [10, 11, 12],
        [13, 14, 15],
        [16, 17, 18]
    ],
    [
        [19, 20, 21],
        [22, 23, 24],
        [25, 26, 27]
    ]
])
"""
my_tensor = np.arange(1, 28).reshape(3, 3, 3)
print("\n3D Array (tensor):\n", my_tensor)
"""
print("\nSlices:")
print("\nBack:\n", my_tensor[0,:,:])
print("\nMiddle:\n", my_tensor[1,:,:])
print("\nFront:\n", my_tensor[2,:,:])

left_side = np.transpose(my_tensor[:,:,0])
right_side = np.transpose(my_tensor[:,:,2])
print("\n\nLeft:\n", left_side)
print("\nRight:\n", right_side)

bottom_side = my_tensor[:,0,:]
top_side = my_tensor[:,2,:]
print("\n\nBottom:\n", bottom_side)
print("\nTop:\n", top_side)

#board = np.random.choice(["X", "O"], size=(3, 3))
#print("\n\n", board)   
"""


print("Valor 23 en tensor: ", my_tensor[2, 1, 1]) 

