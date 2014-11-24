test_that("case is ignored", {
  expect_equal(gday("canucks"), gday("CANUCKS"))
})

test_that("Seattle does not have a NHL team", {
  expect_false(gday("seattle"))
})


test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-02", {
  expect_true(gday(team = "canucks",   date = "2014-11-02"))
  expect_true(gday(team = "predators", date = "2014-11-02"))
})

test_that("Calgary Flames took rest on 2014-11-23 after beating the Oilers", {
  expect_false(gday("flames", "2014-11-23"))
  expect_false(gday("oilers", "2014-11-23"))
})

test_that("check_date testing", {
  expect_true(check_date("2014-11-23"))
  expect_true(check_date("2014-1-23"))
  expect_error(check_date("2014-11-32"))
  expect_error(check_date("201-41123"))
})

test_that("There were 13 games on November 22nd", {
  expect_true(nrow(scores("2014-11-22")) == 13)
})
test_that("Gameday does not know the scores for tomorrow's games", {
  expect_false(any(is.na(scores(lubridate::today() + lubridate::days(1))[c("home_score", "away_score")])))
})


