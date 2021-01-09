
test_that("findAphia doesn't crash when webservice is down", {

  res <- expect_warning(readVocab("https://nosuchaddress.dksks"))

  expect_equal(res, "")

  expect_equal(parseVocab(res), data.frame())

  key <- expect_warning(findAphia("puddin"))

  expect_equal(key, character(0))

})

# do not include this in the CRAN submission
#test_that("R behaviour with zero row data.frames", {
#  expect_equal(data.frame(Key = "", name = "")[integer(0), ]$Key, character(0))
#})
