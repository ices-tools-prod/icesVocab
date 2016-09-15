#' Get List of Details
#'
#' Retrieves all the details for the given code.
#'
#' @param code_type the code type, e.g. SpecWoRMS
#' @param code the code, e.g. 101170
#'
#' @return A data frame.
#'
#' @examples
#' # get the details for species code 101170
#' getCodeDetail("SpecWoRMS", "101170")
#'
#' @export
getCodeDetail <- function(code_type, code) {

  # base url
  url <- sprintf("http://vocab.ices.dk/services/pox/GetCodeDetail/%s/%s", code_type, code)

  # read and parse XML from API
  out <- curlVocab(url = url)
  # parse the xml text string suppplied by the Datras webservice
  # returning a dataframe
  out <- parseVocab(out)

  # for now, drop parent relation...
  out <- out[names(out) != "ParentRelation"]

  # return
  out
}
