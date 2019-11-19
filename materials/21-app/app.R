library("shiny")

ui <- fluidPage(
  textInput(
    ###<b>
    inputId = "text",
    ###</b>
    label =  "Texte : ", value = "Du texte par défaut ..."
  ),
  textOutput("text")
)

server <- function(input, output, session) {
  output$text <- renderText({
    ###<b>
    input$text
    ###</b>
  })
}

shinyApp(ui, server)
