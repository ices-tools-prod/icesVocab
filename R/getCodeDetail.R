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
#' \donttest{
#' # Species code 101170 - Myxine glutinosa
#' getCodeDetail("SpecWoRMS", 101170)
#'
#' # find details of Haddock using the aphia ID
#' findCode("species", "haddock", full = TRUE)
#'
#' getCodeDetail("SpecWoRMS", 126437)
#'
#' # get info for had-43
#' getCodeDetail("ICES_StockCode", "had-34")
#' }
#' @export

getCodeDetail <- function(code_type, code) {
  # form url
  url <-
    sprintf("https://vocab.ices.dk/services/pox/GetCodeDetail/%s/%s", code_type, code)

  # read url contents
  xml <- readVocab(url)
  # parse the text string returning a dataframe
  out <- parseVocabDetail(xml)

  out
}
