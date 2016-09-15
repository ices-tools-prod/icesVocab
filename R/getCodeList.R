#' Get List of Codes
#'
#' Retrieves all the codes for the given code type.
#'
#' @param code_type the code type, e.g. SpecWoRMS
#' @param date restrict output to codes
#'             modified after the given date.
#'             date should be text and in the fomat "yyyy-mm-dd", e.g. "2010-12-01"
#'
#' @return A data frame.
#'
#' @examples
#' # get the WoRMS AphiaIDs for ICES assessment species
#' getCodeList("SpecWoRMS")
#'
#' @export
getCodeList <- function(code_type, date=NULL) {

  # base url
  url <- sprintf("http://vocab.ices.dk/services/pox/GetCodeList/%s", code_type)

  # if date supplied return list of codes modified after the given date
  if (!is.null(date)) {
    url <- sprintf(paste0(url, "/%s"), date)
  }

  # read and parse XML from API
  out <- curlVocab(url = url)
  # parse the xml text string suppplied by the Datras webservice
  # returning a dataframe
  out <- parseVocab(out)

  # return
  out
}
