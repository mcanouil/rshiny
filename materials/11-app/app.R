library("shiny")

ui <- fluidPage(
  ###<b>
  verbatimTextOutput("text"),
  verbatimTextOutput("code")
  ###</b>
)

server <- function(input, output, session) {
  ###<b>
  output$text <- renderText({ summary(rnorm(10)) })
  output$code <- renderPrint({ summary(rnorm(10)) })
  ###</b>
}

shinyApp(ui, server)
