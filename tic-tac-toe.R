source("print_functions.R")
source("input_functions.R")
source("state_functions.R")
source("computer_turn.R")

size <- 3
board = array(rep(" ", size * size), dim = c(size, size))

player <- initial_input()
computer <- if (player == "X") "O" else "X"

cat("\nWelcome,", player, "\n\n")

round <- 1
valid_moves <- get_valid_moves(board)
print(valid_moves)

while (length(valid_moves) > 0) {
  print_header(round)
  print_board()

  move <- player_turn_input(size, valid_moves)
  row <- move[1]
  col <- move[2]

  board[row, col] <- player

  winner <- game_won(board)
  valid_moves <- get_valid_moves(board)
  game_over(player, winner, valid_moves)

  move <- get_computer_move(size, valid_moves)
  board[move[1], move[2]] <- computer

  winner <- game_won(board)
  valid_moves <- get_valid_moves(board)
  game_over(player, winner, valid_moves)

  round <- round + 1
}