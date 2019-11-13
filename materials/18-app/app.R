library("shiny")

###<b>
ui <- navbarPage("App Title",
  tabPanel("Figures", 
    tabsetPanel(
      tabPanel("point", plotOutput("plot")),
      tabPanel("Densité", plotOutput("plot2"))
    )
  ),
  tabPanel("Table", tableOutput("desc"))
)
###</b>

server <- function(input, output) {
  output$plot <- renderPlot(plot(1:10))
  output$plot2 <- renderPlot(plot(density(rnorm(n = 25))))
  output$desc <- renderTable(head(iris))
}

shinyApp(ui, server)
