# Import functions from other files 
source("print_functions.R")
source("input_functions.R")
source("state_functions.R")
source("computer_turn.R")

# Set up the board
size <- 3
board = array(rep(" ", size * size), dim = c(size, size))

# Ask player which symbol they want
player <- initial_input()
computer <- if (player == "X") "O" else "X"

# Greeting!
cat("\nWelcome,", player, "!\n\n")

# Begin!
round <- 1
valid_moves <- get_valid_moves(board)

# If player chose O, computer makes the first move
if (player == "O") {
  move <- get_computer_move(size, valid_moves)
  board[move[1], move[2]] <- computer
  valid_moves <- get_valid_moves(board)
}

# Run game
while (length(valid_moves) > 0) {

  # Print board
  print_header(round)
  print_board()

  # Get player move
  move <- player_turn_input(size, valid_moves)
  row <- move[1]
  col <- move[2]

  board[row, col] <- player

  cat("\nMove placed!\n")

  # Check if game is over
  winner <- game_won(board)
  valid_moves <- get_valid_moves(board)
  game_over(player, winner, valid_moves)

  Sys.sleep(1)

  # Perform computer move
  move <- get_computer_move(size, valid_moves)
  board[move[1], move[2]] <- computer

  cat("Computer move registered.\n\n")

  # Check if game is over
  winner <- game_won(board)
  valid_moves <- get_valid_moves(board)
  game_over(player, winner, valid_moves)

  # Proceed to next round
  round <- round + 1
}