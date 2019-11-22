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
  ###<b>
  iris1 <- reactive({ filter(iris, Species == input$species1) })
  iris2 <- reactive({ filter(iris, Species == input$species2) })
  ###</b>
  output$point1 <- renderPlot({
    ###<b>
    ggplot(iris1(), aes(x = .data[[input$col1x]], y = .data[[input$col1y]])) + 
    ###</b>
      geom_point()
  })
  output$point2 <- renderPlot({
    ###<b>
    ggplot(iris2(), aes(x = .data[[input$col2x]], y = .data[[input$col2y]])) + 
    ###</b>
      geom_point()
  })
  output$point12 <- renderPlot({
    ###<b>
    p1 <- ggplot(iris1(), aes(x = .data[[input$col1x]], y = .data[[input$col1y]])) + 
    ###</b>
      geom_point()
    ###<b>
    p2 <- ggplot(iris2(), aes(x = .data[[input$col2x]], y = .data[[input$col2y]])) + 
    ###</b>
      geom_point()
    ggarrange(p1, p2, ncol = 2, labels = LETTERS)
  })
}

shinyApp(ui, server)
