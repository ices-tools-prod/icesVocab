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
#' # Species code 101170
#' getCodeDetail("SpecWoRMS", 101170)
#'
#' # find details of Haddock using the aphia ID
#' findCodeType("aphia", full = TRUE)
#' findCode("species", "haddock", full = TRUE)
#'
#' findAphia("cod", full = TRUE)
#'
#' @export

getCodeDetail <- function(code_type, code) {

  # form url
  url <- sprintf("http://vocab.ices.dk/services/pox/GetCodeDetail/%s/%s",
                 code_type, code)

  # read url contents
  out <- readVocab(url)
  # parse the text string returning a dataframe
  out <- parseVocab(out)

  # for now, drop parent and child relations
  out <- out[!grepl("ParentRelation", names(out))]
  out <- out[!grepl("ChildRelation", names(out))]

  out
}
