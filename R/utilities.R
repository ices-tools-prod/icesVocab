
CamelCase <- function(x) {
  # convert to CamelCase
  if (!is.null(x))  paste0(toupper(substring(x, 1, 1)), substring(x, 2))
}