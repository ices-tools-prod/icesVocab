#' Get Aphia Species Codes
#'
#' Get the aphia codes from the ICES vocabularies database
#'
#' @return A data frame.
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
