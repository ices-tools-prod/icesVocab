#' Get Aphia Species Codes
#'
#' Get the WoRMS AphiaIDs for ICES assessment species
#'
#' @return A data frame.
#'
#' @examples
#' getAphiaID()
#'
#' @export
#' @importFrom utils capture.output
getAphiaID <- function() {

  # read and parse XML from API
  url <- "http://vocab.ices.dk/services/rdf/collection/SpecWoRMS/"
  x <- curlVocab(url = url)
  # parse the xml text string suppplied by the Datras webservice
  # returning a dataframe
  x <- xmlParse(x)

  # get root node
  x <- xmlRoot(x)

  # first element is a SKOS:collection (not needed)
  top <- x[[1]]
  top <- sapply(1:xmlSize(top), function(i) capture.output(top[[i]]))
  top <- top[grep("skos:member", top)]
  top <- gsub("<skos:member rdf:resource=\"http://vocab.ices.dk/services/rdf/collection/SpecWoRMS/", "", top)
  top <- gsub("\"/> ", "", top)
  AphiaID <- as.numeric(top)

  # drop off collection info
  removeNodes(x[[1]])

  # restructure data into a data frame
  x <- sapply(1:xmlSize(x),
              function(i) {
                out <- getChildrenStrings(x[[1]])
                removeNodes(x[[1]])
                out
              })
  x <- as.data.frame(t(x), stringsAsFactors = FALSE)
  x <- simplify(x)

  # clean trailing white space from text columns
  charcol <- which(sapply(x, is.character))
  x[charcol] <- lapply(x[charcol], trimws)

  # tag on AphiaID
  x$AphiaID <- AphiaID

  # return
  x
}
