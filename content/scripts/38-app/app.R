library("shiny")

ui <- fluidPage(
  textInput("text", "texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText({
    req(input$text)
    paste("Ceci est un texte saisie :", input$text)
  })
}

shinyApp(ui, server)
