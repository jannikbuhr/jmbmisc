
# Testhat works -----------------------------------------------------------
test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})


# FP tools work -----------------------------------------------------------
test_that("Compose function works", {
  x <- 1:10
  chain <- .(sum, ~.x + 1, ~.x * 10)
  standard <- (1 + sum(x)) * 10
  mine     <- chain(x)
  expect_equal(standard, mine)
})
