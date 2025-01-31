#' Get a url
#'
#' Get a url, optionally using an ICES authentication token
#'
#' @param url the url to get.
#' @param retry should the get request be retried if first attempt
#'   fails? default TRUE.
#' @param quiet should all messages be suppressed, default FALSE.
#' @param verbose should verbose output form the http request be
#'   returned? default FALSE.
#' @param content should content be returned, or the full http response?
#'   default TRUE, i.e. content is returned by default.
#'
#' @return content or an http response.
#'
#' @seealso
#' \code{\link{vocab_api}} builds a SAG web service url.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' vocab_get(vocab_api("StockList", year = 2022))
#' }
#' @export
#'
#' @importFrom icesConnect ices_get
#' @importFrom httr content
vocab_get <- function(url, retry = TRUE, quiet = !getOption("icesVocab.messages"), verbose = FALSE, content = TRUE) {
  ices_get(url, retry, quiet, verbose, content, use_token = FALSE)
}

#' @describeIn vocab_get cached version of vocab_get
vocab_get_cached <- vocab_get
