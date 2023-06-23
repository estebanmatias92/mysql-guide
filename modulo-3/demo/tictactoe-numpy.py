import numpy as np

def initialize_board():
    # Create a 3D array filled with zeros
    board = np.zeros((3, 3, 3), dtype=int)
    return board

def check_win(board):
    # Check for win in all directions
    pass

def player_turn(board, player):
    # Handle player's turn
    pass

def main():
    board = initialize_board()
    current_player = 1

    while True:
        # Display the board
        print(board)

        # Handle player's turn
        player_turn(board, current_player)

        # Check for a win
        if check_win(board):
            print(f"Player {current_player} wins!")
            break

        # Switch players
        current_player = 1 if current_player == 2 else 2

main()
