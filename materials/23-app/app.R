library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : "),
  p(
    "Le texte saisi est : ", 
    textOutput("text", inline = TRUE)
  )
)

server <- function(input, output, session) {
  ###<b>
  message("Le texte saisi est : ", input$text)
  ###</b>
  output$text <- renderText({ input$text })
}

shinyApp(ui, server)
