library("shiny")

ui <- fluidPage(
  textInput(inputId = "name", label = "Nom", value = "default")
)

server <- function(input, output, session) { }

shinyApp(ui, server)
