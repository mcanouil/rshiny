library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  input$text <- "Du texte par défaut ..."
  output$text <- renderText({ input$text })
}

shinyApp(ui, server)
