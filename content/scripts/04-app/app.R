library("shiny")

ui <- fluidPage(
  numericInput("num1", "Nombre 1", value = 0, min = 0, max = 100),
  sliderInput("num2", "Nombre 2", value = 42, min = 0, max = 100),
  sliderInput("rng", "Gamme", value = c(7, 42), min = 0, max = 100)
)

server <- function(input, output, session) { }

shinyApp(ui, server)
