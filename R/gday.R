#' Is it GameDay?
#'
#' Thus function returns TRUE if your NHL team plays today and false otherwise.
#'
#' By default, I assume you are a Canucks fan.
#'
#' @param team
#' @return Logical. \code{TRUE} if \code{team} has a NHL game today,
#' \code{FALSE} otherwise
#'
#' @keywords misc
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday()
#' gday("Canadiens")

gday <- function(team = "canucks") {
	url <- paste0("http://live.nhle.com/GameData/GCScoreboard/",
								Sys.Date(), ".jsonp")
	grepl(team, RCurl::getURL(url), ignore.case = TRUE)
}
