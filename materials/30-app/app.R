library("shiny")
library("dplyr")
library("ggplot2")
library("ggpubr")

ui <- fluidPage(
  ###<b>
  fluidRow(column(12, actionButton("update", "Actualiser"), offset = 5)),
  ###</b>
  fluidRow(
    column(4, 
     "Exemple 1",
      textInput("species1", "Espèce: ", value = "setosa"),
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
  iris_species1 <- eventReactive(input$update, { filter(iris, Species == !!input$species1) })
  iris_species2 <- eventReactive(input$update, { filter(iris, Species == !!input$species2) })
  ###</b>
  
  ###<b>
  gg_species1 <- eventReactive(input$update, {
  ###</b>
    ggplot(
      ###<b>
      data = iris_species1(), 
      mapping = aes(x = !!sym(input$col1x), y = !!sym(input$col1y))
      ###</b>
    ) + geom_point()
  ###<b>
  })
  gg_species2 <- eventReactive(input$update, {
  ###</b>
    ggplot(
      ###<b>
      data = iris_species2(), 
      mapping = aes(x = !!sym(input$col2x), y = !!sym(input$col2y))
      ###</b>
    ) + geom_point()
  ###<b>
  })
  ###</b>
  ###<b>
  output$point1 <- renderPlot(gg_species1())
  output$point2 <- renderPlot(gg_species2())
  ###</b>
  output$point12 <- renderPlot({
    ###<b>
    ggarrange(gg_species1(), gg_species2(), ncol = 2, labels = LETTERS)
    ###</b>
  })
}

shinyApp(ui, server)
