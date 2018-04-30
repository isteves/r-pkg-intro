context("say_aloha function")

test_that("function takes one input", {

  testthat::expect_error(say_aloha("Irene", "Mitchell"))

  testthat::expect_is(say_aloha(c("Irene", "Mitchell"), print = FALSE), "character")
})

