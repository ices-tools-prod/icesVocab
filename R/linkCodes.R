#' Get Links Between Two Code Types
#'
#' Find parent or child linkages between the codes of two code types.
#'
#' @param code_type an ICES Vocabulary code type.
#' @param linked_code_type another ICES Vocabulary code type.
#' @param codes a vector of codes to restrict the output to.
#' @param ... for back compatibility.
#'
#' @return A data frame.
#'
#' @seealso
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @author Colin Millar.
#'
#' @examples
#' \dontrun{
#' x <- linkCodes("Pargroup", "PARAM")
#' # note it is much faster to use:
#' # getCodeTypeRelation("Pargroup", "PARAM")
#' # when getting a full lookup table.
#'
#' # get all areas for cod.27.1-2
#' linkCodes("ICES_StockCode", "ICES_Area", codes = c("cod.27.1-2"))
#'
#' # get areas for cod.27.21, cod.27.24-32 and cod.27.46a7d20
#' linkCodes("ICES_StockCode", "ICES_Area", codes = c("cod.27.21", "cod.27.24-32", "cod.27.46a7d20"))
#' }
#' @export

linkCodes <- function(code_type, linked_code_type, codes = NULL, ...) {
  code_list <- getCodeList(code_type)

  if (!is.null(codes)) {
    code_list <- code_list[code_list$Key %in% codes, ]
  }

  if (nrow(code_list) == 0) {
    message("No codes found")
    return(NULL)
  }

  linked_codes <-
    lapply(
      code_list$Key,
      function(code) {
        detail <- try(getCodeDetail(code_type, code))
        res <- list()
        if (!inherits(detail, "try-error")) {
          for (link_type in c("children", "parents")) {
            whichp <- which(detail[[link_type]]$code_types$Key == linked_code_type)
            if (length(whichp) > 0) {
              codes <- detail[[link_type]]$codes[whichp, ]
              out <- data.frame(code, codes$Key, codes$Description)
              names(out) <- c(code_type, linked_code_type, paste0(linked_code_type, "_desc"))
              return(out)
            }
          }
        }
        NULL
      }
    )

  linked_codes <- do.call(rbind, linked_codes[!sapply(linked_codes, is.null)])

  code_type_desc <- code_list$Description
  names(code_type_desc) <- code_list$Key

  linked_codes[[paste0(code_type, "_desc")]] <- unname(code_type_desc[paste(linked_codes[[code_type]])])

  linked_codes
}
