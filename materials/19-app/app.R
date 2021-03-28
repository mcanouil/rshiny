library("shiny")

ui <- fluidPage(
  titlePanel("Un titre !"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("point", "Point :", min = 0, max = 20, value = 5)
    ),
    mainPanel(
      plotOutput("plot", height = "500px")
    )
  )
)

server <- function(input, output, session) {
  output$plot <- renderPlot(plot(1:10))
}

shinyApp(ui, server)
