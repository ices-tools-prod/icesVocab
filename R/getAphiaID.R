#' Get List of Codes
#'
#' Retrieves all the codes for the given code type.
#'
#' @return A data frame.
#'
#' @examples
#' # get the WoRMS AphiaIDs for ICES assessment species
#' getCodeList("SpecWoRMS")
#'
#' @export
getCodeList <- function(code_type) {

  # read and parse XML from API
  url <- sprintf("http://vocab.ices.dk/services/pox/GetCodeList/%s", code_type)
  out <- curlVocab(url = url)
  # parse the xml text string suppplied by the Datras webservice
  # returning a dataframe
  out <- parseVocab(out)

  # return
  out
}
