context("My aloha function")

test_that("function takes one input", {
  expect_error(aloha_message("Irene", "Mitchell"))
})

