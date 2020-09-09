
test_that("findAphia doesn't crash when webservice is down", {

  res <- expect_warning(readVocab("https://nosuchaddress.dksks"))

  expect_equal(res, "")

  expect_equal(parseVocab(res), data.frame())

  key <- expect_warning(findAphia("puddin"))
  expect_equal(key, integer(0))
})
