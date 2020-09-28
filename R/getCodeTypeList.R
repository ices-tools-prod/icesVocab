#' Get Types
#'
#' Get all code types. Mainly useful as a reminder of what code types are
#' available.
#'
#' @param date restrict output to code types modified after a given date in
#'        yyyy-mm-dd format, e.g. "2010-12-01"
#'
#' @return A data frame.
#'
#' @seealso
#' \code{\link{getCodeList}} and \code{\link{getCodeDetail}} get codes of a
#' given type and code details.
#'
#' \code{\link{findCodeType}} searches for a code types based on a search string.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @examples
#' \donttest{
#' # Find code type for World Register of Marine Species (WoRMS)
#' types <- getCodeTypeList()
#' types[grep("worms", tolower(types$Description)),]
#'
#' findCodeType("worms", full = TRUE)
#'
#' # The code type "SpecWoRMS" can be used when calling getCodeList()
#' }
#' @export

getCodeTypeList <- function(date = NULL) {

  # base url
  url <- "https://vocab.ices.dk/services/pox/GetCodeTypeList"

  # if date supplied return list of code types modified after the given date
  if (!is.null(date)) {
    url <- sprintf(paste0(url, "/%s"), date)
  }

  # read url contents
  xml <- readVocab(url)
  # parse the text string returning a dataframe
  out <- parseVocab(xml)

  # return
  out
}
