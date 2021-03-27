library("shiny")

ui <- fluidPage(
  plotOutput("plot")
)

server <- function(input, output, session) {
  output$plot <- renderPlot(plot(1:5))
}

shinyApp(ui, server)
