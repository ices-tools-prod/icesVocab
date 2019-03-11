#' Find a Key
#'
#' Look up a key for a given code and code type.
#'
#' @param code_type a search string for a code type, e.g. SpecWorms, or simply worms.
#' @param code a search string for a code, e.g. a species name, cod, or ship name, Clupea.
#' @param regex whether to match as a regular expression.
#' @param full whether to return a data frame.
#'
#' @details Matches are case-insensitive.
#'
#' @return A vector of keys (default) or a data frame if full is TRUE.
#'
#' @seealso
#' \code{\link{getCodeList}} can be used to get all code types; see example on
#' that help page.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @examples
#' \dontrun{
#' findCode("aphia", "cod")
#'
#' # Multiple matches
#' findCode("aphia", c("cod", "haddock", "saithe"), full = TRUE)
#'
#' findCodeType("ship", full = TRUE)
#' findCode("ship", "clupea", full = TRUE)
#' }
#'
#' @export

findCode <- function(code_type, code, regex = TRUE, full = FALSE) {

  # get code types
  type <- findCodeType(code_type, regex = regex)
  # if multiple types - don't combine
  if (length(type) == 0) {
    return(NULL) # ?
  }
  codes <- lapply(type, getCodeList)

  # apply filters (to each list element)
  code <- tolower(as.character(code))
  if (!regex) code <- paste0("^", code, "$")
  codes <-
    lapply(codes,
      function(x) {
        select <- c(unlist(lapply(code, grep, tolower(x$LongDescription))),
                    unlist(lapply(code, grep, tolower(x$Description))),
                    unlist(lapply(code, grep, tolower(x$Key))))
        select <- sort(unique(select))
        x <- x[select,]

        if (full) {
          x
        } else {
          x$Key
        }
      })

  # add type as name
  names(codes) <- type

  # drop empty types
  if (full) {
    codes <- codes[sapply(codes, nrow) > 0]
  } else {
    codes <- codes[sapply(codes, length) > 0]
  }

  # return
  codes
}
