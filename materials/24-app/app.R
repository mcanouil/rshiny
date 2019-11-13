library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText(input$text)
  ###<b>
  output$text <- "Du texte par défaut ..."
  ###</b>
}

shinyApp(ui, server)
