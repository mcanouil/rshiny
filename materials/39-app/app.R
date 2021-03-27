library("shiny")

ui <- fluidPage(
  textInput("text", "texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText({
    ###<b>
    validate(need(
      expr = input$text == "texte", 
      message = '[NOTE] Le texte saisie est différent de "texte".'
    ))
    ###</b>
    paste("Ceci est un texte saisie :", input$text)
  })
}

shinyApp(ui, server)
