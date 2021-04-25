library("shiny")

ui <- fluidPage(
  textInput(inputId = "name", label = "Nom", value = "default"),
  textOutput(outputId = "hello_message")
)

server <- function(input, output, session) {
  output$hello_message <- renderText("Bonjour")
}

shinyApp(ui, server)
