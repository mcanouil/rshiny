library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : "),
  p(
    "Le texte saisi est : ", 
    textOutput("text", inline = TRUE)
  )
)

server <- function(input, output, session) {
  message("Le texte saisi est : ", input$text)
  output$text <- renderText({ input$text })
}

shinyApp(ui, server)
