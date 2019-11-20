library("shiny")

ui <- fluidPage(
  ###<b>
  plotOutput("plot", height = "300px")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$plot <- renderPlot(plot(1:5))
  ###</b>
}

shinyApp(ui, server)
