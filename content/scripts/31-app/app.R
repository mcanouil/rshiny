library("shiny")

ui <- fluidPage(
  textInput("text", "Texte : ", value = "vide"),
  p("Texte 1 : ", textOutput("text", inline = TRUE)),
  p("Texte 2 : ", textOutput("text2", inline = TRUE))
)

server <- function(input, output, session) {
  output$text <- renderText({
    message('Calcul de "text" ...')
    input$text
  })
  output$text1 <- renderText({
    message('Calcul de "text1" ...')
    input$text
  })
}

shinyApp(ui, server)
