#' Load shovel checklist data from googlesheet and set row names.
#'
#'
#' @export

fct_load_shovel_df <- function() {
  sheet_id <- "1nL8S-OraXWPRlyFdGia_KBv4yO9cef5mZeNOcYfEt6A"

  googlesheets4::read_sheet(sheet_id) |>
    tibble::column_to_rownames("route")
}
