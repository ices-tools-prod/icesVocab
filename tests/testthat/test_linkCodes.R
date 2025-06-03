test_that("test example code in linkCodes",
          {
            skip_on_cran()
            expect_type(linkCodes("Pargroup", "PARAM"), "list")
            expect_type(linkCodes("ICES_StockCode", "ICES_Area", codes = c("cod.27.1-2")), "list")
            test <- linkCodes("ICES_StockCode", "ICES_Area", codes = c("cod.27.21", "cod.27.24-32", "cod.27.46a7d20"))
            expect_gt(nrow(test), 0)
          }
          
)