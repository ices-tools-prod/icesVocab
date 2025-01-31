#' Get Details
#'
#' Get details for a given code.
#'
#' @param code_type an ICES Vocabulary code type.
#' @param linked_code_type another ICES Vocabulary code type.
#' @param rename logical, if TRUE (default) the columns of the output
#'               is renamed to the code type and linked code type
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
#' x <- getCodeTypeRelation("Pargroup", "PARAM")
#'
#' # get all stocks in subarea 4a
#' # note you would need to cross check with icesSD for
#' # currently active stocks
#' lookup <- getCodeTypeRelation("ICES_Area", "ICES_StockCode")
#' lookup[lookup$ICES_Area == "27.4.a", ]
#'
#' # get relation between stock code and area, unformatted output
#' lookup_raw <- getCodeTypeRelation("ICES_StockCode", "ICES_Area", rename = FALSE)
#' head(lookup_raw)
#' }
#' @export

getCodeTypeRelation <- function(code_type, linked_code_type, rename = TRUE) {
  # read url contents
  out <-
    vocab_get_cached(
      vocab_api(
        sprintf("CodeType/Relation/%s/%s", code_type, linked_code_type)
      )
    )

  # fix column ordering
  check <- getCodeList(code_type, code = out$firstGUID[1])
  if (!identical(nrow(check), 1)) {
    names_out <- names(out)
    names(out)[1:6] <- names_out[c(4:6, 1:3)]
    out <- out[names_out]
  }

  # convert names
  names(out) <- CamelCase(names(out))

  if (rename) {
    out <- out[c("FirstKey", "SecondKey")]
    names(out) <- c(code_type, linked_code_type)
  }

  # return
  return(out)
}
