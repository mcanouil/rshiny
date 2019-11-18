library("shiny")

ui <- fluidPage(
  numericInput("min", "Minimum", 0), numericInput("max", "Maximum", 3),
  ###<b>
  uiOutput("n")
  ###</b>
)

server <- function(input, output, session) {
  output$n <- renderUI({
    ###<b>
    sliderInput("n", "n", min = input$min, max = input$max, value = 1)
    ###</b>
  })
}

shinyApp(ui, server)
