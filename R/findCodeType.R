#' Find a Key
#'
#' Find a lookup key corresponding to a code type.
#'
#' @param code a code name, e.g. Gear Type, or DATRAS to find all DATRAS related codes.
#' @param date restrict output to code types modified after a given date in
#'        yyyy-mm-dd format, e.g. "2010-12-01"
#' @param regex whether to match the stock name as a regular expression.
#' @param full whether to return a data frame with all stock list columns.
#'
#' @return A vector of keys (default) or a data frame if full is TRUE.
#'
#' @seealso
#' \code{\link{getCodeTypeList}} gets a list of code types.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @examples
#' \donttest{
#' findCodeType("worms")
#'
#' findCodeType("DATRAS", full = TRUE)
#'
#' findCodeType("DATRAS", full = TRUE, date = "2010-01-01")
#' }
#' @export

findCodeType <- function(code, date = NULL, regex = TRUE, full = FALSE)
{

  # get code list
  types <- getCodeTypeList(date)

  # apply filters
  code <- tolower(code)
  if (!regex) code <- paste0("^", code, "$")
  select <- c(unlist(lapply(code, grep, tolower(types$LongDescription))),
              unlist(lapply(code, grep, tolower(types$Description))),
              unlist(lapply(code, grep, tolower(types$Key))))
  select <- sort(unique(select))
  types <- types[select,]

  # return
  if (full) {
    types
  } else {
    types$Key
  }
}
