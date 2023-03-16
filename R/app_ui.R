#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny bslib htmltools
#' @noRd
#'

app_ui <- function(request) {
  theme <- bslib::bs_theme(
    version = 5,
    bg = "#FFFFFF",
    fg = "#000000",
    primary = "#A30808",
    secondary = "#F8D505"
  )

  base_url <- "https://www.pr.uoguelph.ca"
  l <- glue::glue("{base_url}/staff-info/grounds-route-checklists-mobile-devices")

  fyi <- p(
    "Each day, University of Guelph shovelers fill in a Qualtrics survey",
    "(you can log in", a(href = glue::glue("{base_url}/user"), "here"),
    "to be able to see the ",
    a(href = l, "Route Checklists", .noWS = "outside"),
    "). At 10 minute intervals from 11:30 AM to 11:50 AM,
  computer code extracts this week's data from Qualtrics, transforms it into the
  above table,
  and uploads this table to a Googlesheet.
  The 'Regenerate' button pulls from this Googlesheet. Why not pull from
  Qualtrics? The code to generate this application lives on
  a web server and on a public repository called GitHub.
  It is safer to keep the password needed to access Qualtrics internal."
  )

  img_light <- img(src = "www/light-bulb.svg", height = 20)

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    page_fluid(
      theme = theme,
      img(
        src = "www/pr-logo.jpg",
        width = 300
      ),
      h1(
        class = "lead text-center bg-black text-white bg-gradient my-0 p-3",
        tags$b("Snow Shovel Routes"),
      ),
      nav(
        title = NULL,
        card(
          card_body_fill(mod_regen_data_ui("regen_data_1")),
          class = "pt-0 fs-6 lead text-muted",
          "Brought to you by Adam Sadowski, Maria Dimacuha, and Anne MacDonald."
        ),
        card(
          card_header(
            img_light,
            "How Does It Work?",
            img_light,
            class = "text-center"
          ),
          card_body(
            class = "pt-0 fs-6 lead text-muted",
            fyi
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "shovelApp"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
