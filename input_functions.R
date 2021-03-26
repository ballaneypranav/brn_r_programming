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
    if (input == "quit") {
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

player_turn_input <- function(size) {
  cat("Your turn!\n")
  choices <- paste(seq.int(size))

  row <- validated_input("What row?", choices, paste("Please choose a row number between 1 and", size))
  col <- validated_input("What column?", choices, paste("Please choose a column number between 1 and", size))

  return(c(row, col))

}