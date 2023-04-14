#' regen_data UI Function
#'
#' @description Loads a `reactable` with a fancy spinner for half a second,
#' even before hitting the 'Regenerate' button.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_regen_data_ui <- function(id){
  ns <- NS(id)
  tagList(
    actionButton(ns("regenerate"), "Regenerate"),
    reactable::reactableOutput(ns("table")) |> shinycssloaders::withSpinner()
  )
}

#' regen_data Server Functions
#'
#' @noRd
mod_regen_data_server <- function(id, .df, .list_defs){
  moduleServer( id, function(input, output, session){
    stopifnot(is.reactive(.df))
    stopifnot(is.reactive(.list_defs))

    ns <- session$ns

    .sleepy_df <- reactive({
      Sys.sleep(0.5)
      .df()
    }) |>
      bindEvent(input$regenerate, ignoreNULL = FALSE)

    output$table <- reactable::renderReactable({
      reactable::reactable(
        .sleepy_df(),
        columns = .list_defs(),
        sortable = FALSE,
        defaultColDef = reactable::colDef(
          align = "center",
          headerVAlign = "bottom",
          html = TRUE
        )
      )
    })
  })
}

## To be copied in the UI
# mod_regen_data_ui("regen_data_1")

## To be copied in the server
# mod_regen_data_server("regen_data_1")
