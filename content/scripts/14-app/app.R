library("shiny")

ui <- fluidPage(
  dataTableOutput("dynamic")
)

server <- function(input, output, session) {
  # light DT::renderDataTable
  output$dynamic <- renderDataTable(swiss, options = list(pageLength = 2))
}

shinyApp(ui, server)
