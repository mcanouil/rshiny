library("shiny")

ui <- fluidPage(
  ###<b>
  tableOutput("static")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$static <- renderTable(expr = head(swiss, 5))
  ###</b>
}

shinyApp(ui, server)
