test_that("case is ignored", {
  expect_equal(gday("canucks"), gday("CANUCKS"))
})

test_that("Seattle does not have a NHL team", {
  expect_false(gday("seattle"))
})
