library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  ###<b>
  input$text <- "Du texte par défaut ..."
  ###</b>
  output$text <- renderText(input$text)
}

shinyApp(ui, server)
