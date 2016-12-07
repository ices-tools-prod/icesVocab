
#' @importFrom utils download.file
readVocab <- function(url) {

  # try downloading first:
  # create file name
  tmp <- tempfile()
  # download file
  ret <-
    if (os.type("windows")) {
      download.file(url, destfile = tmp, quiet = TRUE)
    } else if (os.type("unix") & Sys.which("wget") != "") {
      download.file(url, destfile = tmp, quiet = TRUE, method = "wget")
    } else if (os.type("unix") & Sys.which("curl") != "") {
      download.file(url, destfile = tmp, quiet = TRUE, method = "curl")
    } else {
      127
    }
  on.exit(unlink(tmp))

  # check return value
  if (ret == 0) {
    # scan lines
    scan(tmp, what = "", sep = "\n", quiet = TRUE)
  } else {
    message("Unable to download file so using slower method url().\n",
            "Try setting an appropriate value via \n\toptions(download.file.method = ...)\n",
            "see ?download.file for more information.")
    # connect to url
    con <- url(url)
    on.exit(close(con))

    # scan lines
    scan(con, what = "", sep = "\n", quiet = TRUE)
  }

}


#' @importFrom XML xmlParse
#' @importFrom XML xmlRoot
#' @importFrom XML xmlSize
#' @importFrom XML getChildrenStrings
#' @importFrom XML removeNodes
parseVocab <- function(x) {
  # parse the xml text string suppplied by the Datras webservice
  # returning a dataframe
  x <- xmlParse(x)

  # get root node
  x <- xmlRoot(x)

  # exit if no data is being returned
  if (xmlSize(x) == 0) return(NULL)
  nc <- length(getChildrenStrings(x[[1]]))
  # final field is always an error feild (try using xpath to avoid this)
  removeNodes(x[[xmlSize(x)]])

  # restructure data into a data frame
  x <- sapply(1:xmlSize(x),
                function(i) {
                  out <- getChildrenStrings(x[[1]])
                  removeNodes(x[[1]])
                  out
                })
  if (nc == 1) x <- matrix(x, 1, length(x), dimnames = list(names(x[1])))
  x <- as.data.frame(t(x), stringsAsFactors = FALSE)
  x <- simplify(x)

  # clean trailing white space from text columns
  charcol <- which(sapply(x, is.character))
  x[charcol] <- lapply(x[charcol], trimws)

  x
}

#' @importFrom XML xmlToList
parseVocabDetail <- function(x) {
  # parse the xml text string suppplied by the Datras webservice
  # returning a dataframe
  x <- xmlParse(x)

  # convet to list
  x <- xmlToList(x)[[1]]

  # get top row
  todf <- function(y) {
    y[sapply(y, is.null)] <- NA
    as.data.frame(y)
  }
  header <- todf(x[1:5])

  # get parents
  parents <- x[names(x) == "ParentRelation"]
  parent_code <-
    do.call(rbind,
      lapply(unname(parents),
        function(y) todf(y$Code)))
  parent_code_type <-
    do.call(rbind,
            lapply(unname(parents),
                   function(y) todf(y$CodeType)))

  # get children
  children <- x[names(x) == "ChildRelation"]
  child_code <-
    do.call(rbind,
            lapply(unname(children),
                   function(y) todf(y$Code)))
  child_code_type <-
    do.call(rbind,
            lapply(unname(children),
                   function(y) todf(y$CodeType)))

  # restructure
  out <- list(detail = header,
              parents = list(code_types = parent_code_type, codes = parent_code),
              children = list(code_types = child_code_type, codes = child_code))

  # return
  out
}


checkVocabWebserviceOK <- function() {
  # return TRUE if webservice server is good, FALSE otherwise
  out <- readVocab(url = "http://vocab.ices.dk/services/pox/GetCodeDetail/SpecWoRMS/101170")

  # Check the server is not down by insepcting the XML response for internal server error message.
  if (grepl("Internal Server Error", out)) {
    warning("Web service failure: the server seems to be down, please try again later.")
    FALSE
  } else {
    TRUE
  }
}


simplify <- function(x) {
  # from Arni's toolbox
  # coerce object to simplest storage mode: factor > character > numeric > integer
  owarn <- options(warn = -1)
  on.exit(options(owarn))
  # list or data.frame
  if (is.list(x)) {
    for (i in seq_len(length(x)))
      x[[i]] <- simplify(x[[i]])
  }
  # matrix
  else if (is.matrix(x))
  {
    if (is.character(x) && sum(is.na(as.numeric(x))) == sum(is.na(x)))
      mode(x) <- "numeric"
    if (is.numeric(x))
    {
      y <- as.integer(x)
      if (sum(is.na(x)) == sum(is.na(y)) && all(x == y, na.rm = TRUE))
        mode(x) <- "integer"
    }
  }
  # vector
  else
  {
    if (is.factor(x))
      x <- as.character(x)
    if (is.character(x))
    {
      y <- as.numeric(x)
      if (sum(is.na(y)) == sum(is.na(x)))
        x <- y
    }
    if (is.numeric(x))
    {
      y <- as.integer(x)
      if (sum(is.na(x)) == sum(is.na(y)) && all(x == y, na.rm = TRUE))
        x <- y
    }
  }
  x
}

# returns TRUE if correct operating system is passed as an argument
os.type <- function (type = c("unix", "windows", "other"))
{
  type <- match.arg(type)
  if (type %in% c("windows", "unix")) {
    .Platform$OS.type == type
  } else {
    TRUE
  }
}
