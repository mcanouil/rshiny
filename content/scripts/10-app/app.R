library("shiny")

ui <- fluidPage(
  textOutput("text"),
  verbatimTextOutput("code")
)

server <- function(input, output, session) {
  output$text <- renderText({
    "Bonjour, vous êtes sur une application Shiny !"
  })

  output$code <- renderPrint({
    summary(rnorm(10))
  })
}

shinyApp(ui, server)
