library("shiny")
library("purrr")

make_ui <- function(data, var) {
  x <- data[, var]
  if (is.numeric(x)) {
    min_max <- range(x, na.rm = TRUE)
    sliderInput(
      inputId = var,
      label = var,
      min = min_max[1],
      max = min_max[2],
      value = min_max
    )
  } else if (is.character(x) | is.factor(x)) {
    unique_x <- unique(x)
    selectInput(
      inputId = var,
      label = var,
      choices = unique_x,
      selected = unique_x,
      multiple = TRUE
    )
  } else {
    NULL # default
  }
}

filter_var <- function(data_var, input_var) {
  if (is.numeric(data_var)) {
    !is.na(data_var) & # dplyr::between
      data_var >= input_var[1] &
      data_var <= input_var[2]
  } else if (is.character(data_var) | is.factor(data_var)) {
    data_var %in% input_var
  } else {
    TRUE # default
  }
}

ui <- fluidPage(
  fluidRow(column(4, offset = 5,
    selectInput("dataset", label = h3("Datasets"),
      choices = ls("package:datasets"),
      selected = "iris"
    )
  )),
  fluidRow(
    column(4, uiOutput("ui")),
    column(8, tableOutput("iris"))
  )
)

server <- function(input, output, session) {
  datasets <- reactive({get(input$dataset, "package:datasets")})
  output$iris <- renderTable({
    validate(need(
      expr = inherits(datasets(), "data.frame"),
      message = 'Not a "data.frame"'
    ))
    vals <- purrr::map(
      .x = colnames(datasets()),
      .f = ~ filter_var(datasets()[[.x]], input[[.x]])
    )
    datasets()[purrr::reduce(vals, `&`), ]
  })
  output$ui <- renderUI({
    validate(need(
      expr = inherits(datasets(), "data.frame"),
      message = 'Not a "data.frame"'
    ))
    purrr::map(colnames(datasets()), ~ make_ui(datasets(), .x))
  })
}

shinyApp(ui, server)
