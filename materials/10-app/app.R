library("shiny")

ui <- fluidPage(
  ###<b>
  textOutput("text"),
  textOutput("code")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$text <- renderText({ 
  ###</b>
    "Du texte"
  ###<b>
  })
  output$code <- renderPrint({ 
  ###</b>
    "Du code"
  ###<b>
  })
  ###</b>
}

shinyApp(ui, server)
