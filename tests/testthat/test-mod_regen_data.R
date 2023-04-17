test_that("output updates when reactive input changes", {
  .df <- reactiveVal()
  .list_defs <- reactiveVal()

  testServer(
    mod_regen_data_server,
    # Add here your module params
    args = list(.df = .df, .list_defs = .list_defs)
    , {
      df <- tibble::tibble(x = 1, y = 2)
      .df(df)
      # changing reactiveVals does not automatically update the reactive graph,
      # so we have to do so manually by calling session$flushReact().
      session$flushReact()
      expect_equal(.sleepy_df(), df)
      expect_s3_class(output$table, "json")

      ns <- session$ns
      expect_true(
        inherits(ns, "function")
      )
      expect_true(
        grepl(id, ns(""))
      )
      expect_true(
        grepl("test", ns("test"))
      )
  })
})

test_that("module ui works", {
  ui <- mod_regen_data_ui(id = "test")
  golem::expect_shinytaglist(ui)
  # Check that formals have not been removed
  fmls <- formals(mod_regen_data_ui)
  for (i in c("id")){
    expect_true(i %in% names(fmls))
  }
})

