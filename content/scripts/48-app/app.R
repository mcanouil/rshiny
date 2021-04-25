library("shiny")
library("dplyr")

ui <- fluidPage(
  column(4,
    sliderInput(
      "Sepal.Length", "Sepal.Length", 
      min = min(iris$Sepal.Length), max = max(iris$Sepal.Length), 
      value = range(iris$Sepal.Length)
    ),
    sliderInput(
      "Sepal.Width", "Sepal.Width", 
      min = min(iris$Sepal.Width), max = max(iris$Sepal.Width), 
      value = range(iris$Sepal.Width)
    ),
    sliderInput(
      "Petal.Length", "Petal.Length", 
      min = min(iris$Petal.Length), max = max(iris$Petal.Length), 
      value = range(iris$Petal.Length)
    ),
    sliderInput(
      "Petal.Width", "Petal.Width", 
      min = min(iris$Petal.Width), max = max(iris$Petal.Width), 
      value = range(iris$Petal.Width)
    ),
    selectInput(
      "Species", "Species", 
      choices = unique(iris$Species), selected = unique(iris$Species), 
      multiple = TRUE
    )
  ),
  column(8, tableOutput("iris"))
)

server <- function(input, output, session) {
  output$iris <- renderTable({
    filter(iris,
      between(Sepal.Length, input$Sepal.Length[1], input$Sepal.Length[2]),
      between(Sepal.Width, input$Sepal.Width[1], input$Sepal.Width[2]),
      between(Petal.Length, input$Petal.Length[1], input$Petal.Length[2]),
      between(Petal.Width, input$Petal.Width[1], input$Petal.Width[2]),
      Species %in% input$Species
    )
  })
}

shinyApp(ui, server)
