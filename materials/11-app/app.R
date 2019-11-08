library("shiny")

ui <- fluidPage(
  ###<b>
  verbatimTextOutput("text"),
  verbatimTextOutput("code")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$text <- renderText({ 
  ###</b>
    summary(rnorm(10))
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
