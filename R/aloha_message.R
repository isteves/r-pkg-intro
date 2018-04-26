#' Say Aloha
#'
#' @description This function will say aloha to any inputted name.
#'
#' @param name (character) A name to say aloha to.
#'
#' @importFrom crayon green
#'
#' @export
aloha_message <- function(name) {
  cat(crayon("Aloha,", name))
}