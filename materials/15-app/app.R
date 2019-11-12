library("shiny")
library("ggplot2")

ui <- fluidPage(
  ###<b>
  plotOutput("plot", height = "200px")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$plot <- renderPlot(
    ggplot(mtcars, aes(x = wt, y = mpg)) + geom_point()
  )
  ###</b>
}

shinyApp(ui, server)
