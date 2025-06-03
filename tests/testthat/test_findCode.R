test_that("test example code in findCode",
          {
            skip_on_cran()
            expect_type(findCode("aphia", "cod"), "list")
           
            # Multiple matches
            expect_type(findCode("aphia", c("cod", "haddock", "saithe"), full = TRUE), "list")
            ship <- findCodeType("ship", full = TRUE)
            expect_type(ship,"list")
            expect_gt(nrow(ship),1)
            mix <- findCode("ship", "clupea", full = TRUE)
            expect_type(mix,"list")
            expect_gt(length(mix),1)
            }
          )