# A "complete" row/column/diagonal refers to one
# that has all cells filled with the same value,
# either X or O

# Checks a row number for completion
# If complete, returns winner symbol
# Else returns false
is_row_complete <- function(board, row) {
  size <- sqrt(length(board))

  for (i in 2:size) {
    if (board[row, i] != board[row, 1])
      return(FALSE)
  }

  return(board[row, 1])
}

# Checks a col number for completion
# If complete, returns winner symbol
# Else returns false
is_col_complete <- function(board, col) {
  size <- sqrt(length(board))

  for (i in 2:size) {
    if (board[i, col] != board[1, col])
      return(FALSE)
  }

  return(board[1, col])
}

# Checks if diagonal 1 is complete
# If complete, returns winner symbol
# Else returns false
is_diagonal1_complete <- function(board) {
  size <- sqrt(length(board))

  for (i in 2:size) {
    if (board[i, i] != board[1, 1])
      return(FALSE)
  }

  return(board[1, 1])
}

# Checks if diagonal 2 is complete
# If complete, returns winner symbol
# Else returns false
is_diagonal2_complete <- function(board) {
  size <- sqrt(length(board))

  for (i in 1:size - 1) {
    if (board[size - i, i + 1] != board[size, 1])
      return(FALSE)
  }

  return(board[size, 1])
}

game_won <- function(board) {
  size <- sqrt(length(board))

  # Check if any complete row exists
  for (row in 1:size) {
    result <- is_row_complete(board, row)
    if (result %in% c("X", "O")) {
      return(result)
    }
  }

  # Check if any complete column exists
  for (col in 1:size) {
    result <- is_col_complete(board, col)
    if (result %in% c("X", "O")) {
      return(result)
    }
  }

  # Check if diagonal 1 is complete
  result <- is_diagonal1_complete(board)
  if (result %in% c("X", "O")) {
    return(result)
  }

  # Check if diagonal 2 is complete
  result <- is_diagonal2_complete(board)
  if (result %in% c("X", "O")) {
    return(result)
  }

  return(FALSE)
}

# Returns true if a move can be made
# False otherwise
get_valid_moves <- function(board) {
  moves <- c()
  size <- sqrt(length(board))

  for (row in 1:size) {
    for (col in 1:size) {
      if (board[row, col] == " ") {
        moves <- append(moves, row * size + col)
      }
    }
  }

  return(moves)
}

# Checks if a given move is allowed
is_move_allowed <- function(board, row, column) {
  return(board[row, column] == " ")
}

game_over <- function(player, winner, valid_moves) {
  if (winner == player) {
    print_board()
    cat("Congratulations,", winner, "!\n")
    quit()
  }
  else if (winner != FALSE) {
     print_board()
     cat("Oh no! You lost. :(\n")
     quit()
  }

  if (length(valid_moves) < 1) {
    cat("Oh no! It was a tie.\n")
    quit()
  }
}