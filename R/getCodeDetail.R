#' Get Details
#'
#' Get details for a given code.
#'
#' @param code_type the code type, e.g. SpecWoRMS.
#' @param code the code, e.g. 101170.
#'
#' @return A data frame.
#'
#' @examples
#' # Species code 101170
#' getCodeDetail("SpecWoRMS", 101170)
#'
#' @export

getCodeDetail <- function(code_type, code) {
  # read XML string and parse to data frame
  url <- sprintf("http://vocab.ices.dk/services/pox/GetCodeDetail/%s/%s",
                 code_type, code)
  out <- curlVocab(url)
  out <- parseVocab(out)

  # for now, drop parent and child relations...
  out <- out[!grepl("ParentRelation", names(out))]
  out <- out[!grepl("ChildRelation", names(out))]

  out
}
