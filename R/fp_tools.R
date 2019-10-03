# Functional programming tools --------------------------------------------


#' Chain
#'
#' Chains a list of functions together.
#' A shortcut for \code{purrr::compose(..., .dir = "forward")}.
#'
#' @param ... Any number of functions
#'
#' @return A composed function
#' @export
#'
`.` <- function(...) {
  purrr::compose(... ,.dir = "forward")
}

