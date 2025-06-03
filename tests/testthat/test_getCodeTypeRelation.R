test_that("test example code in getCodeTypeRelation",
          {
            
            skip_on_cran()
            expect_type(getCodeTypeRelation("Pargroup", "PARAM"), "list")
            lookup <- getCodeTypeRelation("ICES_Area", "ICES_StockCode")
            expect_equal(colnames(lookup)[1],"ICES_Area")
            lookup_raw <- getCodeTypeRelation("ICES_StockCode", "ICES_Area", rename = FALSE)
            expect_equal(colnames(lookup_raw)[1],"FirstID")
          }
          
)

test_that("getCodeTypeRelation fails without code",
          {
            skip_on_cran()
            expect_error(getCodeTypeRelation())
          }
)
          