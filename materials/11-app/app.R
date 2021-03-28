library("shiny")

ui <- fluidPage(
  textOutput("text"),
  textOutput("code")
)

server <- function(input, output, session) {
  output$text <- renderText({ 
    "Du texte"
  })
  
  output$code <- renderPrint({
    "Du code"
  })
}

shinyApp(ui, server)
