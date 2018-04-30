#' Say Aloha
#'
#' @description This function will say aloha to any inputted name.
#'
#' @param name (character) A name to say aloha to.
#' @param print (logical) Option to print your message. Defaults to \code{TRUE}
#'
#' @return (charater) An aloha message
#'
#' @examples
#' # Say hello to a friend
#' friend <- "Irene"
#' say_aloha(friend)
#'
#' @importFrom crayon green
#' @importFrom emo ji
#'
#' @export
say_aloha <- function(name, print = TRUE) {

  if (!all(is.character(name) & nchar(name) > 0)) {
    stop("Name must be a non empty character.
         Input a name you want to say aloha to!")
  }

  stopifnot(is.logical(print))

  message <- paste("Aloha,",
                   name,
                   emo::ji("palm_tree"),
                   emo::ji("sunny"),
                   emo::ji("ocean"))

  if (print) {
    cat(crayon::bgGreen(message))
  }

  invisible(message)
  }
