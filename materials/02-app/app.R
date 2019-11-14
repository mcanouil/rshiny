library("shiny")

###<b>
ui <- fluidPage(
###</b>
  ###<b>
  textInput(inputId = "name", label = "Nom", value = "default"),
  ###</b>
  ###<b>
  textOutput(outputId = "hello_message")
  ###</b>
###<b>
)
###</b>

###<b>
server <- function(input, output, session) {
###</b>
  ###<b>
  output$hello_message <- renderText("Bonjour")
  ###</b>
###<b>
}
###</b>

shinyApp(ui, server)
