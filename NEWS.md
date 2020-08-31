# icesVocab 1.1.4.9000 (2020-08-31)

* remove examples that access the internet


--------------------------------------------------------------------------------
icesVocab 1.1-4 (2019-03-12)
--------------------------------------------------------------------------------
o made all examples 'dontrun' as errors in database were causing r package
  build failures.

--------------------------------------------------------------------------------
icesVocab 1.1-3 (2019-03-12)
--------------------------------------------------------------------------------
o Switched to using https route to webservice to fix errors introduced by http
  redirection from http to https on the web server for systems unable to handle
  http redirection.

--------------------------------------------------------------------------------
icesVocab 1.1-2 (2016-12-08)
--------------------------------------------------------------------------------
o Fixed mistake in using wget method in download.file.  Now if download.file is
  unsuccessful, the slower url() function will be used in place.

--------------------------------------------------------------------------------
icesVocab 1.1-0 (2016-12-08)
--------------------------------------------------------------------------------
o Added function findAphia() to look up species codes.

o Added function findCode() to look up codes given a code type.

o Added function findCodeType() to look up code types.

o Improved XML parsing, so both leading and trailing white space is removed.

o Improved XML parsing, so "" and "NA" is converted to NA.

o Improved XML parsing of code details so that child and parent relations are returned.

o Improved url reading to avoid the use of RCurl.


--------------------------------------------------------------------------------
icesVocab 1.0-0 (2016-09-15)
--------------------------------------------------------------------------------
o Initial release.