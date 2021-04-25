library("shiny")

ui <- fluidPage(
  textInput(
    inputId = "text",
    label =  "Texte : ", 
    value = "Du texte par défaut ..."
  ),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText({
    input$text
  })
}

shinyApp(ui, server)
