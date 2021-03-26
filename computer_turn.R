get_computer_move <- function(size, valid_moves) {
  row <- 0
  col <- 0
  move <- 0

  while (!(move %in% valid_moves)) {
    row <- sample(1:size, 1)
    col <- sample(1:size, 1)
    move <- row*size + col
  }

  return(c(row, col))

}