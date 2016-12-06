#' Find a Key
#'
#' Find a lookup key corresponding to a code type.
#'
#' @param code a code name, e.g. Gear Type, or DATRAS to find all DATRAS related codes.
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
#' findCodeType("worms")
#'
#' findCodeType("DATRAS", full = TRUE)
#'
#' @export

findCodeType <- function(code, regex = TRUE, full = FALSE)
{

  # get code list
  types <- getCodeTypeList()

  # apply filters
  code <- tolower(code)
  if (!regex) code <- paste0("^", code, "$")
  select <- unlist(lapply(code, grep, tolower(types$Description)))
  types <- types[select,]

  # return
  if (full) {
    types
  } else {
    types$Key
  }
}
