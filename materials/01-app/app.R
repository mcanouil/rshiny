library("shiny")

###<b>
ui <- fluidPage(
###</b>
  ###<b>
  textInput(inputId = "name", label = "Nom", value = "default")
  ###</b>
###<b>
)
###</b>

server <- function(input, output, session) { }

shinyApp(ui, server)
