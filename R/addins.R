#' stopServer
#'
#' Stops the server used by blogdowns server_site
#'
#' @return
#' NULL
#' @export
#'
#' @examples
#' # Use the addins browser or activate via the addins menue to
#' # stop the server
#'
stopServer <- function(){
  servr::daemon_stop(1)
}

#' convertCitation
#'
#' Convert a citr citation into a RefManageR cition to be
#' used in Xaringan slides.
#'
#' @return
#' NULL
#' @export
convertCitation <- function() {
  x <- rstudioapi::getActiveDocumentContext()
  selection <- rstudioapi::primary_selection(x)
  cit <- stringr::str_extract(selection$text, "(?<=@)[^\\]\\s]+")
  result <- paste0("`r Citet(bib, \"", cit,"\")`")
  rstudioapi::insertText(selection$range, result)
}

#' runApp
#'
#' Run a shinyApp packaged with golem in developement
#'
#' @return
#' NULL
#' @export
runApp <- function() {
  file <- file.path(here::here(), "app.R")
  if (file.exists(file)) {
    rstudioapi::documentSaveAll()
    devtools::document()
    pkgload::load_all()
    shiny::runApp(appDir = here::here())
  } else {
    usethis::ui_todo("Unable to locate app.R file.\n
                     Create a file app.R in the root directory
                     of your golem shiny app package and make sure it
                     contains:")
    usethis::ui_code_block("# ShinyApp\nrun_app()")
  }
}

#' renderSite
#'
#' Render an rmarkdown website
#'
#' @return
#' NULL
#' @export
renderSite <- function() {
  rmarkdown::render_site()
}

#' insertDate
#'
#' Insert the current date
#'
#' @return
#' NULL
#' @export
insertDate <- function() {
  date <- Sys.Date()
  date <- format(date)
  rstudioapi::insertText(text = date)
  return()
}
