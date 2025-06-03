test_that("test example code in getCodeTYpeList",
          {
            skip_on_cran()
            types <- getCodeTypeList()
            typesw <- types[grep("worms", tolower(types$Description)),]
            expect_gte(nrow(typesw), 1)
            e1 <- getCodeTypeList(code_type = "SpecWoRMS")
            expect_gte(nrow(e1), 1)
            e2 <- getCodeTypeList(code_type = "f107b677-97ff-4cd9-b4ab-637bb6706066")
            expect_gte(nrow(e2), 1)
            e3 <- findCodeType("worms", full = TRUE)
            expect_gte(nrow(e3), 1)
          }
)

test_that("test getCodeTYpeList returns a value after 2010",
          {
            skip_on_cran()
            type <- getCodeTypeList(date="2010-01-01")
            expect_gte(nrow(type), 1)
                     }
)