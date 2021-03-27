library("shiny")

ui <- fluidPage(
  tableOutput("static")
)

server <- function(input, output, session) {
  output$static <- renderTable({
    head(swiss, 5)
  })
}

shinyApp(ui, server)
