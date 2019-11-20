library("shiny")

###<b>
ui <- fluidPage(
  titlePanel("Un titre !"),
  sidebarLayout(
    sidebarPanel(
###</b>
      sliderInput("point", "Point :", min = 0, max = 20, value = 5)
###<b>
    ),
    mainPanel(
###</b>
      plotOutput("plot", height = "500px")
###<b>
    )
  )
)
###</b>

server <- function(input, output, session) {
  output$plot <- renderPlot(plot(1:10))
}

shinyApp(ui, server)
