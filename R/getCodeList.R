#' Get Codes
#'
#' Get codes of a given code type.
#'
#' @param code_type the code type, e.g. SpecWoRMS.
#' @param code optional code to restrict output to.
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
#' \dontrun{
#' # Aphia Species codes
#' findCodeType("aphia", full = TRUE)
#' codes <- getCodeList("SpecWoRMS")
#' head(codes)
#'
#' findCode("ship", "clupea", full = TRUE)
#'
#' getCodeList("ICES_Area")
#' getCodeList("ICES_Area", code = "27.4.a")
#' }
#' @export

getCodeList <- function(code_type, code = NULL, date = NULL) {

  # read url contents
  out <-
    vocab_get_cached(
      vocab_api(paste0("Code/", code_type), code = code, modified = date)
    )

  # convert names
  names(out) <- CamelCase(names(out))

  # return
  out
}
