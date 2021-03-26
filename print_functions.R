print_header <- function(round) {
  cat("#################\n\n")
  cat("#### Round", round, "####\n\n")
  cat("#################\n\n")
}

print_board <- function() {
  # Prints the current state of the board
  cat("Current board:\n")
  cat("~~~~~~~~~~~~~~\n\n")
  cat("     ")
  for (i in c(1, 2, 3)) {
    cat(i, " ")
  }
  cat("\n")

  for (i in c(1, 2, 3)) {
    cat(" ", i, " ")
    for (c in board[i, ]) {
      cat(c, " ")
    }
    cat("\n")
  }

  cat("\n~~~~~~~~~~~~~~\n\n")
}
