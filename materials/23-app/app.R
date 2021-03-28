library("shiny")
library("shinydashboard")

ui <- dashboardPage(
  dashboardHeader(title = "Shiny App"),
  dashboardSidebar(
    textInput("title", "Titre :", value = "Titre"),
    sliderInput("point", "Point :", min = 0, max = 20, value = 5),
    sliderInput("mean", "Moyenne :", min = 0, max = 2, value = 1)
  ),
  dashboardBody(
    fluidRow(
      box(plotOutput("plot"), width = 6),
      box(title = "Density", plotOutput("plot2"), width = 6)
    )
  )
)

server <- function(input, output) {
  output$plot <- renderPlot(plot(1:10))
  output$plot2 <- renderPlot(plot(density(rnorm(n = 25))))
}

shinyApp(ui, server)
