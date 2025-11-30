.onAttach <- function(...) {
  vars_in_workspace <- ls(envir = globalenv())
  
  if(length(vars_in_workspace) > 0) {
    packageStartupMessage(
      make_pretty(
        "Hi! I see that you have some variables in your workspace.",
        "To keep things running smoothly, I recommend cleaning it up before starting swirl.",
        skip_after = TRUE
      ),
      make_pretty(
        "Type ls() to see a list of the variables in your workspace.",
        "Then, type rm(list=ls()) to clear your workspace.",
        skip_after = TRUE
      ),
      make_pretty(
        "Type swirl() when you are ready to begin.",
        skip_after = TRUE
      )
    )
  } else {
    packageStartupMessage(
      make_pretty(
        "Hi! Type swirl() when you are ready to begin.",
        skip_after = TRUE
      )
    )
  }
  invisible()
}

make_pretty <- function(..., skip_before = TRUE, skip_after = FALSE) {
  # Combine all input strings with a space
  message_text <- paste(..., collapse = " ")
  
  # Wrap text to console width
  wrapped <- strwrap(message_text, width = getOption("width") - 2)
  
  # Add "| " prefix to each line
  mes <- paste0("| ", wrapped, collapse = "\n")
  
  # Add optional newlines
  if(skip_before) mes <- paste0("\n", mes)
  if(skip_after)  mes <- paste0(mes, "\n")
  
  mes
}
