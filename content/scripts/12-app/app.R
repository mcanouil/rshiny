library("shiny")

ui <- fluidPage(
  verbatimTextOutput("text"),
  verbatimTextOutput("code")
)

server <- function(input, output, session) {
  output$text <- renderText({ 
    summary(rnorm(10))
  })
  
  output$code <- renderPrint({
    summary(rnorm(10))
  })
}

shinyApp(ui, server)
