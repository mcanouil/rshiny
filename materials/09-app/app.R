library("shiny")

ui <- fluidPage(
  ###<b>
  textOutput("text"),
  verbatimTextOutput("code")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$text <- renderText({ 
  ###</b>
    "Bonjour, vous êtes sur une application Shiny !"
  ###<b>
  })
  output$code <- renderPrint({ 
  ###</b>
    summary(rnorm(10))
  ###<b>
  })
  ###</b>
}

shinyApp(ui, server)
