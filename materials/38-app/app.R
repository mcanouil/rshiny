library("shiny")

ui <- fluidPage(
  textInput("text", "texte : "),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText({
    ###<b>
    req(input$text)
    ###</b>
    paste("Ceci est un texte saisie :", input$text)
  })
}

shinyApp(ui, server)
