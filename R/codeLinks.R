#' Get Links Between Two Code Types
#'
#' Find parent or child linkages between the codes of two code types.
#'
#' @param code_type the species name, either in English (default) or Latin.
#' @param linked_code_type whether the species name is in Latin.
#' @param link_type whether to match the species name as a regular expression.
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
#' \donttest{
#' linkCodes("Pargroup", "PARAM", "children")
#'
#' }
#' @export

linkCodes <- function(code_type, linked_code_type, link_type = c("children", "parent")) {
  link_type <- match.arg(link_type)

  code_list <- getCodeList(code_type)

  linked_codes <-
    lapply(
      code_list$Key,
      function(code) {
        detail <- try(getCodeDetail(code_type, code))

        if (!inherits(detail, "try-error")) {
          whichp <- which(detail[[link_type]]$code_types$Key == linked_code_type)
          if (length(whichp)) {
            codes <- detail[[link_type]]$codes[whichp, ]
            out <- data.frame(code, codes$Key, codes$Description)
            names(out) <- c(linked_code_type, code_type, paste0(code_type, "_desc"))
            return(out)
          }
        }

        NULL
      }
    )

  linked_codes <- do.call(rbind, linked_codes[!sapply(linked_codes, is.null)])

  code_type_desc <- code_list$Description
  names(code_type_desc) <- code_list$Key

  linked_codes[[paste0(linked_code_type, "_desc")]] <- unname(code_type_desc[linked_codes[[linked_code_type]]])

  linked_codes
}
