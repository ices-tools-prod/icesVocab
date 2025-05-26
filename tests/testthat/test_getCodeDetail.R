test_that("test example code in getCodeDetail",
          {
          skip_on_cran()
            invisible(capture.output(expect_type(getCodeDetail("SpecWoRMS", 101170), "list")))
            invisible(capture.output(expect_type(getCodeDetail("SpecWoRMS", 126437), "list")))
            invisible(capture.output(ll <- getCodeDetail("ICES_StockCode", "had-34")))
            expect_equal(ll$detail$Id, 136539 )
          }
  )

test_that("test getCodeDetail does not fail when code wrong",
          {
            invisible(capture.output(expect_message(getCodeDetail("SpecWoRMS", "wrong_code"), "Code wrong_code not found")))
          }
)
          