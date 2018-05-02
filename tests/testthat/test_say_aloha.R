context("say_aloha function")

test_that("second input should be TRUE or FALSE", {

  expect_error(say_aloha("Irene", "Mitchell"))

  })

test_that("mulitple names allowed", {

  expect_is(say_aloha(c("Irene", "Mitchell"), print = FALSE), "character")

})
