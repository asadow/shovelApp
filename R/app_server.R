#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  utils_authorize_GS()

  .df <- reactive(fct_load_shovel_df())

  .list_defs <- reactive(utils_list_defs(.df))

  mod_regen_data_server("regen_data_1", .df, .list_defs)
}
