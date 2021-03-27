library("shiny")

ui <- fluidPage(
  plotOutput("plot", height = "600px")
)

server <- function(input, output, session) {
  output$plot <- renderPlot(plot(1:5))
}

shinyApp(ui, server)
