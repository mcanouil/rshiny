library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : "),
  p(
    "Le texte saisi est : ", 
    textOutput("text", inline = TRUE)
  )
)

server <- function(input, output, session) {
  output$text <- renderText({ input$text })
  message("Le texte saisi est : ", output$text)
}

shinyApp(ui, server)
