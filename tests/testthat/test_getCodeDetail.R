

test_that("test example code in getCodeDetail",
          {
          skip_on_cran()
           expect_type(getCodeDetail("SpecWoRMS", 101170), "list")
           expect_type(getCodeDetail("SpecWoRMS", 126437), "list")
            ll <- getCodeDetail("ICES_StockCode", "had-34")
            expect_equal(ll$detail$Id, 136539 )
          }
  )

test_that("test getCodeDetail does not fail when code wrong",
          {
            skip_on_cran()
            expect_message(getCodeDetail("SpecWoRMS", "wrong_code"), "Code wrong_code not found")
          }
)


test_that("test getCodeDetail returns a relation when it exists",
    {
      skip_on_cran()
      expect_type(getCodeDetail("Station", 1)$attribute, "list")
    }
)



test_that("test getCodeDetail returns the deprecated field when it exists",
          {
            skip_on_cran()
            expect_type(getCodeDetail("Station", 1)$deprecated, "logical")
          }
)

     