#' Find Aphia Code
#'
#' Look up Aphia code for a given species.
#'
#' @param species the species name, either in English (default) or Latin.
#' @param latin whether the species name is in Latin.
#' @param regex whether to match the species name as a regular expression.
#' @param full whether to return a data frame with all species columns.
#'
#' @details Species name matches are case-insensitive.
#'
#' @return A vector of Aphia codes (default) or a data frame if full is TRUE.
#'
#' @seealso
#' \code{\link{getCodeList}} can be used to get all Aphia codes; see example on
#' that help page.
#'
#' \code{\link{icesVocab-package}} gives an overview of the package.
#'
#' @author Arni Magnusson.
#'
#' @examples
#' findAphia("cod")
#' findAphia("Gadus morhua", latin = TRUE)
#' findAphia(c("cod", "haddock", "saithe"))
#' findAphia("Sebastes", latin = TRUE, regex = TRUE, full = TRUE)
#'
#' @export

findAphia <- function(species, latin = FALSE, regex = FALSE, full = FALSE) {
  worms <- getCodeList("SpecWoRMS")
  description <- if (latin) worms$Description else worms$LongDescription
  description <- tolower(description)
  species <- tolower(species)
  select <- if (regex)
              unlist(lapply(species, grep, description))
            else
              unlist(lapply(species, match, description))
  out <- if (full) worms[select,] else worms$Key[select]
  out
}
