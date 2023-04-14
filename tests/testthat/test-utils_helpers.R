test_that("utils_grey_if_na() returns a named list for missing values", {
  x <- 5
  y <- NA
  expect_type(utils_grey_if_na(y), "list")
  expect_named(utils_grey_if_na(y))
  expect_null(utils_grey_if_na(x))
})

test_that("utils_list_defs() returns a named list of column definitions", {
  df <- tibble::tibble(x = 1, y = 2)
  i <- 2
  expect_type(utils_list_defs(df), "list")
  expect_named(utils_list_defs(df))
  expect_s3_class(utils_list_defs(df)[[1]], "colDef")
  expect_equal(utils_list_defs(df)[[2]]$style, utils_grey_if_na)
  expect_true(map(utils_list_defs(df), "html") |> unlist() |> all())

  expect_error(utils_list_defs(i), "is.data.frame")
})
