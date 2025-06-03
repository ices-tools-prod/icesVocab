
test_that("test example code in findCodeType",
          {
            skip_on_cran()
            expect_length(findCodeType("worms"), 3)
            
            expect_type(findCodeType("DATRAS", full = TRUE), "list")
          
            expect_type(findCodeType("DATRAS", full = TRUE, date = "2010-01-01"), "list") 
          }
)