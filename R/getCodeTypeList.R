#' Get Types
#'
#' Get all code types. Mainly useful as a reminder of what code types are
#' available.
#'
#' @param code_type optional parameter to restrict output to a specific code type.
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
#' \dontrun{
#' # Find code type for World Register of Marine Species (WoRMS)
#' types <- getCodeTypeList()
#' types[grep("worms", tolower(types$Description)),]
#'
#' # The code type "SpecWoRMS" can be used when calling getCodeTypeList()
#' getCodeTypeList(code_type = "SpecWoRMS")
#'# or using the guid
#' getCodeTypeList(code_type = "f107b677-97ff-4cd9-b4ab-637bb6706066")
#'
#' findCodeType("worms", full = TRUE)
#'
#' }
#' @export

getCodeTypeList <- function(code_type = NULL, date = NULL) {

  # read url contents
  out <-
    vocab_get_cached(
      vocab_api("CodeType", codeType = code_type, modified = date)
    )

  # convert names
  names(out) <- CamelCase(names(out))

  # return
  out
}
