#' Get Codes
#'
#' Get all codes of a given code type.
#'
#' @param code_type the code type, e.g. SpecWoRMS.
#' @param date restrict output to codes modified after a given date in
#'        yyyy-mm-dd format, e.g. "2010-12-01".
#'
#' @return A data frame.
#'
#' @examples
#' # Species codes
#' getCodeList("SpecWoRMS")
#'
#' @export

getCodeList <- function(code_type, date = NULL) {
  # base url
  url <- sprintf("http://vocab.ices.dk/services/pox/GetCodeList/%s",
                 code_type)

  # append modified-after-date filter
  if (!is.null(date)) {
    url <- sprintf(paste0(url, "/%s"), date)
  }

  # read XML string and parse to data frame
  out <- curlVocab(url)
  out <- parseVocab(out)

  out
}
