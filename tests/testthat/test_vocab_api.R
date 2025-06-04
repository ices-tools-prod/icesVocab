test_that("test examples vocab api",
          {
expect_equal(vocab_api("hi", bye = 21),"https://vocab.ices.dk/services/api/hi?bye=21")
expect_equal(vocab_api("CodeType"),"https://vocab.ices.dk/services/api/CodeType")
options("icesVocab.showURL"=FALSE)
expect_silent(vocab_api("CodeType"))
options("icesVocab.showURL"=TRUE)
expect_message(vocab_api("CodeType"))
          }
)
            

