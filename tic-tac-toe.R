source("print_functions.R")
source("input_functions.R")

size <- 3
board = array(rep(" ", size*size), dim = c(size*size, size*size))

player <- initial_input()

cat("\nWelcome,", player, "\n\n")
print_header(1)
print_board()

move <- player_turn_input(size)