library("shiny")

ui <- fluidPage(
  numericInput("min", "Minimum", 0), numericInput("max", "Maximum", 3),
  ###<b>
  sliderInput("n", "n", min = 0, max = 3, value = 1)
  ###</b>
)

server <- function(input, output, session) {
  observeEvent(input$min, {
    ###<b>
    updateNumericInput(session, "n", min = input$min)
    ###</b>
  })  
  observeEvent(input$max, {
    ###<b>
    updateNumericInput(session, "n", max = input$max)
    ###</b>
  })
}

shinyApp(ui, server)
