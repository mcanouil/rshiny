library("shiny")

ui <- fluidPage(
  ###<b>
  dataTableOutput("dynamic")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  # Light version of DT::renderDataTable (server side)
  output$dynamic <- renderDataTable(
    expr = swiss, options = list(pageLength = 2)
  )
  ###</b>
}

shinyApp(ui, server)
