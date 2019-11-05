library(shiny)

ui <- fluidPage("Bonjour, vous êtes sur une application Shiny !")

server <- function(input, output, session) { }

shinyApp(ui, server)
