#' Build a SAG web service url
#'
#' utility to build a url with optional query arguments
#'
#' @param service the name of the service
#' @param ... name arguments will be added as queries
#'
#' @return a complete url as a character string
#'
#' @examples
#'
#' vocab_api("hi", bye = 21)
#' vocab_api("CodeType")
#' options("icesVocab.showURL"=TRUE)
#' vocab_api("CodeType")
#'
#' @importFrom httr parse_url build_url
#' @export
vocab_api <- function(service, ...) {
  url <- paste0(api_url(), "/", service)
  url <- parse_url(url)
  url$query <- list(...)
  url <- build_url(url)
  if (getOption("icesVocab.showURL")) message(sprintf("The url is %s", url))

  return(url)

}

api_url <- function() {
  "https://vocab.ices.dk/services/api"
}
