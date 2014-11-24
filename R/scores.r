#' What's the Score?
#'
#' This function returns a dataframe of scores for a day's games, all within R.
#'
#' Again, gameday assumes you are a Canucks fan. Sorry!
#' Imagine the new scenario. You have the hard choice of
#' staying on that awesome R coding session or watching your TV.
#' Suffer no more! You can simply ask R to give you the scores any day.
#'
#' @param date The date of the game
#' @return Data.frame of scores
#' @note if \code{date} is not provided, games for today is checked
#' @export
#' @examples
#' scores()
#' scores("2014-11-22")

scores <- function(date = Sys.Date()){
  if(!internet_connection()) {
    stop("Error: No internet connection; check your connexion or check on TSN")
  }

  # assert that date input is correct
  assertthat::assert_that(check_date(as.Date(date)))

  url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
                 as.Date(date), '.jsonp')
  raw <- RCurl::getURL(url)
  json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
  data <- jsonlite::fromJSON(json)$games
  with(data,
       data.frame(home = paste(htn, htcommon),
                  away = paste(atn, atcommon),
                  home_score = hts,
                  away_score = ats))
}
