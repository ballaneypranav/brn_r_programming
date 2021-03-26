# Prompts user to choose from a set of allowed inputs.
# Keeps prompting until user picks one.
# Returns in uppercase.

validated_input <- function(prompt, allowed_inputs, error_msg) {
  input <- " "
  while (!(input %in% allowed_inputs)) {
    if (interactive()) {
      con <- stdin()
    } else {
      con <- "stdin"
    }
    cat(prompt, "")
    input <- readLines(con = con, n = 1)
    if (input %in% c("q", "quit")) {
      quit()
    }
    if (!(input %in% allowed_inputs)) {
      cat(error_msg, "\n")
    }
  }
  return(input)
}

# Prompts to choose between X and O
initial_input <- function() {
  choices <- c("x", "X", "o", "O")
  input <- validated_input("X or O?", choices, "Please choose either X or O.")
  return(toupper(input))
}

# Get player move
player_turn_input <- function(size, valid_moves) {
  cat("Your turn!\n")
  choices <- paste(seq.int(size))
  move <- 0

  while (!(move %in% valid_moves)) {

    row <- as.integer(validated_input("What row?", choices, paste("Please choose a row number between 1 and", size)))
    col <- as.integer(validated_input("What column?", choices, paste("Please choose a column number between 1 and", size)))

    move <- row * size + col

    # If invalid, ask again
    if (move %in% valid_moves) {
      return(c(row, col))
    } 
    else {
      cat("That's not a valid move.\n")
    }
  }
}