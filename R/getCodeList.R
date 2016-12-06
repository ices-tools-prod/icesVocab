#' Get Codes
#'
#' Get codes of a given code type.
#'
#' @param code_type the code type, e.g. SpecWoRMS.
#' @param date restrict output to codes modified after a given date in
#'        yyyy-mm-dd format, e.g. "2010-12-01".
#'
#' @return A data frame.
#'
#' @seealso
#' \code{\link{getCodeTypeList}} and \code{\link{getCodeDetail}} get code types
#' and code details.
#'
#' \code{\link{findCodeType}} and \code{\link{findAphia}} provide support for searching the code type and code lists.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @examples
#' # Aphia Species codes
#' findCodeType("aphia", full = TRUE)
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

  # read url contents
  out <- readVocab(url)
  # parse the text string returning a dataframe
  out <- parseVocab(out)

  out
}
