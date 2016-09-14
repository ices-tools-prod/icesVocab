#' Get Aphia Species Codes
#'
#' Get the WoRMS AphiaIDs for ICES assessment species
#'
#' @return A data frame.
#'
#' @examples
#' getAphiaID()
#'
#' @export

getAphiaID <- function() {

  # read and parse XML from API
  url <- "http://vocab.ices.dk/services/rdf/collection/SpecWoRMS/"
  out <- curlVocab(url = url)
  out <- parseVocab(out)

  # return
  out
}
