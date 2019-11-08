library("shiny")

ui <- fluidPage(
  ###<b>
  dataTableOutput("dynamic")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$dynamic <- renderDataTable(
    expr = swiss, options = list(pageLength = 2)
  )
  ###</b>
}

shinyApp(ui, server)
