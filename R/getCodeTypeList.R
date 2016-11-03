#' Get Types
#'
#' Get all code types.
#'
#' @param date restrict output to code types modified after a given date in
#'        yyyy-mm-dd format     date should be text and in the fomat "yyyy-mm-dd", e.g. "2010-12-01"
#'
#' @return A data frame.
#'
#' @examples
#' codes <- getCodeTypeList()
#' codes[grep("worms", tolower(codes$Description)),]
#'
#' @export
getCodeTypeList <- function(date=NULL) {

  # base url
  url <- "http://vocab.ices.dk/services/pox/GetCodeTypeList"

  # if date supplied return list of code types modified after the given date
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
