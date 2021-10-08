library("shiny")
library("dplyr")

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

ui <- fluidPage(
  column(4,
    make_ui(iris, "Sepal.Length"),
    make_ui(iris, "Sepal.Width"),
    make_ui(iris, "Petal.Length"),
    make_ui(iris, "Petal.Width"),
    make_ui(iris, "Species")
  ),
  column(8, tableOutput("iris"))
)

server <- function(input, output, session) {
  output$iris <- renderTable({
    filter(.data = iris,
      between(Sepal.Length, input$Sepal.Length[1], input$Sepal.Length[2]),
      between(Sepal.Width, input$Sepal.Width[1], input$Sepal.Width[2]),
      between(Petal.Length, input$Petal.Length[1], input$Petal.Length[2]),
      between(Petal.Width, input$Petal.Width[1], input$Petal.Width[2]),
      Species %in% input$Species
    )
  })
}

shinyApp(ui, server)
