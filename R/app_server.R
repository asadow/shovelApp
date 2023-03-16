#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  utils_authorize_GS()

  .df <- reactive(fct_load_shovel_df())
  .col_defs <- reactive(utils_html_col_defs(.df(), index_grey_cols = c(1:2)))

  mod_regen_data_server("regen_data_1", .df, .col_defs)
}
