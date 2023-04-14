#' Get 'Grey if Missing' column definitions
#'
#' `utils_list_defs()` takes a dataframe and returns a named list of
#' column definitions for the `columns` argument of `reactable::reactable()`:
#' `style = utils_grey_if_na()` for the first and second columns
#'
#' @param .data A data frame.
#' @importFrom reactable colDef
#' @noRd

utils_list_defs <- function(.data) {
  stopifnot(is.data.frame(.data))
  list_defs <- names(.data)[1:2] |>
    purrr::set_names() |>
    purrr::map(\(x) colDef(style = utils_grey_if_na))
  return(list_defs)
}

#' Give a list of grey background values if missing
#'
#' The list given by `utils_grey_if_na()` is to be used
#' in the `style` argument of `reactable::colDef()`.
#'
#' @param value Value of table cell.

utils_grey_if_na <- function(value) {
  if (is.na(value)) {
    list(background = "#f7f7f8")
  }
}

#' Authorize googlsheets4 package through the .secrets folder
#'

utils_authorize_GS <- function() {
  googlesheets4::gs4_auth(cache = ".secrets", email = "sadowskiworks@gmail.com")
}

