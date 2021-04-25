library("shiny")
library("dplyr")
library("ggplot2")
library("ggpubr")

ui <- fluidPage(
  fluidRow(
    column(4, 
      "Exemple 1",
      textInput("species1", "Espèce : ", value = "setosa"),
      textInput("col1x", "Axe x : ", value = "Petal.Length"),
      textInput("col1y", "Axe y : ", value = "Sepal.Length")
    ),
    column(8, plotOutput("point1", height = "250px"))
  ),
  fluidRow(
    column(4, 
      "Exemple 2",
      textInput("species2", "Espèce : ", value = "versicolor"),
      textInput("col2x", "Axe x : ", value = "Petal.Length"),
      textInput("col2y", "Axe y : ", value = "Sepal.Length")
    ),
    column(8, plotOutput("point2", height = "250px"))
  ),
  fluidRow(
    column(12, plotOutput("point12", height = "250px"))
  )
)

server <- function(input, output, session) {
  output$point1 <- renderPlot({
    ggplot(
      data = filter(iris, Species == input$species1), 
      mapping = aes(x = .data[[input$col1x]], y = .data[[input$col1y]])
    ) + geom_point()
  })
  output$point2 <- renderPlot({
    ggplot(
      data = filter(iris, Species == input$species2), 
      mapping = aes(x = .data[[input$col2x]], y = .data[[input$col2y]])
    ) + geom_point()
  })
  output$point12 <- renderPlot({
    p1 <- ggplot(
      data = filter(iris, Species == input$species1), 
      mapping = aes(x = .data[[input$col1x]], y = .data[[input$col1y]])
    ) + geom_point()
    p2 <- ggplot(
      data = filter(iris, Species == !!input$species2), 
      mapping = aes(x = .data[[input$col2x]], y = .data[[input$col2y]])
    ) + geom_point()
    ggarrange(p1, p2, ncol = 2, labels = LETTERS)
  })
}

shinyApp(ui, server)
