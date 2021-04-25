library("shiny")

ui <- fluidPage(
  numericInput("min", "Minimum", 0), 
  numericInput("max", "Maximum", 3),
  uiOutput("n")
)

server <- function(input, output, session) {
  output$n <- renderUI({
    sliderInput(
      inputId = "n", 
      label = "n", 
      min = input$min, 
      max = input$max, 
      value = 1
    )
  })
}

shinyApp(ui, server)
