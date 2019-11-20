library("shiny")

ui <- fluidPage(
  numericInput("min", "Minimum", 0), numericInput("max", "Maximum", 3),
  ###<b>
  sliderInput("n", "n", min = 0, max = 3, value = 1)
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  observeEvent(input$min, { updateNumericInput(session, "n", min = input$min) })  
  observeEvent(input$max, { updateNumericInput(session, "n", max = input$max) })
  ###</b>
}

shinyApp(ui, server)
