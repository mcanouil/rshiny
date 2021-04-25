library("shiny")

ui <- fluidPage(
  textInput("text", "texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText({
    validate(need(
      expr = input$text == "texte", 
      message = 'Un texte différent de "texte".'
    ))
    paste("Ceci est un texte saisie :", input$text)
  })
}

shinyApp(ui, server)
