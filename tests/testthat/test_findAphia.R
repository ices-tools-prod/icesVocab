
test_that("test example code in getCodeDetail",
{
  skip_on_cran()
  # species

    expect_length(findAphia("cod"),1)   #see https://github.com/ices-tools-prod/icesVocab/issues/28
    expect_length(findAphia("Gadus morhua", latin = TRUE), 1)
  
   # Multiple matches
    expect_length(findAphia(c("cod", "haddock", "saithe")),3) #see https://github.com/ices-tools-prod/icesVocab/issues/28
    expect_warning(findAphia("Dark Vador"))
   # Regular expressions
    expect_type(findAphia("ray", regex = TRUE, full = TRUE),"list")
    expect_type(findAphia("Sebastes", latin = TRUE, regex = TRUE, full = TRUE),"list")
})   