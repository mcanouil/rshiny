library("shiny")
library("ggplot2")

ui <- fluidPage(
  plotOutput("plot")
)

server <- function(input, output, session) {
  output$plot <- renderPlot(
    ggplot(mtcars, aes(x = wt, y = mpg)) + 
      geom_point()
  )
}

shinyApp(ui, server)
