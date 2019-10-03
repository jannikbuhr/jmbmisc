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
