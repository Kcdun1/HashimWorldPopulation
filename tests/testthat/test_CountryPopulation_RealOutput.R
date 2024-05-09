library(testthat)

test_that('The value entered will result in an output graph.',
          expect_error(CountryPopulation("Hello")))
