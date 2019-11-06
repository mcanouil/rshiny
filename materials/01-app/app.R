library(shiny)

###<b>
ui <- fluidPage(
  ###</b>
  ###<b>
  textInput(inputId = "name", label = "Nom", value = "default"),
  ###</b>
  ###<b>
  textOutput(outputId = "name")
  ###</b>
  ###<b>
)
###</b>

server <- function(input, output, session) { }

shinyApp(ui, server)
