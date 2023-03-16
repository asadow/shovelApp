#' Get 'HTML' and 'Grey if Missing' column definitions
#'
#' `utils_html_col_defs()` takes a dataframe and returns a named list of
#' column definitions for the `columns` argument of `reactable::reactable()`:
#' `html = TRUE` for all and `style = utils_grey_if_na()` for the i'th columns
#'  given by `index_grey_cols`.
#'
#' @param .data A data frame.
#' @param index_grey_cols A vector.
#' @importFrom reactable colDef
#' @importFrom purrr map
#' @noRd

utils_html_col_defs <- function(.data, index_grey_cols) {
  stopifnot(is.data.frame(.data))
  stopifnot(is.vector(index_grey_cols))
  stopifnot(!is.list(index_grey_cols))

  all <- names(.data)
  grey <- all[index_grey_cols]
  defs <- utils_named_map(all, ~ colDef(html = TRUE))
  defs_grey <- utils_named_map(grey, ~ colDef(style = utils_grey_if_na))
  ## Modify the defs list to include defs_grey
  ndg <- names(defs_grey)
  defs[ndg] <- ndg |>
    map(\(names) modifyList(defs[[names]], defs_grey[[names]]))
  return(defs)
}

#' Give a list of grey background values if missing
#'
#' The list given by `utils_grey_if_na()` is to be used
#' in the `style` argument of `reactable::colDef()`.
#'
#' @param value Value of table cell.

utils_grey_if_na <- function(value) {
  if (is.na(value)) {
    list(background = "#f7f7f7")
  }
}

#' `set_names()` then `map()`
#'
#' This combination is commonly used on a vector of strings
#' (columns names in a `reactable`) to apply `reactable` column definitions.
#'
#'
#' @param x An input.
#' @param .f A function for `map()`.

utils_named_map <- function(x, .f) {
  purrr::set_names(x) |>
    purrr::map(.f)
}

#' Authorize googlsheets4 package through the .secrets folder.
#'

utils_authorize_GS <- function() {
  googlesheets4::gs4_auth(cache = ".secrets", email = "sadowskiworks@gmail.com")
}

