#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' By default, gameday assumes you are a Canucks fan no matter where you are.
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The name of your team
#' @param date The date of the game
#' @return Logical \code{TRUE} if \code{team} has a NHL game on \code{date},
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored
#' @note if \code{date} is not provided, games for today is checked
#' @export
#' @examples
#' gday("canucks")
#' gday("canadiens", "2014-11-23")
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

