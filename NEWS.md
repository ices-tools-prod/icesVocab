<!-- NEWS.md is maintained by https://cynkra.github.io/fledge, do not edit -->

# icesVocab 1.2.0 (2022-02-10)

* internal bug fixes

# icesVocab 1.1.10 (2021-09-13)
* Use read_xml to read directly from url to avoid local encodings when using download.file

# icesVocab 1.1.9 (2020-10-26)
* Keys for all codes are always characters

# icesVocab 1.1.8 (2020-09-28)
* internal bug fixes changes

# icesVocab 1.1.7 (2020-09-17)
* remove optons(warn = -1) from internal simplify function

# icesVocab 1.1.6 (2020-09-09)
* made example 'donttest', findAphia fails gracefully if web service
  is down, and examples reinstated

# icesVocab 1.1-4 (2019-03-12)
* made all examples 'dontrun' as errors in database were causing r
  package build failures.

# icesVocab 1.1-3 (2019-03-12)
* Switched to using https route to webservice to fix errors introduced by http
  redirection from http to https on the web server for systems unable to handle
  http redirection.

# icesVocab 1.1-2 (2016-12-08)
* Fixed mistake in using wget method in download.file.  Now if
  download.file is unsuccessful, the slower url() function will be
  used place.

# icesVocab 1.1-0 (2016-12-08)
* Added function findAphia() to look up species codes.
* Added function findCode() to look up codes given a code type.
* Added function findCodeType() to look up code types.
* Improved XML parsing, so both leading and trailing white space is removed.
* Improved XML parsing, so "" and "NA" is converted to NA.
* Improved XML parsing of code details so that child and parent
  relations are returned.
* Improved url reading to avoid the use of RCurl.


# icesVocab 1.0-0 (2016-09-15)
* Initial release.
