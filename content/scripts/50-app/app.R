library("shiny")
library("dplyr")
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
  column(4, map(colnames(iris), ~ make_ui(iris, .x))),
  column(8, tableOutput("iris"))
)

server <- function(input, output, session) {
  output$iris <- renderTable({
    vals <- map(colnames(iris), ~ filter_var(iris[[.x]], input[[.x]]))
    iris[reduce(vals, `&`), ]
  })
}

shinyApp(ui, server)
