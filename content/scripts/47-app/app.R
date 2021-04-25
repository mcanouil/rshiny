library("shiny")

ui <- fluidPage(
  numericInput("min", "Minimum", 0), 
  numericInput("max", "Maximum", 3),
  sliderInput("n", "n", min = 0, max = 3, value = 1)
)

server <- function(input, output, session) {
  observeEvent(input$min, { 
    updateNumericInput(session, "n", min = input$min) 
  })  
  
  observeEvent(input$max, { 
    updateNumericInput(session, "n", max = input$max) 
  })
}

shinyApp(ui, server)
