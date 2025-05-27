
test_that("test example code in findCodeType",
          {
            expect_length(findCodeType("worms"), 3)
            
            expect_type(findCodeType("DATRAS", full = TRUE), "list")
            # Cédric 27/05 fixed by replacing 
            expect_type(findCodeType("DATRAS", full = TRUE, date = "2010-01-01"), "list") 
          }
)