#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' By default, I assume you are a Canucks fan.
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The name of your team
#' @return Logical \code{TRUE} if \code{team} has a NHL game today,
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")
library(assertthat)
gday <- function(team = "canucks", date = Sys.Date()){
  if(!internet_connection()) {
    stop("Error: No internet connection; check your connexion or check on TSN")
  }

  # assert that date input is correct
  assertthat::assert_that(check_date(as.Date(date)))

  url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
                 as.Date(date), '.jsonp')
  grepl(team, RCurl::getURL(url), ignore.case=TRUE)
}

internet_connection <- function() {
  tryCatch({RCurl::getURL("www.google.com"); TRUE},
           error = function(err) FALSE)
}
