#' Find Aphia Code
#'
#' Look up Ahia code for a given species.
#'
#' @param species the species name, either in English (default) or Latin.
#' @param latin whether the species name is in Latin.
#' @param regex whether to match the species name as a regular expression.
#' @param ignore.case whether the species name is case-insensitive.
#' @param full whether to return a data frame with all species columns.
#'
#' @return A vector of Aphia codes (default) or a data frame if full is TRUE.
#'
#' @seealso
#' \code{\link{getCodeTypeList}} and \code{\link{getCodeList}} get code types
#' and codes of a given type.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @examples
#' findAphia("cod")
#' findAphia("Gadus morhua", latin = TRUE)
#' findAphia(c("cod", "haddock", "saithe"))
#' findAphia("Sebastes", latin = TRUE, regex = TRUE, full = TRUE)
#'
#' @export
findAphia <- function(species, latin = FALSE, regex = FALSE, ignore.case = TRUE,
                      full = FALSE) {
  worms <- getCodeList("SpecWoRMS")
  description <- if (latin) worms$Description else worms$LongDescription
  if (ignore.case) {
    description <- tolower(description)
    species <- tolower(species)
  }
  out <- if (regex)
           worms$Key[unlist(lapply(species, grep, description))]
         else
           worms$Key[description %in% species]
  if (full)
    out <- worms[worms$Key %in% out,]
  out
}
