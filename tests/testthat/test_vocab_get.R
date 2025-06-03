test_that("test example code in vocab_get",
          {
            skip_on_cran()
            # this one is currently failing with : Url doesn't exist - the server may not responding.
            expect_type(vocab_get(vocab_api("StockList", year = 2022)),"list")
          }
)
