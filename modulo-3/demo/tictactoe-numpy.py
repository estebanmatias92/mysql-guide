import os
import numpy as np

def initialize_board():
    # Create a 2D array filled with empty string
    return np.full((3, 3), "", dtype=str)


def check_line(line: np.array) -> bool:
    """ Check if the first element isn't empy, and if all the elements 
    of the current array are equal to the first value
    
    Keyword arguments:
    line -- 1D Numpy array (np.array)
    Return: bool
    """
    return line[0] and (np.all(line == line[0]))


def check_win(board: np.array):
    # Unpackage the tuple of "shape"
    y, x = board.shape
    # Get row, column and diagonal arrays
    rows = np.array([board[i, :] for i in range(y)])
    cols = np.array([board[:, i] for i in range(x)])
    diags = np.array([np.diag(board), np.diag(np.fliplr(board))])
    lines = np.array((*rows, *cols, *diags))
    #print("\n\n", lines)
    
    for line in lines:
        if check_line(line):
            return True
    
    # Return false, if no line with matching elements was found
    return False


def is_valid_play(cell: tuple, limits: tuple):
    are_off_limits = lambda coordinates: any(coordinates > np.array(limits) - 1)
    are_same_type = lambda coordinates: all(isinstance(axis, int) for axis in coordinates)

    return are_same_type(cell) and not are_off_limits(cell)


def player_turn(board, player):
    y = int(input("\nIngrese posicion axis 0: "))
    x = int(input("Ingrese posicion axis 1: "))

    cell = (y, x)
    
    if not is_valid_play(cell, board.shape):
        input("\nJugada fuera de los limites...")
        return False

    if (board[cell] != ""):
        input("\nJugada ilegal, celda llena...")
        return False
        
    board[cell] = player
    

def main():
    board = initialize_board()
    current_player = "X"

    while True:
        
        print("")
        print("===================")
        print("Tic Tac Toe - Numpy")
        print("===================")
        print("\n")
    
        # Display the board
        print(f"Player turn: {current_player}\n")
        print(board)

        # Handle player's turn
        player_turn(board, current_player)

        # Check for a win
        if check_win(board):
            print(f"\nPlayer '{current_player}' wins!")
            break

        # Switch players
        current_player = "X" if current_player == "O" else "O"
        
        os.system("cls")


# Main entrypoint
main()
