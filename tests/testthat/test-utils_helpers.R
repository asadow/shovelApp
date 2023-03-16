test_that("utils_named_map() does a named map()", {
  some_names <- c("col1", "col2")
  names(some_names) <- some_names
  mapped_names <- map(some_names, 1)

  expect_equal(utils_named_map(some_names, 1), mapped_names)
  expect_named(utils_named_map(some_names, 1))
  expect_type(utils_named_map(1, "blah"), "list")

  expect_null(utils_named_map(1, "blah")[[1]])
  expect_error(utils_named_map(1))
})

test_that("utils_grey_if_na() returns a named list for missing values", {
  x <- 5
  y <- NA
  expect_type(utils_grey_if_na(y), "list")
  expect_named(utils_grey_if_na(y))
  expect_null(utils_grey_if_na(x))
})

test_that("utils_html_col_defs() returns a named list of column definitions", {
  df <- tibble::tibble(x = 1, y = 2)
  i <- 2
  expect_type(utils_html_col_defs(df, i), "list")
  expect_named(utils_html_col_defs(df, i))
  expect_s3_class(utils_html_col_defs(df, i)[[1]], "colDef")
  expect_equal(utils_html_col_defs(df, i)[[2]]$style, utils_grey_if_na)
  expect_true(map(utils_html_col_defs(df, i), "html") |> unlist() |> all())

  expect_error(utils_html_col_defs(i), "is.data.frame")
  expect_error(utils_html_col_defs(df, list(i)), "!is.list")
})

