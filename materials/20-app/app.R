library("shiny")

ui <- fluidPage(
  fluidRow(
    column(width = 4,
      sliderInput("point", "Point :", min = 0, max = 20, value = 5)
    ),
    column(width = 8, plotOutput("plot"))
  ),
  fluidRow(
    column(width = 6,
      sliderInput("mean", "Moyenne :", min = 0, max = 2, value = 1)
    ),
    column(width = 6, plotOutput("plot2"))
  )
)

server <- function(input, output) {
  output$plot <- renderPlot(plot(1:10))
  output$plot2 <- renderPlot(plot(density(rnorm(n = 25))))
}

shinyApp(ui, server)
