library("shiny")

###<b>
ui <- fluidPage(
  fluidRow(
    column(width = 4, 
###</b>
      sliderInput("point", "Point :", min = 0, max = 20, value = 5)
###<b>
    ),
    column(width = 8, plotOutput("plot"))
  ),
  fluidRow(
    column(width = 6, 
###</b>
      sliderInput("mean", "Moyenne :", min = 0, max = 2, value = 1)
###<b>
    ),
    column(width = 6, plotOutput("plot2"))
  )
)
###</b>

server <- function(input, output) {
  output$plot <- renderPlot(plot(1:10))
  output$plot2 <- renderPlot(plot(density(rnorm(n = 25))))
}

shinyApp(ui, server)
