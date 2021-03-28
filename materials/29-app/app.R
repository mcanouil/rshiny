library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText({ input$text })
  output$text <- "Du texte par défaut ..."
}

shinyApp(ui, server)
