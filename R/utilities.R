
CamelCase <- function(x) {
  # convert to CamelCase
  paste0(toupper(substring(x, 1, 1)), substring(x, 2))
}
