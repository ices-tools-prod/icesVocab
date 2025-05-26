#' Get Details
#'
#' Get details for a given code.
#'
#' @param code_type the code type, e.g. SpecWoRMS.
#' @param code the code, e.g. 101170.
#'
#' @return A data frame.
#'
#' @seealso
#' \code{\link{getCodeTypeList}} and \code{\link{getCodeList}} get code types
#' and codes of a given type.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' # Species code 101170 - Myxine glutinosa
#' getCodeDetail("SpecWoRMS", 101170)
#'
#' # find details of Haddock using the aphia ID
#' findCode("species", "haddock", full = TRUE)
#'
#' getCodeDetail("SpecWoRMS", 126437)
#'
#' # get info for had-34
#' getCodeDetail("ICES_StockCode", "had-34")
#' }
#' @export

getCodeDetail <- function(code_type, code) {
  
  # read url contents
  out <-
    vocab_get_cached(
      vocab_api(
        sprintf("CodeDetail/%s/%s", code_type, code)
      )
    )
  
  # convert to detail structure
  names <- c("id", "guid", "key", "description", "longDescription", "modified")
  
  # convert names
  convert_names <- function(x) {
    names(x) <- CamelCase(names(x))
    x
  }
  if (out$guid == "00000000-0000-0000-0000-000000000000") {
    message(sprintf("Code %s not found", code))
    return(NULL)
  } else {
    # return
    list(
      detail = convert_names(data.frame(out[names])),
      parents =
        list(
          code_types = convert_names(out$parentRelation$codeType[names]),
          codes = convert_names(out$parentRelation$code[names])
        ),
      children =
        list(
          code_types = convert_names(out$childRelation$codeType[names]),
          codes = convert_names(out$childRelation$code[names])
        )
    )
  }
}
